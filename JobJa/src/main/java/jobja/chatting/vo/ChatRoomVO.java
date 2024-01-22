package jobja.chatting.vo;

import lombok.Data;

@Data
public class ChatRoomVO {
	
	private String chatRoomId;			// 채팅방ID				
	private String chatMemId;			// 채팅방 회원ID
	private String chatMemNm;			// 채팅방 회원이름
	private String chatConMemId;		// 채팅방 상담사 ID
	private String chatConMemNm;		// 채팅방 상담사이름
	private String chatClose;			// 채팅방 종료 여부
	private String lastChatCntnt;		// 채팅방 마지막 메세지
	private String maxChatDate;			// 채팅방 마지막 메세지 시간

}
