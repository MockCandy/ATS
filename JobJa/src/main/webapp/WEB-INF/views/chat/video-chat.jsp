<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"  %>

<script src="https://cdnjs.cloudflare.com/ajax/libs/adapterjs/0.16.0/adapter.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/stomp.js/2.3.3/stomp.js"></script>

<video id="localVideo" autoplay></video>
<video id="remoteVideo" autoplay></video>

<script>

const localVideo = document.getElementById('localVideo');
const remoteVideo = document.getElementById('remoteVideo');
let stompClient;

navigator.mediaDevices.getUserMedia({ video: true, audio: true })
    .then(stream => {
        localVideo.srcObject = stream;
        initWebSocket(stream);
    })
    .catch(error => console.error('Error accessing media devices:', error));

function initWebSocket(localStream) {
    const socket = new WebSocket('ws://localhost:80/ws');
    stompClient = Stomp.over(socket);

    stompClient.connect({}, frame => {
        console.log('Connected: ' + frame);

        stompClient.subscribe(`/topic/${roomId}`, message => {
            handleMessage(JSON.parse(message.body), localStream);
        });
    });
}

function sendSignalingMessage(type, data) {
    const signalingMessage = {
        type: type,
        data: data,
        roomId: roomId
    };
    stompClient.send(`/app/${type}`, {}, JSON.stringify(signalingMessage));
}

function handleMessage(message, localStream) {
    if (message.type === 'offer' || message.type === 'answer') {
        handleOfferOrAnswer(message, localStream);
    } else if (message.type === 'ice-candidate') {
        handleIceCandidate(message);
    }
}

function handleOfferOrAnswer(message, localStream) {
    const peerConnection = createPeerConnection(localStream);

    peerConnection.setRemoteDescription(new RTCSessionDescription(message))
        .then(() => {
            if (message.type === 'offer') {
                return peerConnection.createAnswer();
            } else {
                return Promise.resolve();
            }
        })
        .then(answer => {
            return peerConnection.setLocalDescription(answer);
        })
        .then(() => {
            sendSignalingMessage('answer', peerConnection.localDescription);
        })
        .catch(error => console.error('Error handling offer or answer:', error));
}

function handleIceCandidate(message) {
    const peerConnection = stompClient.peerConnection;
    if (peerConnection) {
        peerConnection.addIceCandidate(new RTCIceCandidate(message))
            .catch(error => console.error('Error handling ice candidate:', error));
    }
}

function createPeerConnection(localStream) {
    const peerConnection = new RTCPeerConnection();

    peerConnection.addStream(localStream);

    peerConnection.onicecandidate = event => {
        if (event.candidate) {
            sendSignalingMessage('ice-candidate', event.candidate);
        }
    };

    stompClient.peerConnection = peerConnection;

    return peerConnection;
}
</script>