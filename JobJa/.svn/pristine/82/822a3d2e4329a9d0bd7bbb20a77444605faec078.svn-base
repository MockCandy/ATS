package jobja.mypage.member.controller;

import java.security.Principal;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.collections4.map.HashedMap;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import jobja.application.service.ApplicationService;
import jobja.board.service.BoardEntReviewService;
import jobja.board.service.BoardInquiryService;
import jobja.board.service.BoardQNAService;
import jobja.board.vo.BoardEntReviewVO;
import jobja.board.vo.BoardInquiryVO;
import jobja.board.vo.BoardQNAVO;
import jobja.item.service.ConsultReviewService;
import jobja.item.vo.ConsultantReviewVO;
import jobja.member.service.EnterpriseService;
import jobja.member.service.JobOfferService;
import jobja.mypage.member.vo.ConAprvVO;
import jobja.recruit.service.RecruitService;
import jobja.reply.vo.ReplyVO;
import jobja.report.vo.ReportVO;
import jobja.util.ArticlePage;
import jobja.util.ModelAttributeUtil;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/memberMyActivity")
public class MemberMyActivityController {

	@Autowired
	BoardInquiryService boardInquiryService;
	
	@Autowired
	BoardQNAService boardQNAService;
	
	@Autowired
	RecruitService recruitService;
	
	@Autowired
	ModelAttributeUtil modelAttributeUtil;
	
	@Autowired
	EnterpriseService enterpriseService;
	
	@Autowired
	ApplicationService applicationService;
	
	@Autowired
	JobOfferService jobofferService;
	
	@Autowired
	BoardEntReviewService entReviewService;

	@Autowired
	ConsultReviewService consultReviewService;
	
	

	//내가 등록한 취업QNA목록 가져오기.
	@GetMapping("/myBoardQNA")
	public String boardQNAList(Principal principal, Model model,
			@RequestParam(value = "currentPage", required = false, defaultValue = "1") int currentPage
			) {
		
		int size = 10;
		int pageSize = 5;
		
		String memId = principal.getName();
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("size", size);
		map.put("memId", memId);
		map.put("currentPage", currentPage);
		
		List<BoardQNAVO> myBoardQNAList = this.boardQNAService.myList(map);
		
		int getMyTotal = this.boardQNAService.getMyTotal(map);
		
		log.info("myBoardQNAList : -->>" + myBoardQNAList);
		
		ArticlePage<BoardQNAVO> info = new ArticlePage<BoardQNAVO>(getMyTotal, currentPage, size, pageSize, myBoardQNAList);
		
		info.setUrl("/memberMyActivity/myBoardQNA");
		
		model.addAttribute("info", info);
		model.addAttribute("data", myBoardQNAList);
		
		return "mypageMem/memberBoardQNA";
	}
	//밥먹고 수정해야함!!!!!!!!!!! <---- 얘부터
	//ajax로 내가 등록한 취업QNA글 목록 가져오기.
	@ResponseBody
	@PostMapping("/ajaxmyBoardQNAList")
	public ArticlePage<BoardQNAVO> ajaxmyBoardQNAList(Principal principal,
			@RequestParam(value = "currentPage", required = false, defaultValue = "1") int currentPage
			){
		int size = 10;
		int pageSize = 5;
		String memId = principal.getName();
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("size", size);
		map.put("memId", memId);
		map.put("currentPage", currentPage);
		
		List<BoardQNAVO> myBoardQNAList = this.boardQNAService.myList(map);
		
		int getMyTotal = this.boardQNAService.getMyTotal(map);
		
		log.info("myBoardQNAList : -->>" + myBoardQNAList);
		
		ArticlePage<BoardQNAVO> info = new ArticlePage<BoardQNAVO>(getMyTotal, currentPage, size, pageSize, myBoardQNAList);
		
		info.setUrl("/memberMyActivity/ajaxmyBoardQNAList");
		
		
		return info;
	}
	
