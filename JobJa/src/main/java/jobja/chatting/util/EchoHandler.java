package jobja.chatting.util;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import jobja.alarm.mapper.AlarmMapper;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Component
@RequestMapping("/echo")
public class EchoHandler extends TextWebSocketHandler {

//   @Autowired
//   private AlarmMapper alarmMapper;

   // 로그인한 모든 유저
   private List<WebSocketSession> sessions = new ArrayList<WebSocketSession>();

   // 현재 로그인 중인 개별 유저
   private Map<String, WebSocketSession> users = new ConcurrentHashMap<String, WebSocketSession>();

   /**
    * 웹소켓 연결 성공 시
    */
   @Override
   public void afterConnectionEstablished(WebSocketSession session) throws Exception {
      log.info("afterConnectionEstablished(소켓 연결): {}" + session);
      
      String userId = getId(session);
      log.info("userId: {}", userId);
      
      users.put(userId, session);
      sessions.add(session); // 웹 소켓이 생성될때마다 리스트에 넣어줌
   }

   /**
    * 웹소켓 메시지 수신 및 송신
    */
   @Override
   protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
      String msg = message.getPayload(); // jsp에서 받은 메시지 (ajax에서 socket.send()로 보낸 메시지... ex)주문 버튼을 눌렀을때)
      log.info("msg: {}", msg);
//      log.info("msg: {}", msg);
      // 채팅과 알림 분기처리 해야함
      // ex)
//      if ("chat".equals("type")) {
//            handleChatMessage(session, msg);
//        } else if ("notification".equals("type")) {
//            handleNotificationMessage(session, msg);
//        }
      
      
      
   }

   @Override
   public void handleTransportError(WebSocketSession session, Throwable exception) throws Exception {
      logMessage(session.getId() + "익셉션!!!!: " + exception.getMessage());
   }

   private void logMessage(String logmsg) {
      log.info("알람로그: " + new Date() + " : " + logmsg);
   }

   /**
    * 웹소켓 연결 죵료 시
    */
   @Override
   public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
      String senderId = session.getId();
      if (senderId != null) {
         log.info(senderId + "연결 종료됨");
         
         users.remove(senderId);
         sessions.remove(session);
      }
   }
   
   private String getId(WebSocketSession session) {
      Map<String, Object> httpSession = session.getAttributes();
      String userId = (String) httpSession.get("userId"); // 세션에 저장된 userId 기준 조회
      
      return userId==null?null:userId;
   }

}