package jobja.mypage.member.controller;

import java.security.Principal;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import jobja.common.vo.ComCodeInfoVO;
import jobja.common.vo.ComDetCodeInfoVO;
import jobja.member.service.PortfolioService;
import jobja.member.service.ResumeService;
import jobja.member.vo.PortfolioVO;
import jobja.mypage.member.mapper.MemProfileMapper;
import jobja.mypage.member.service.ConAprvService;
import jobja.mypage.member.service.MemProfileService;
import jobja.mypage.member.vo.MemberVO;
import jobja.mypage.member.vo.ResumeVO;
import jobja.util.ModelAttributeUtil;
import lombok.extern.java.Log;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@RequestMapping("/memberAccount")
@Controller
public class MemberMyPage {
	
	@Autowired
	MemProfileService memProfileService;
	
	@Autowired
	ModelAttributeUtil modelAttributeUtil;

	@Autowired
	PortfolioService portfolioservice;
	
	@Autowired
	ConAprvService conAprvService;

	@Autowired
	ResumeService resumeService;
	
	//일반회원 프로필 조회.
	@GetMapping("/profile")
	public String memberMyPage(Principal principal, Model model) {
		
		//직군,관심카테고리 가져오기.
		List<ComDetCodeInfoVO> comDetCodeInfoVO = this.memProfileService.comDetCode();
		
		log.info("memberMyPage -> comDetCodeInfoVO : " + comDetCodeInfoVO);
		
		String memId = principal.getName();
		
		log.info("memberMyPage -> memId : " + memId);
		
		MemberVO memberVO = this.memProfileService.detail(memId);
		
		log.info("memberMyPage -> memberVO : " + memberVO);
		
		model.addAttribute("memberVO", memberVO);
		model.addAttribute("comDetCode", comDetCodeInfoVO);
		
		return "mypageMem/memProfile";
	}
	
	//일반회원 프로필 저장
	@PostMapping("/mypagePost")
	public String mypagePost(Principal principal, Model model, MemberVO memberVO) {
		
		log.info("ㅠㅠ   엉엉 mypagePost : " + memberVO);
		
		int result = this.memProfileService.mypagePost(memberVO);
		  
		return "redirect: /memberAccount/profile";
	}
	
	//일반회원 프로필 조회.
	@GetMapping("/changePw")
	public String changePw(Principal principal, Model model) {
		
		//직군,관심카테고리 가져오기.
		List<ComDetCodeInfoVO> comDetCodeInfoVO = this.memProfileService.comDetCode();
		
		log.info("memberMyPage -> comDetCodeInfoVO : " + comDetCodeInfoVO);
		
		String memId = principal.getName();
		
		log.info("memberMyPage -> memId : " + memId);
		
		MemberVO memberVO = this.memProfileService.detail(memId);
		
		log.info("memberMyPage -> memberVO : " + memberVO);
		
		model.addAttribute("memberVO", memberVO);
		model.addAttribute("comDetCode", comDetCodeInfoVO);
		
		return "mypageMem/memberChangePw";
	}
	

	@GetMapping("/consultantApply")
	public String consultantApply(Model model,Principal principal) {
		
		//마이페이지 나의 이력서 가져오기.
		List<ResumeVO> resumeVOList = this.resumeService.myResume(principal.getName());
		
		//마이페이지 나의 자기소개서 가져오기.
		List<PortfolioVO> portfolioVOList = this.portfolioservice.myPortfolio(principal.getName());
		
		log.info("resumeVOList ㅇㅇㅇㅇㅇㅇ->" + resumeVOList);
		
		log.info("portfolioVOList 캬캬캬캬캬ㅑ캬캬ㅑㅋ->" + portfolioVOList);
		
		model.addAttribute("resumeVOList", resumeVOList);
		
		model.addAttribute("portfolioVOList", portfolioVOList);
		
		return "mypageMem/memberConsultantApply";
	}
	
	
}








