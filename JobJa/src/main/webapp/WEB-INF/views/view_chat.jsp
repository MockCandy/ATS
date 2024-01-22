<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="/resources/css/chat.css">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/sockjs-client/1.4.0/sockjs.js"></script>
<script type="text/javascript">
	var webSocket = {
		init: function(param) {
			this._url = param.url;
			this._initSocket();
		},
		sendChat: function() {
			this._sendMessage('${param.bang_id}', 'CMD_MSG_SEND', $('#message').val(), '${getCurrentLoginVO.memId}', '${getCurrentLoginVO.memNm}', '${getCurrentLoginVO.memAfId}');
			$('#message').val('');
		},
		sendEnter: function() {
			this._sendMessage('${param.bang_id}', 'CMD_ENTER', $('#message').val(), '${getCurrentLoginVO.memId}', '${getCurrentLoginVO.memNm}', '${getCurrentLoginVO.memAfId}');
			$('#message').val('');
		},
		receiveMessage: function(msgData) {
			
			let strTemp = '';
			
			console.log(msgData);
			
			let loginMemId = '${getCurrentLoginVO.memId}';

			// 정의된 CMD 코드에 따라서 분기 처리
			if(msgData.cmd == 'CMD_MSG_SEND') {

				let memAfId = msgData.memAfId;
				console.log(memAfId);
				
				let memName = msgData.msg.split(":")[0];
				console.log(memName);
				let chatDate = msgData.msg.split("\t")[1];
				console.log(chatDate);
				let chatCntnt = msgData.msg.split("\t")[0].split(":")[1];
				console.log(chatCntnt);
				
				if(loginMemId == msgData.memId) {

					strTemp += 	'<div class="myChat chat">                                                                          ';
					strTemp +=	'			<div class="profile">                                                                   ';
					strTemp +=	'				<div class="profile-img">                                                           ';
					if(memAfId == null || memAfId == '') {                                                                                          
						strTemp +=	'<img alt="" src="/resources/images/empty-profile.png">';							           
					}else{
						strTemp +=	'<img alt="" src="/resources/upload/'+memAfId+'">';							           						
					}                                                                                                       
					strTemp +=	'				</div>                                                                              ';
					strTemp +=	'				<p class="profile-name">'+memName+'</p>                                                        ';
					strTemp +=	'			</div>                                                                                  ';
					strTemp +=	'			<div class="chatArea">                                                                  ';
					strTemp +=	'				<p class="chatCntnt">'+chatCntnt+'</p>                                                ';
					strTemp +=	'				<p class="chatDate">'+chatDate+'</p>                                         ';
					strTemp +=	'			</div>                                                                                  ';
					strTemp +=	'		</div>';    
				}else {
					strTemp += 	'<div class="oppChat chat">                                                                          ';
					strTemp +=	'			<div class="chatArea">                                                                  ';
					strTemp +=	'				<p class="chatCntnt">'+chatCntnt+'</p>                                                ';
					strTemp +=	'				<p class="chatDate">'+chatDate+'</p>                                         ';
					strTemp +=	'			</div>                                                                                  ';
					strTemp +=	'			<div class="profile">                                                                   ';
					strTemp +=	'				<div class="profile-img">                                                           ';
					if(memAfId == null || memAfId == '') {                                                                                          
						strTemp +=	'<img alt="" src="/resources/images/empty-profile.png">';							           
					}else{
						strTemp +=	'<img alt="" src="/resources/upload/'+memAfId+'">';							           						
					}                                                                                                       
					strTemp +=	'				</div>                                                                              ';
					strTemp +=	'				<p class="profile-name">'+memName+'</p>                                                        ';
					strTemp +=	'			</div>                                                                                  ';
					strTemp +=	'		</div>'; 
				}
				$('#chat-room').append(strTemp);
				scrollDown();
			}
			// 입장
			else if(msgData.cmd == 'CMD_ENTER') {
				$('#chat-room').append('<div>' + msgData.msg + '</div>');
			}
			// 퇴장
			else if(msgData.cmd == 'CMD_EXIT') {					
				$('#chat-room').append('<div>' + msgData.msg + '</div>');
			}
		},
		closeMessage: function(str) {
			$('#chat-room').append('<div>' + '연결 끊김 : ' + str + '</div>');
		},
		disconnect: function() {
			this._socket.close();
		},
		_initSocket: function() {
			this._socket = new SockJS(this._url);
			this._socket.onopen = function(evt) {
				webSocket.sendEnter();
			};
			this._socket.onmessage = function(evt) {
				webSocket.receiveMessage(JSON.parse(evt.data));
			};
			this._socket.onclose = function(evt) {
				webSocket.closeMessage(JSON.parse(evt.data));
			}
		},
		_sendMessage: function(bang_id, cmd, msg, memId, memNm, memAfId) {
			var msgData = {
					bang_id : bang_id,
					cmd : cmd,
					msg : msg,
					memId : memId,
					memNm : memNm,
					memAfId : memAfId
			};
			var jsonData = JSON.stringify(msgData);
			this._socket.send(jsonData);
		}
	};
