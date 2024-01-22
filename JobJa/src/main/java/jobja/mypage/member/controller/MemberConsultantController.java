package jobja.mypage.member.controller;

import java.security.Principal;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import jobja.common.vo.ComCodeInfoVO;
import jobja.common.vo.ComDetCodeInfoVO;
import jobja.item.service.ConsultReviewService;
import jobja.item.service.ConsultService;
import jobja.item.service.ItemService;
import jobja.item.vo.ConsultantLogVO;
import jobja.item.vo.ConsultantReviewVO;
import jobja.item.vo.ItemVO;
import jobja.item.vo.PaymentVO;
import jobja.mypage.member.vo.AcademicCareerVO;
import jobja.mypage.member.vo.AwardsVO;
import jobja.mypage.member.vo.CareerVO;
import jobja.mypage.member.vo.LanguageVO;
import jobja.mypage.member.service.MemberService;
import jobja.mypage.member.vo.MemberVO;
import jobja.mypage.member.vo.ResultVO;
import jobja.mypage.member.vo.ResumeVO;
import jobja.util.ArticlePage;
import jobja.util.ModelAttributeUtil;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@RequestMapping("/memberPremium")
@Controller
public class MemberConsultantController {
	
	@Autowired
	ConsultService consultService;
	
	@Autowired
	ConsultReviewService consultReviewService;

	@Autowired
	ItemService itemService;
	 
	@Autowired
	ModelAttributeUtil modelAttributeUtil;
	
	@Autowired
	MemberService memberService;
	
	@GetMapping("/consultantLog")
	public String consultantLog(Principal principal, Model model) {
		
		//나의 상담기록 가져오기
		List<MemberVO> consultantLogVOList = this. consultService.getMyConsultantLog(principal.getName());
		
		log.info("rhkdus?//?/?? list : " + consultantLogVOList);
		
		model.addAttribute("consultantLogVOList", consultantLogVOList);
		
		return "mypageMem/memberConsultantLog";
	}
	
	
	@PostMapping("/ajaxgetOneReview")
	@ResponseBody
	public ConsultantLogVO ajaxgetOneReview(@RequestBody ConsultantLogVO consultantLogVO) {
		log.info("ㅎㅇㅎㅇㅎㅇ" + consultantLogVO);
		
		//가져온 상담 기록에서 기록 보기 눌렀을 때 상담사가 기록한 코멘트 보기
		consultantLogVO = this.consultService.ajaxgetOneReview(consultantLogVO.getCnsltntNo());
		
		log.info("감ㅅ다온거 : " + consultantLogVO);
		
		return consultantLogVO;
	}
	
	@PostMapping("/ajaxgetReviewInfo")
	@ResponseBody
	public PaymentVO ajaxgetReviewInfo(@RequestBody PaymentVO paymontVO) {
		log.info(" ㅎㅇㅎㅇ" + paymontVO);
		
		//마이페이지 리뷰 작성 전 info 가져옴.
		paymontVO = this.consultService.ajaxgetReviewInfo(paymontVO.getPayNo());
		
		log.info(":dddddd 리뷰ㅜ " + paymontVO);
		
		return paymontVO;
	}
	
	@PostMapping("/ajaxinsertReview")
	@ResponseBody
	public int ajaxinsertReview(@RequestBody ConsultantReviewVO consultantReviewVO) {
		
		log.info("gggg" + consultantReviewVO);
		
		//리뷰 등록
		int result = this.consultService.ajaxinsertReview(consultantReviewVO);
		
		log.info("resultasldfas : " + result);
		
		return 1;
	}
	
	
	/** 상담사 회원 리스트 출력
	 * @param model
	 * @return
	 */
	@RequestMapping("/consultantList")
	public String consultantList(MemberVO memberVO, Model model,
			@RequestParam(value = "currentPage", required = false, defaultValue = "1") int currentPage) {
		
		Map<String, Object> map = new HashMap<String, Object>();

		String keyWord = memberVO.getMemNm();

		map.put("keyword", keyWord);
		map.put("currentPage", currentPage);
		
		List<MemberVO> memberVOList = this.consultService.consultantList(map);
		
		int totalCounsel = this.consultService.totalCounsel(map);
		
		// 회원의 대표이력서 설정
		for(MemberVO conMemberVO : memberVOList) {
			
			String submitResumeNo = this.consultService.getRepResumeNo(conMemberVO.getMemId());
			log.info("consultantList -> submitResumeNo : " +submitResumeNo);
			
			conMemberVO.setSubmitResumeNo(submitResumeNo);
		}
		
		ArticlePage<MemberVO> info = new ArticlePage<MemberVO>(totalCounsel, currentPage, 15, memberVOList);
		
		info.setKeyword(memberVO.getMemNm());
		info.setUrl("/memberPremium/memberConsultantList");
		
		log.info("consultantList -> memberVOList : " +memberVOList);
		
		model.addAttribute("memberVOList", memberVOList);
		model.addAttribute("totalCounsel", totalCounsel);
		model.addAttribute("info", info);
		
		return "mypageMem/memberConsultantList";
	}
	
