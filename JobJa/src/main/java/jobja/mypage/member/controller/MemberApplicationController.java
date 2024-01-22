package jobja.mypage.member.controller;

import java.security.Principal;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import jobja.application.service.ApplicationService;
import jobja.board.service.BoardEntReviewService;
import jobja.board.service.BoardInquiryService;
import jobja.board.service.BoardQNAService;
import jobja.item.service.ConsultReviewService;
import jobja.member.service.EnterpriseService;
import jobja.member.service.JobOfferService;
import jobja.member.vo.ApplicationVO;
import jobja.member.vo.JobOfferVO;
import jobja.recruit.service.RecruitService;
import jobja.util.ArticlePage;
import jobja.util.ModelAttributeUtil;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@RequestMapping("/memberApplication")
@Controller
public class MemberApplicationController {

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


	//마이페이지 입사지원 가져오기.(내가 지원한 공고)
	@GetMapping("/myApplicationList")
	public String myApplicationList(Principal principal, Model model,
			@RequestParam(value = "currntPage", required = false, defaultValue = "1") int currentPage
			){
		
		int size = 10;
		int pageSize = 5;
		String memId = principal.getName();
		
		Map<String, Object> map = new HashMap<String, Object>();
		
		map.put("size", size);
		map.put("memId", memId);
		map.put("currentPage", currentPage);
		
		List<ApplicationVO> myApplicationList = this.applicationService.myApplication(map);
		
		int getMyTotal = this.applicationService.getMyTotal(map);
		
		ArticlePage<ApplicationVO> info = new ArticlePage<ApplicationVO>(getMyTotal, currentPage, size, pageSize, myApplicationList);
		
		log.info("myApplicationLIst ddd : " + myApplicationList);
		
		info.setUrl("/memberApplication/myApplicationList");
		
		model.addAttribute("myApplicationList", myApplicationList);
		model.addAttribute("info", info);
		
		
		return "mypageMem/memberApplication";
	}

	//마이페이지 제안 받은 기업 가져오기(받은제안)
	@GetMapping("/myJobOffer")
	public String myJobOffer(Principal principal,Model model,
			@RequestParam(value = "currentPage", required = false, defaultValue = "1")int currentPage
			) {
		int size = 10;
		int pageSize = 5;
		String memId = principal.getName();
		
		Map<String, Object> map = new HashMap<String, Object>();
		
		map.put("size", size);
		map.put("memId", memId);
		map.put("currentPage", currentPage);
		
		List<JobOfferVO> jobOfferVOList = this.jobofferService.myJobOffer(map);
		
		int getMyJobOfferTotal = this.jobofferService.getMyJobOfferTotal(map);
		
		ArticlePage<JobOfferVO> info = new ArticlePage<JobOfferVO>(getMyJobOfferTotal, currentPage, size, pageSize, jobOfferVOList);
		
		log.info("되냐????????? : " + jobOfferVOList);
		
		info.setUrl("/memberApplication/myJobOffer");
		
		model.addAttribute("jobOfferVOList", jobOfferVOList);
		model.addAttribute("info", info);
		
		return "mypageMem/memberJobOffer";
	}
	
	
	
}