</script>	
<script type="text/javascript">

	

	$(window).on('load', function () {
		
		let chatClose = '${chatClose}';
		
		
		if(chatClose == 1) {
			// 채팅방 연결
			webSocket.init({ url: '<c:url value="/chat" />' });
		} else {
			
			let tempStr = '<div>이미 종료된 상담입니다.</div>';
			
			$(".chatDiv").css("display", "none");
			$(".chatClosed").css("display", "flex");
			$(".chatClosed").html(tempStr);
		}
		
		let chatRoomId = '${param.bang_id}';
		
		let data = {
			"chatRoomId":chatRoomId	
		}
		
		$.ajax({
            url: "/chatting/getMessageList",
            contentType: "application/json;charset=utf-8",
            data: JSON.stringify(data), 
            type: "post",
            dataType: "json",
            beforeSend: function(xhr) {
                xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
            },
            success: function(rst) {
            	
//             	console.log("로드하고 아이디 줬냐 : ", rst);

				let strTemp = '';
				let loginMemId = '${getCurrentLoginVO.memId}';
				
				rst.forEach(function(message) {
					
					let messageMemId = message.memId;
					let memAfId = message.memAfId;
					
					if(loginMemId == messageMemId) {
						strTemp += 	'<div class="myChat chat">                                                                          ';
						strTemp +=	'			<div class="profile">                                                                   ';
						strTemp +=	'				<div class="profile-img">                                                           ';
						if(memAfId == null || memAfId == '') {                                                                                          
							strTemp +=	'<img alt="" src="/resources/images/empty-profile.png">';							           
						}else{
							strTemp +=	'<img alt="" src="/resources/upload/'+memAfId+'">';							           						
						}                                                                                                       
						strTemp +=	'				</div>                                                                              ';
						strTemp +=	'				<p class="profile-name">'+message.memNm+'</p>                                                        ';
						strTemp +=	'			</div>                                                                                  ';
						strTemp +=	'			<div class="chatArea">                                                                  ';
						strTemp +=	'				<p class="chatCntnt">'+message.chatCntnt+'</p>                                                ';
						strTemp +=	'				<p class="chatDate">'+message.chatDate+'</p>                                         ';
						strTemp +=	'			</div>                                                                                  ';
						strTemp +=	'		</div>';                                                                                    
					} else {
						strTemp += 	'<div class="oppChat chat">                                                                          ';
						strTemp +=	'			<div class="chatArea">                                                                  ';
						strTemp +=	'				<p class="chatCntnt">'+message.chatCntnt+'</p>                                                ';
						strTemp +=	'				<p class="chatDate">'+message.chatDate+'</p>                                         ';
						strTemp +=	'			</div>                                                                                  ';
						strTemp +=	'			<div class="profile">                                                                   ';
						strTemp +=	'				<div class="profile-img">                                                           ';
						if(memAfId == null || memAfId == '') {                                                                                          
							strTemp +=	'<img alt="" src="/resources/images/empty-profile.png">';							           
						}else{
							strTemp +=	'<img alt="" src="/resources/upload/'+memAfId+'">';							           						
						}                                                                                                       
						strTemp +=	'				</div>                                                                              ';
						strTemp +=	'				<p class="profile-name">'+message.memNm+'</p>                                                        ';
						strTemp +=	'			</div>                                                                                  ';
						strTemp +=	'		</div>';     
					}
					
				});

				$("#chat-room").html(strTemp);
				scrollDown();
            }
    	});
		
		$(document).on("click", "#closeChat", function() {
			
			let memCd = '${getCurrentLoginVO.memCd}';
			
			let chatClose = '${chatClose}';
			
			if(memCd == 'MCC01000') {
				
				let chatRoomId = '${param.bang_id}';
				
				if(chatClose == 0){
					history.back();
				}else {					
					if(!confirm("정말 상담을 종료하시겠습니까?")){
						return;
					}
				}
				
				$.ajax({
		            url: "/chatting/chatClose",
		            contentType: "application/json;charset=utf-8",
		            data: JSON.stringify(data), 
		            type: "post",
		            dataType: "json",
		            beforeSend: function(xhr) {
		                xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
		            },
		            success: function(rst) {
		            	
		            	// 일반회원이 상담 잔여횟수 차감 or 0일 때 그냥 home으로 보낸다.
		            	
// 		            	let count = rst.payRemndrCnt;
// 		            	console.log("awidjaowidiiiii : ", count);
		            	
// 		            	if (count > 0) {
						history.back();
// 		            	} else {
// 		            		window.location.href = "/consultantLog/consultantLogCreate?chatRoomId=" + '${param.bang_id}';
// 		            	}

		            }
		    	});
			} else if (memCd == 'MCC01002') {
			
				// 상담사 회원은 상품에 대해서 잔여횟수가
				window.location.href = "/consultantLog/consultantLogCreate?chatRoomId=" + '${param.bang_id}';
				
			}
			
			/*
				채팅횟수 1회 차감
				0회면 일반회원은 상담사 리뷰 남기기
				상담사 회원은 일반회원 상담기록 남기기
			*/
		});
	});
	
