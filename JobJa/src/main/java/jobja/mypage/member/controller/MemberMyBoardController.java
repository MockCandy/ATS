package jobja.mypage.member.controller;

import java.security.Principal;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
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
import jobja.member.vo.ApplicationVO;
import jobja.member.vo.EnterpriseVO;
import jobja.member.vo.InterestEnterpriseVO;
import jobja.member.vo.InterestRecruitVO;
import jobja.member.vo.JobOfferVO;
import jobja.recruit.service.RecruitService;
import jobja.recruit.vo.RecruitVO;
import jobja.reply.vo.ReplyVO;
import jobja.util.ArticlePage;
import jobja.util.ModelAttributeUtil;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@RequestMapping("/memberInterest")
@Controller
public class MemberMyBoardController {
	
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

	
	//스크랩한 채용공고 가져오기.
	@GetMapping("/myRecruit")
	public String myRecruitList(Principal principal, Model model,
			@RequestParam(value = "currentPage", required = false, defaultValue = "1")int currentPage
			) {
		
		int size = 6;
		int pageSize = 5;
		String memId = principal.getName();
		
		Map<String, Object> map = new HashMap<String, Object>();
		
		map.put("size", size);
		map.put("memId", memId);
		map.put("currentPage", currentPage);
		
		log.info("dhkdb와우우우ㅜㅇn?????");
		
		List<RecruitVO> myRecruitList = this.recruitService.myRecruitList(map);
		
		int getMyTotal = this.recruitService.getMyTotal(map);
		
		ArticlePage<RecruitVO> info = new ArticlePage<RecruitVO>(getMyTotal, currentPage, size, pageSize, myRecruitList);
		
		log.info("myRecruitList : " + myRecruitList);
		
		info.setUrl("/memberInterest/myRecruit");
		
		model.addAttribute("data", myRecruitList);
		model.addAttribute("info", info);
		
		return "mypageMem/memberRecruit";
	}
	
	//스크랩했던 채용공고 삭제
	@ResponseBody
	@PostMapping("/ajaxdeleteRecruit")
	public int ajaxdeleteRecruit(@RequestBody InterestRecruitVO interestRecruitVO, Principal principal) {
		log.info("오나? interestRecruitVO" + interestRecruitVO);
		
		String memId = principal.getName();
		interestRecruitVO.setMemId(memId);
		
		int result = this.recruitService.ajaxdeleteRecruit(interestRecruitVO);
		log.info("result : " + result);
		
		return result;
	}
	
	//스크랩했던 채용공고 삭제 후 다시 등록
	@ResponseBody
	@PostMapping("/ajaxinsertRecruit")
	public int ajaxinsertRecruit(@RequestBody InterestRecruitVO interestRecruitVO, Principal principal) {
		log.info("다시 들우 가야해!!!!!!!" + interestRecruitVO);
		
		String memId = principal.getName();
		interestRecruitVO.setMemId(memId);
		
		int result = this.recruitService.ajaxinsertRecruit(interestRecruitVO);
		log.info("result insert : " + result);
		
		return result;
		
	}
	
	//마이페이지 스크랩했던 관심기업 가져오기.
	@GetMapping("/myEnterpriseList")
	public String myEnterpriseList(Principal principal, Model model,
			@RequestParam(value = "currentPage", required = false, defaultValue = "1") int currentPage
			) {
		
		int size = 5;
		int pageSize = 5;
		String memId = principal.getName();
		
		Map<String, Object> map = new HashMap<String, Object>();
		
		map.put("size", size);
		map.put("memId", memId);
		map.put("currentPage", currentPage);
		
		List<EnterpriseVO> enterpriseVO = this.enterpriseService.myEntList(map);
		
		log.info("enterpriseVO 마이ㅣㅣㅣ : " + enterpriseVO);
		
		int getMytotal = this.enterpriseService.getMytotal(map);
		
		ArticlePage<EnterpriseVO> info = new ArticlePage<EnterpriseVO>(getMytotal, currentPage, size, pageSize, enterpriseVO);
		
		info.setUrl("/memberInterest/myEnterpriseList");
		
		model.addAttribute("data", enterpriseVO);
		model.addAttribute("info", info);
		
		return "mypageMem/memberEnterprise";
	}
	
	//마이페이지 스크랩했던 관심기업 삭제.
	@ResponseBody
	@PostMapping("/ajaxdeleteEnterprise")
	public int ajaxdeleteEnterprise(@RequestBody InterestEnterpriseVO interestEnterpriseVO) {
		log.info("????????????? gmgm: " + interestEnterpriseVO);
		
		int result = this.enterpriseService.ajaxdeleteEnterprise(interestEnterpriseVO);
		
		log.info("ㅎㅇㅎㅇㅎㅇㅎㅇresult : " + result);
		
		return result;
	}
	
	//마이페이지 삭제했던 관심기업 다시 추가.
	@ResponseBody
	@PostMapping("/ajaxinsertEnterprise")
	public int ajaxinsertEnterprise(@RequestBody InterestEnterpriseVO interestEnterpriseVO) {
		log.info("다ㅏㅏㅏㅏ시ㅣㅣㅣ들어가ㅏㅏㅏㅏ : " + interestEnterpriseVO);
		
		int result = this.enterpriseService.ajaxinsertEnterprise(interestEnterpriseVO);
		
		log.info("sdafasdfas result : " + result);
		
		return result;
	}
	
	//마이페이지 입사지원 가져오기.(내가 지원한 공고)
	@GetMapping("/myApplicationList")
	public String myApplicationList(Principal principal, Model model){
		
		log.info("gk???????????????ㅗㅗㅗㅗㅗ");
		
//		List<ApplicationVO> myApplicationList = this.applicationService.myApplication(principal.getName());
		
		log.info("너 안타???????????");
		
//		log.info("myApplicationLIst ddd : " + myApplicationList);
		
//		model.addAttribute("myApplicationList", myApplicationList);
		
		log.info("너 이제 바로 적용 되냐????????????");
		
		log.info("진짜 되냐???????????????" );
		
		return "mypageMem/memberApplication";
	}
	
	//마이페이지 제안 받은 기업 가져오기(받은제안)
	@GetMapping("/myJobOffer")
	public String myJobOffer(Principal principal,Model model) {
		
//		List<JobOfferVO> jobOfferVOList = this.jobofferService.myJobOffer(principal.getName());
		
//		log.info("되냐????????? : " + jobOfferVOList);
		
//		model.addAttribute("jobOfferVOList", jobOfferVOList);
		
		return "mypageMem/memberJobOffer";
	}
	
	@PostMapping("/ajaxgetJobOfferEnt")
	@ResponseBody
	public EnterpriseVO ajaxgetJobOfferEnt(@RequestBody EnterpriseVO enterpriseVO) {
		
		log.info("dgsi?");
		
		log.info("enterpriseVO : " + enterpriseVO);
		log.info("enterpriseVO.getEntNo() : " + enterpriseVO.getEntNo());
		
		enterpriseVO = this.jobofferService.ajaxgetJobOfferEnt(enterpriseVO.getEntNo());

		log.info("enterpriseVO2 : " + enterpriseVO);
		
		return enterpriseVO;
	}
	
	
}