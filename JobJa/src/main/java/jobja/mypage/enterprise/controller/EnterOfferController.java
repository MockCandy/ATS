package jobja.mypage.enterprise.controller;


import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;

import jobja.common.vo.ComCodeInfoVO;
import jobja.common.vo.ComDetCodeInfoVO;
import jobja.mypage.enterprise.service.EntProfileService;
import jobja.mypage.member.service.MemProfileService;
import jobja.mypage.member.service.MemberService;
import jobja.mypage.member.vo.MemberVO;
import jobja.recruit.service.RecruitService;
import jobja.sort.vo.JobOfferFilterVO;
import jobja.util.ArticlePage;
import jobja.util.ModelAttributeUtil;
import lombok.extern.slf4j.Slf4j;

@RequestMapping("/entOffer")
@Slf4j
@Controller
public class EnterOfferController {
	
	@Autowired
	EntProfileService entProfileService;
	
	@Autowired
	ModelAttributeUtil modelAttributeUtil;

	@Autowired
	MemProfileService memProfileService;
	
	@Autowired
	MemberService memberService;
	
	@Autowired
	RecruitService recruitService;
	
	/**
	 * 맞춤인재 (입사제안)
	 * @param model
	 * @param jobOfferFilterVO
	 * @param currentPage
	 * @return
	 * @throws JsonProcessingException
	 */
	@GetMapping("/offerList")
	public String jobOffer(Model model,
			JobOfferFilterVO jobOfferFilterVO,
			@RequestParam(value = "currentPage",required = false, defaultValue = "1") int currentPage) throws JsonProcessingException {
		
		log.info("jobOfferFilterVO : " + jobOfferFilterVO);
		
		int size = 12;
		int pageSize = 5;
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("currentPage", currentPage);
		map.put("size", size);
		
		List<ComCodeInfoVO> comCodeInfoVOList = recruitService.getComCode();
		log.info("comCodeInfoVOList : "+ comCodeInfoVOList);
		
		List<ComDetCodeInfoVO> comCodeAb = this.recruitService.getComCodeInfoa();
		log.info("comCodeAb : "+ comCodeAb);
		

		log.info("livingLocation -> "+ jobOfferFilterVO.getLivingLocation());
		log.info("wishJobs ->"+ jobOfferFilterVO.getWishJobs());
		log.info("acdmCrs ->"+ jobOfferFilterVO.getAcdmCrs());
		
		log.info("comCodeInfoVOList -> "+ comCodeInfoVOList);
		
		if (jobOfferFilterVO.getWishJobs() != null) {
		    map.put("wishJobs", jobOfferFilterVO.getWishJobs());
		}
		if (jobOfferFilterVO.getLivingLocation() != null) {
		    map.put("livingLocation", jobOfferFilterVO.getLivingLocation());
		}

		log.info("map -> " + map);
		
		List<MemberVO> memberVOList = memberService.getRecommMemList(map);
		log.info("memberVOList", memberVOList);
		

		String wishJobsJson = new ObjectMapper().writeValueAsString(jobOfferFilterVO.getWishJobs());
		log.info("wishJobsJson : "+wishJobsJson);
		
		int total = memberService.getRecommMemCount(map);
		
		ArticlePage<MemberVO> data = new ArticlePage<MemberVO>(total, currentPage, size, pageSize, memberVOList);
		

		data.setUrl("/enter/jobOffer");
		data.setRecruitJobs(jobOfferFilterVO.getWishJobs() );
		data.setRecruitLocation(jobOfferFilterVO.getLivingLocation());
		
		model.addAttribute("livingLocation", jobOfferFilterVO.getLivingLocation());
		model.addAttribute("wishJobs", jobOfferFilterVO.getWishJobs());
		model.addAttribute("wishJobsJson", wishJobsJson);   
		model.addAttribute("comCodeInfoVOList", comCodeInfoVOList);
		model.addAttribute("comCodeAb", comCodeAb);
		model.addAttribute("memberVOList", memberVOList);
		model.addAttribute("data", data);
		
		return "mypageEnt/entJobOffer";
	}
	
	
	
}

