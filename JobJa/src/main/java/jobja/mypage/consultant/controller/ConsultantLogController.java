package jobja.mypage.consultant.controller;

import java.security.Principal;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import jobja.chatting.service.ChattingService;
import jobja.chatting.vo.ChatRoomVO;
import jobja.item.service.ConsultService;
import jobja.item.vo.ConsultantLogVO;
import jobja.item.vo.PaymentVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@RequestMapping("/consultantLog")
@Controller
public class ConsultantLogController {
	
	@Autowired
	ConsultService consultService;
	
	@Autowired
	ChattingService chattingService;
	
	//상담사 상담기록 남기기!@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
		@GetMapping("/consultantLogCreate")
		public String consultantLogCreate(Principal principal, Model model, HttpServletRequest request) {
			
			String chatRoomId = request.getParameter("chatRoomId");
			
			ChatRoomVO chatRoomVO = this.chattingService.getRoomInfo(chatRoomId);
			
			String tagetMemId = chatRoomVO.getChatMemId();
			String conMemId = principal.getName();
			
			//임시로 만든 것.
			//채팅방VO 생기면 ChatRoomVO로 수정 (xml도 수정해야함)
			Map<String, String> chatRoom = new HashMap<String, String>();
			chatRoom.put("tagetMemId", tagetMemId);
			chatRoom.put("conMemId", conMemId);
			
			PaymentVO paymentVO = this.consultService.getPayLog(chatRoom);
			
			log.info("paymentVO ㅇㅇㅇㅇ : " + paymentVO);
			
			
			model.addAttribute("paymentVO", paymentVO);
			
			
			return "consultLogCreate/consultantLogCreate";
			
		}
		
		//상담기록 등록
		@PostMapping("/insertConsultantLog")
		public String insertConsultantLog(ConsultantLogVO consultantLogVO) {
			
			log.info("dhkkkkkk냐?  consultatntLogVO: " + consultantLogVO);
			
			int resCnt = consultantLogVO.getCnsltntTimes();
			
			//상담기록 등록
			int result = this.consultService.insertConsultantLog(consultantLogVO);
			
			log.info("상담기록 등록 result :" + result);
			
			return "redirect:/consultantMyPage/consultantLog";
		}

}
