package jobja.chatting.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import jobja.chatting.mapper.ChattingMapper;
import jobja.chatting.service.ChattingService;
import jobja.chatting.vo.ChatRoomVO;
import jobja.chatting.vo.MessageVO;
import jobja.mypage.member.vo.MemberVO;

@Service
public class ChattingServiceImpl implements ChattingService {
	
	@Autowired
	ChattingMapper chattingMapper;

	@Override
	public List<MemberVO> getConsultantList(String memId) {
		
		return this.chattingMapper.getConsultantList(memId);
	}

	@Override
	public int createRoom(Map<String, Object> map) {
		
		return this.chattingMapper.createRoom(map);
	}

	@Override
	public List<ChatRoomVO> getChatRoom(Map<String, Object> map) {
		
		return this.chattingMapper.getChatRoom(map);
	}

	@Override
	public int sendMessage(Map<String, Object> messageMap) {
		
		return this.chattingMapper.sendMessage(messageMap);
	}

	@Override
	public List<MessageVO> getMessageList(String chatRoomId) {
		
		return this.chattingMapper.getMessageList(chatRoomId);
	}

	@Override
	public ChatRoomVO getRoomInfo(String chatRoomId) {
		
		return this.chattingMapper.getRoomInfo(chatRoomId);
	}

	@Override
	public int decreaseCnt(String chatRoomId) {
		
		return this.chattingMapper.decreaseCnt(chatRoomId);
	}

	@Override
	public int chatClose(String chatRoomId) {
		
		return this.chattingMapper.chatClose(chatRoomId);
	}

	@Override
	public int payRemndrCnt(String chatRoomId) {
		
		return this.chattingMapper.payRemndrCnt(chatRoomId);
	}

	@Override
	public String chatCloseCheck(String bang_id) {
		
		return this.chattingMapper.chatCloseCheck(bang_id);
	}

	@Override
	public ChatRoomVO getChatRoomInfo(String bang_id) {
		
		return this.chattingMapper.getChatRoomInfo(bang_id);
	}

	@Override
	public String getConName(String conTempId) {
		
		return this.chattingMapper.getConName(conTempId);
	}

	@Override
	public String getMemName(String memTempId) {
		
		return this.chattingMapper.getMemName(memTempId);
	}

	@Override
	public List<MemberVO> getMemberList(String memId) {
		
		return this.chattingMapper.getMemberList(memId);
	}

}