	/**
	 * 상담사 신청한 회원의 이력서 보기
	 * 
	 * @param requestData
	 * @return
	 */
	@Transactional
	@PostMapping("/getResume")
	@ResponseBody
	public Map<String, Object> getResume(@RequestBody Map<String, String> requestData) {

		Map<String, Object> map = new HashMap<String, Object>();
		String memId = requestData.get("memId");
		String resumeNo = requestData.get("resumeNo");
		
		log.info("getResume -> memId : " +memId);
		log.info("getResume -> resumeNo : " +resumeNo);

		// 공통상세코드
		List<ComCodeInfoVO> comCodeInfoVOList = this.memberService.getComCodeVOList();

		map.put("memId", memId);
		map.put("resumeNo", resumeNo);

		// 1)멤버 정보
		MemberVO memberVO = this.memberService.resumeMemberDetail(map);
		// 2) 이력서
		List<ResumeVO> resumeVOList = this.memberService.resumeResumeDetail(map);
		// 3) 학력
		List<AcademicCareerVO> academicCareerVOList = this.memberService.resumeAcademicCareerDetail(map);
		// 4) 경력
		List<CareerVO> careerVOList = this.memberService.resumeCareerDetail(map);
		// 5) 성과
		List<ResultVO> resultVOList = this.memberService.resumeResultDetail(map);
		// 6) 어학
		List<LanguageVO> languageVOList = this.memberService.resumeLanguageDetail(map);
		// 7) 수상
		List<AwardsVO> awardsVOList = this.memberService.resumeAwardsDetail(map);
		
		log.info("getResume -> resumeVOList : " +resumeVOList);

		String comCd = "";

		// 이력서 하난데 List로 잘못 선언해서.. 바꾸기 좀 그렇다...
		for (ResumeVO resumeVOTemp : resumeVOList) {
			comCd = resumeVOTemp.getResumeOccp();
		}

		List<ComDetCodeInfoVO> comDetCodeInfoVOList = this.memberService.getComDetCode(comCd);

		Map<String, Object> mapMemberVO = new HashMap<String, Object>();

		mapMemberVO.put("memberVO", memberVO);
		mapMemberVO.put("resumeVOList", resumeVOList);
		mapMemberVO.put("academicCareerVOList", academicCareerVOList);
		mapMemberVO.put("careerVOList", careerVOList);
		mapMemberVO.put("resultVOList", resultVOList);
		mapMemberVO.put("languageVOList", languageVOList);
		mapMemberVO.put("awardsVOList", awardsVOList);
		mapMemberVO.put("comCodeInfoVOList", comCodeInfoVOList);
		mapMemberVO.put("comDetCodeInfoVOList", comDetCodeInfoVOList);

		log.info("getResume -> mapMemberVO : " + mapMemberVO);

		return mapMemberVO;
	}

	@RequestMapping(value = "/items")
	public String items(Model model,ItemVO itemVO) {
		
		log.info("itemVO" + itemVO);
		
		MemberVO memberVO = modelAttributeUtil.getCurrentLoginName();
		
		log.info("memberVO2" + memberVO);
		
		List<ItemVO> consultItemVOList = this.itemService.getConsultItemList();
		
		String conMemId = itemVO.getConMemId();
		
		model.addAttribute("conMemId", conMemId);
		
		model.addAttribute("consultItemVOList", consultItemVOList);
		
		model.addAttribute("memberVO", memberVO);
		
		log.info("conMemId"+conMemId);
		
		return "mypageMem/consultItems";
	}
	
	

	
	//일반회원이 구매한 상담목록
	@GetMapping("/payitems")
	public String memPayitems(Principal principal, Model model,
			@RequestParam(value = "currnetPage", required = false, defaultValue = "1")int currentPage
			) {
		
		int size = 10;
		int pageSize = 5;
		String memId = principal.getName();
		
		Map<String, Object> map = new HashMap<String, Object>();
		
		map.put("size", size);
		map.put("memId", memId);
		map.put("currentPage", currentPage);
		
		List<PaymentVO> paymentVOList = this.itemService.getmemPayitems(map);		
		
		int getMyTotal = this.itemService.getMyTotal(map);
		
		ArticlePage<PaymentVO> info = new ArticlePage<PaymentVO>(getMyTotal, currentPage, size, pageSize, paymentVOList);
		
		log.info("paymentVOList : ㅇㅇ" + paymentVOList);
		
		PaymentVO memTotalPay = this.itemService.getmemPayTotalMoney(principal.getName());
		
		info.setUrl("/memberPremium/payitems");

		
		model.addAttribute("paymentVOList", paymentVOList);
		model.addAttribute("memTotalPay", memTotalPay);
		model.addAttribute("info", info);
		
		return "mypageMem/memberPayItems";
	}
	
	

}
