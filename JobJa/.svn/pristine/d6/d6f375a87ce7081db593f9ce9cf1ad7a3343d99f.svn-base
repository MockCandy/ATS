package jobja.chatting.mapper;

import java.util.List;
import java.util.Map;

import jobja.chatting.vo.ChatRoomVO;
import jobja.chatting.vo.MessageVO;
import jobja.mypage.member.vo.MemberVO;

public interface ChattingMapper {

	// 결제한 상담사 목록 출력
	public List<MemberVO> getConsultantList(String memId);

	// 채팅방 insert
	public int createRoom(Map<String, Object> map);

	// 채팅방 List
	public List<ChatRoomVO> getChatRoom(Map<String, Object> map);

	// 메세지 테이블 insert
	public int sendMessage(Map<String, Object> messageMap);

	// 채팅방 메세지 가져오기
	public List<MessageVO> getMessageList(String chatRoomId);

	// 채팅방 정보 가져오기
	public ChatRoomVO getRoomInfo(String chatRoomId);

	// 채팅방 횟수 차감
	public int decreaseCnt(String chatRoomId);

	// 채팅방 종료
	public int chatClose(String chatRoomId);

	// 채팅방 잔여횟수
	public int payRemndrCnt(String chatRoomId);

	// 채팅방 종료 여부
	public String chatCloseCheck(String bang_id);

	// 채팅방 정보 가져오기
	public ChatRoomVO getChatRoomInfo(String bang_id);

	// 상담사 이름 가져오기
	public String getConName(String conTempId);

	// 일반회원 이름 가져오기
	public String getMemName(String memTempId);

	// 상담사가 채팅중인 일반회원 목록 가져오기
	public List<MemberVO> getMemberList(String memId);

}