</script>
</head>
<body>
	<div class="chat-body">
		<div class="chat-top">
			<span class="back-arrow-btn">
				<i class="fa-solid fa-arrow-left" id="closeChat">
				</i>
			</span>
			<span class="opp-name">${memNm }</span>
		</div>
		<div id="chat-box">
			<div id="chat-room"></div>
		</div>
		<div class="chatDiv">
			<input type="text" id="message" size="110" onkeypress="if(event.keyCode==13){webSocket.sendChat();}" />
			<input type="button" id="btnSend" class="btn btn-sm bg-sig txt-white" value="채팅 전송" onclick="webSocket.sendChat()" />
		</div>
		<div class="chatClosed">
		</div>
	</div>
	
	
<!-- 	<div class="myChat chat"> -->
<!-- 		<div class="profile"> -->
<!-- 			<div class="profile-img"> -->
<!-- 				<img alt="" src="/resources/images/empty-profile.png"> -->
<!-- 			</div> -->
<!-- 			<p class="profile-name">심우식</p> -->
<!-- 		</div> -->
<!-- 		<div class="chatArea"> -->
<!-- 			<p class="chatCntnt">똥머거랑랑 데 sadasd asdas dsd asda asd sda asdasd asd asd asd  -->
<!-- 			asd asd asd asd asd asd asd das </p> -->
<!-- 			<p class="chatDate">2024-01-08 15:20:28</p> -->
<!-- 		</div> -->
<!-- 	</div> -->
	
	
<!-- 	<div class="oppChat chat"> -->
<!-- 		<div class="chatArea"> -->
<!-- 			<p class="chatCntnt">똥머거랑랑 데 sadasd asdas dsd asda asd sda asdasd asd asd asd  -->
<!-- 			asd asd asd asd asd asd asd das </p> -->
<!-- 			<p class="chatDate">2024-01-08 15:20:28</p> -->
<!-- 		</div> -->
<!-- 		<div class="profile"> -->
<!-- 			<div class="profile-img"> -->
<!-- 				<img alt="" src="/resources/images/empty-profile.png"> -->
<!-- 			</div> -->
<!-- 			<p class="profile-name">심우식</p> -->
<!-- 		</div> -->
<!-- 	</div> -->
</body>
</html>

<script type="text/javascript">
	
	function scrollDown(){
		let chatBox = document.querySelector("#chat-box");
		let chatRoom = document.querySelector("#chat-room");
		let scrollTop = chatBox.scrollHeight;
		let scrollTop2 = chatRoom.scrollHeight;
		console.log(chatBox);
		console.log(chatRoom);
		console.log(scrollTop);
		console.log(scrollTop2);
		chatBox.scrollTo(0, scrollTop2);
	}
</script>