	//밥먹고 수정해야함!!!!!
	//내가 등록한 취업QNA댓글목록 가져오기.
	@ResponseBody
	@PostMapping("/ajaxmyBoardQNAReply")
	public ArticlePage<ReplyVO> getQNARePlyList(Principal principal, 
			@RequestParam(value = "currentPage", required = false, defaultValue = "1") int currentPage
			){
		
		int size = 10;
		int pageSize = 5;
		String memId = principal.getName();
		
		Map<String, Object> map = new HashMap<String, Object>();
		
		map.put("size", size);
		map.put("memId",memId);
		map.put("currentPage", currentPage);
		
		List<ReplyVO> QNARePlyList = this.boardQNAService.myReplyList(map);
		
		int getmyReplyTotal = this.boardQNAService.getmyReplyTotal(map);
		
		ArticlePage<ReplyVO> info = new ArticlePage<ReplyVO>(getmyReplyTotal, currentPage, size, pageSize, QNARePlyList);
		
		log.info("QNARePlyList : " + QNARePlyList);
		
		info.setUrl("/memberMyActivity/ajaxmyBoardQNAReply");
		
		return info;
		
	}
	
	
	//내가 등록한 일대일게시판 목록 가져오기.
	@GetMapping("/myBoardInquiry")
	public String boardInquiryList(Principal principal, Model model,
			@RequestParam(value = "currentPage", required = false,defaultValue = "1") int currentPage
			) {
		
		Map<String, Object> map = new HashedMap<String, Object>();
		
		String memId = principal.getName();
		
		int size= 10;
		int pageSize = 5;
		
		map.put("memId", memId);
		map.put("currentPage", currentPage);
		map.put("size", size);
		
		log.info(" memId ? -> " + memId);
		
		List<BoardInquiryVO> myBoardInquiryList = this.boardInquiryService.myList(map);
		
		int getMyTotal = this.boardInquiryService.getMyTotal(map);
		
		ArticlePage<BoardInquiryVO> info = new ArticlePage<BoardInquiryVO>(getMyTotal, currentPage, size, pageSize, myBoardInquiryList);
		
		log.info(" myboardInquiryList : " + myBoardInquiryList);
		
		info.setUrl("/memberMyActivity/myBoardInquiry");
		
		model.addAttribute("data", myBoardInquiryList);
		model.addAttribute("info", info);
		
		
		return "mypageMem/memberBoardInquiry";
	}
	

	@GetMapping("/myEntReview")
	public String myEntReview(Principal principal, Model model,
			@RequestParam(value = "currentPage", required = false, defaultValue = "1") int currentPage
			) {
		
		int size = 10;
		int pageSize = 5;
		String memId = principal.getName();
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("memId", memId);
		map.put("size", size);
		map.put("currentPage",currentPage);
		
		//마이페이지 내가 쓴 기업 리뷰 목록
		List<BoardEntReviewVO> entReviewList = this.entReviewService.getmyEntReview(map);
		
		//마이페이지 토탈 페이지 갯수 가져오기
		int getMyTotal = this.entReviewService.getMyTotal(map);
		
		ArticlePage<BoardEntReviewVO> info = new ArticlePage<BoardEntReviewVO>(getMyTotal, currentPage, size, pageSize, entReviewList);
		
		info.setUrl("/memberMyActivity/myEntReview");
		
		
		model.addAttribute("entReviewList", entReviewList);
		model.addAttribute("info", info);
		
		return "mypageMem/memberEntReview";
	}
	

	@GetMapping("/consultantReview")
	public String consultantReview(Principal principal,Model model,
			@RequestParam(value = "currentPage", required = false, defaultValue = "1")int currentPage
			) {
		
		int size = 3;
		int pageSize = 5;
		String memId = principal.getName();
		
		Map<String, Object> map = new HashMap<String, Object>();
		
		map.put("memId", memId);
		map.put("size", size);
		map.put("currentPage", currentPage);
		
		//마이페이지 내가 쓴 리뷰 목록 가져오기.
		List<ConsultantReviewVO> consultantReviewVOList = this.consultReviewService.getMyconsultReview(map);
		
		log.info("흐흐흐흐ㅡ흐흫 : " + consultantReviewVOList );
		
		int getMyTotal = this.consultReviewService.getMyTotal(map);
		
		ArticlePage<ConsultantReviewVO> info = new ArticlePage<ConsultantReviewVO>(getMyTotal, currentPage, size, pageSize, consultantReviewVOList);
		
		info.setUrl("/memberMyActivity/consultantReview");
		
		model.addAttribute("info", info);
		model.addAttribute("consultantReviewVOList", consultantReviewVOList);
		
		return "mypageMem/memberConsultantReview";
		
	}
	
	@GetMapping("/counselOffer")
	public String counselOffer(Principal principal,Model model
			) {
		
		String memId = principal.getName();
		
		Map<String, Object> map = new HashMap<String, Object>();
		
		map.put("memId", memId);
		
		List<ConAprvVO> list = this.jobofferService.getConAprvVo(map);
		
		model.addAttribute("list", list);
		
		return "mypageMem/memberCounselOffer";
	}

	@GetMapping("/reportOffer")
	public String reportOffer(Principal principal,Model model
			) {
		
		String memId = principal.getName();
		
		Map<String, Object> map = new HashMap<String, Object>();
		
		map.put("memId", memId);
		
		List<ReportVO> list = this.jobofferService.getReportVo(map);
		
		model.addAttribute("list", list);
		
		return "mypageMem/memberReportOffer";
	}
	
}
