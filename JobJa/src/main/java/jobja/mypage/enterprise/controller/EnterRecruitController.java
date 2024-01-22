package jobja.mypage.enterprise.controller;


import java.security.Principal;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import jobja.application.service.ApplicationService;
import jobja.atchfile.mapper.AtchFileDetailMapper;
import jobja.atchfile.vo.AtchFileDetailVO;
import jobja.board.service.BoardEntReviewService;
import jobja.common.mapper.ComCodeMapper;
import jobja.common.vo.ComCodeInfoVO;
import jobja.common.vo.ComDetCodeInfoVO;
import jobja.member.service.EnterpriseService;
import jobja.member.vo.EnterpriseVO;
import jobja.member.vo.InterestEnterpriseVO;
import jobja.member.vo.InterestRecruitVO;
import jobja.mypage.enterprise.service.EntProfileService;
import jobja.mypage.member.service.MemProfileService;
import jobja.mypage.member.service.MemberService;
import jobja.mypage.member.vo.MemberVO;
import jobja.mypage.member.vo.ResumeVO;
import jobja.recruit.service.RecruitService;
import jobja.recruit.vo.RecruitFormVO;
import jobja.recruit.vo.RecruitVO;
import jobja.util.ArticlePage;
import jobja.util.ModelAttributeUtil;
import lombok.extern.slf4j.Slf4j;

@RequestMapping("/entRecruit")
@Slf4j
@Controller
public class EnterRecruitController {
	
	@Autowired
	EntProfileService entProfileService;
	
	@Autowired
	ModelAttributeUtil modelAttributeUtil;

	@Autowired
	MemProfileService memProfileService;
	
	@Autowired
	MemberService memberService;
	
	@Autowired
	EnterpriseService enterpriseService;
	
	@Autowired
	BoardEntReviewService boardEntReviewService;
	
	@Autowired
	ComCodeMapper comCodeMapper;
	
	
	@Autowired
	RecruitService recruitService;
	
	@Autowired
	ApplicationService applicationService;
	
	@Autowired
	AtchFileDetailMapper atchFileDetailMapper;
	
   @GetMapping("/recruitList")
   public String recruit(
         @RequestParam(value="keyword", required = false, defaultValue = "") String keyword,
         @RequestParam(value="currentPage", required = false, defaultValue = "1") int currentPage,
         @RequestParam(value="sort", required = false, defaultValue = "recent") String sort,
         @RequestParam(value="magam", required = false, defaultValue = "false") String magam,
          Model model) {

		// 현재 로그인한 회원 정보
		MemberVO memberVO = modelAttributeUtil.getCurrentLoginName();
		String memId = memberVO.getMemId();
		log.info("recruit -> memberVO : " + memberVO);
		
		int size = 5;
      
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("keyword", keyword);
		map.put("currentPage", currentPage);
		map.put("size", size);      
		map.put("sort", sort);
		map.put("magam", magam);
		map.put("memId", memId);
		
		log.info("map : " + map);
		
		// 해당 사업자번호의 기업 정보
		EnterpriseVO enterpriseVO = enterpriseService.getOne(map);
		
		// 해당 기업의 채용 공고 리스트
//		List<RecruitVO> recruitVOList = this.recruitService.recruitList(memId);
		List<RecruitVO> recruitVOList = this.recruitService.recruitListByMap(map);
		
		
		// 로그인한 회원의 관심 채용 공고 목록
		List<InterestRecruitVO> interestRecruitVOList = recruitService.getInterestRecruit(memberVO);
		log.info("interestRecruitVOList : " + interestRecruitVOList);
		
		// 로그인한 회원의 기업 목록
		List<InterestEnterpriseVO> interestEntVOList = enterpriseService.getInterestEnt(memberVO);
		log.info("interestEntVOList : " + interestEntVOList);
		
		model.addAttribute("enterpriseVO", enterpriseVO);
		model.addAttribute("recruitVOList", recruitVOList);
		model.addAttribute("interestRecruitVOList", interestRecruitVOList);
		model.addAttribute("interestEntVOList", interestEntVOList);
		
		return "mypageEnt/recruit";
   }
   

	// 채용공고 등록
	@GetMapping("/recruitCreate")
	   public String recruitCreate(RecruitFormVO recruitFormVO, Model model) {
	      
		 List<ComCodeInfoVO> comCodeInfoVOList = this.recruitService.getComCode();
	      
	      //학력 공통 코드 가지고 오는것
	      List<ComDetCodeInfoVO> comCodeAb = this.recruitService.getComCodeInfoa();
	      
	      //고용형태 가지고 오는것 
	      List<ComDetCodeInfoVO> comCodeAC = this.recruitService.getComCodeInfob();
	      
	      // 인사 담당자 직급 가지고 오는것 
	      List<ComDetCodeInfoVO> comCodeAd = this.recruitService.getComCodeInfod();
	      
	      MemberVO memberVO = modelAttributeUtil.getCurrentLoginName();
	      
	      
	      String memId = memberVO.getMemId();
	      
	      log.info("memIdZZZ:"+memId);
	      String entNo = this.recruitService.getEntNo(memId);
	      log.info("memIdZZZz:"+entNo);
	      recruitFormVO.setComCodeInfoVOList(comCodeInfoVOList);
	      recruitFormVO.setComCodeAb(comCodeAb);
	      recruitFormVO.setComCodeAC(comCodeAC);
	      recruitFormVO.setComCodeAd(comCodeAd);
	      recruitFormVO.setEntNo(entNo);
	      
	      
	      model.addAttribute("recruitFormVO", recruitFormVO);

	      log.info("comCodeInfoVOListikjjij :" +recruitFormVO.getEntNo());
	      log.info("comCodeInfoVOListikjjijZZZ :" +comCodeAb);
	      log.info("comCodeInfoVOListikjjijZZZaa :" +comCodeAb);
	      log.info("comCodeInfoVOListikjjijZZZaa :" +comCodeAC);
	      log.info("comCodeInfoVOList comCodeAd @@@ :" +comCodeAd);
	      log.info("comCodeInfoVOListikjjijZZZaa :" + recruitFormVO.getBenCd());
	      
	      return "mypageEnt/entRecruitCreate";
	}	
	

}

