package jobja.chatting.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.collections4.map.HashedMap;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import jobja.chatting.service.ChattingService;
import jobja.chatting.vo.ChatRoomVO;
import jobja.chatting.vo.MessageVO;
import jobja.item.vo.PaymentVO;
import jobja.mypage.member.vo.MemberVO;
import jobja.util.ModelAttributeUtil;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@RequestMapping("/chatting")
@Controller
public class ChattingController {

	@Autowired
	ModelAttributeUtil modelAttributeUtil;

	@Autowired
	ChattingService chattingService;

	// 채팅방 입장
	@GetMapping("/chatRoom")
	public String view_chat(HttpServletRequest request, HttpServletResponse response, Model model) throws Exception {

		Map<String, String> param = new HashMap<String, String>();
		String bang_id = request.getParameter("bang_id");

		String chatClose = this.chattingService.chatCloseCheck(bang_id);
		String memNm = "";

		MemberVO memberVO = modelAttributeUtil.getCurrentLoginName();
		String memId = memberVO.getMemId();

		ChatRoomVO chatRoomVO = this.chattingService.getChatRoomInfo(bang_id);

		if (chatRoomVO.getChatMemId().equals(memId)) {
			String conTempId = chatRoomVO.getChatConMemId();
			memNm = this.chattingService.getConName(conTempId);
		} else {
			String memTempId = chatRoomVO.getChatMemId();
			memNm = this.chattingService.getMemName(memTempId);
		}

		param.put("bang_id", bang_id);
		param.put("chatClose", chatClose);

		model.addAttribute("param", param);
		model.addAttribute("bang_id", bang_id);
		model.addAttribute("chatClose", chatClose);
		model.addAttribute("memNm", memNm);

		return "view_chat";
	}

	@ResponseBody
	@PostMapping("/getConsultantList")
	public List<MemberVO> getConsultantList(Model model) {

		MemberVO memberVO = modelAttributeUtil.getCurrentLoginName();

		String memId = memberVO.getMemId();

		List<MemberVO> memberVOList = this.chattingService.getConsultantList(memId);

		log.info("getConsultantList -> memberVOList : " + memberVOList);

		return memberVOList;
	}

	@ResponseBody
	@PostMapping("/getMemberList")
	public List<MemberVO> getMemberList(Model model) {

		MemberVO memberVO = modelAttributeUtil.getCurrentLoginName();

		String memId = memberVO.getMemId();

		List<MemberVO> memberVOList = this.chattingService.getMemberList(memId);

		log.info("getMemberList -> memberVOList : " + memberVOList);

		return memberVOList;
	}

	@ResponseBody
	@PostMapping("/createRoom")
	public Map<String, Object> createRoom(@RequestBody Map<String, String> requestData, Model model) {

		MemberVO memberVO = modelAttributeUtil.getCurrentLoginName();

		Map<String, Object> map = new HashedMap<String, Object>();

		// 로그인한 회원 ID
		String memId = memberVO.getMemId();
		// 상담사 ID
		String memIdCon = requestData.get("memId");

		map.put("memId", memId);
		map.put("memIdCon", memIdCon);

		int result = this.chattingService.createRoom(map);
		log.info("createRoom -> result : " + result);

		return map;
	}

	@ResponseBody
	@PostMapping("/getChatRoom")
	public List<ChatRoomVO> getChatRoom(Model model) {

		Map<String, Object> map = new HashMap<String, Object>();

		MemberVO memberVO = modelAttributeUtil.getCurrentLoginName();
		String memId = memberVO.getMemId();
		String memCd = memberVO.getMemCd();

		map.put("memId", memId);
		map.put("memCd", memCd);

		List<ChatRoomVO> chatRoomVOList = this.chattingService.getChatRoom(map);

		log.info("getChatRoom -> chatRoomVOList : " + chatRoomVOList);

		return chatRoomVOList;
	}

	@ResponseBody
	@PostMapping("/getMessageList")
	public List<MessageVO> getMessageList(@RequestBody Map<String, String> requestData, Model model) {

		String chatRoomId = requestData.get("chatRoomId");

		List<MessageVO> messageVOList = this.chattingService.getMessageList(chatRoomId);

		return messageVOList;
	}

	@Transactional
	@ResponseBody
	@PostMapping("/chatClose")
	public Map<String, Object> chatClose(@RequestBody Map<String, String> requestData, Model model) {

		String chatRoomId = requestData.get("chatRoomId");

		// 채팅방 횟수 차감
		int result = this.chattingService.decreaseCnt(chatRoomId);
		// 채팅방 종료
		result += this.chattingService.chatClose(chatRoomId);

		int payRemndrCnt = this.chattingService.payRemndrCnt(chatRoomId);

		Map<String, Object> resultMap = new HashMap<String, Object>();

		resultMap.put("payRemndrCnt", payRemndrCnt);

		return resultMap;
	}

}