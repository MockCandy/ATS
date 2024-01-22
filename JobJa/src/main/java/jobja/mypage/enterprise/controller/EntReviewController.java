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

import jobja.application.service.ApplicationService;
import jobja.atchfile.mapper.AtchFileDetailMapper;
import jobja.board.service.BoardEntReviewService;
import jobja.board.vo.BoardEntReviewVO;
import jobja.common.mapper.ComCodeMapper;
import jobja.member.service.EnterpriseService;
import jobja.member.service.PortfolioService;
import jobja.member.service.ResumeService;
import jobja.member.vo.EnterpriseVO;
import jobja.mypage.member.service.MemberService;
import jobja.mypage.member.vo.MemberVO;
import jobja.util.ModelAttributeUtil;
import jobja.recruit.service.RecruitService;
import jobja.util.ArticlePage;


import lombok.extern.slf4j.Slf4j;

@RequestMapping("/entReview")
@Slf4j
@Controller
public class EntReviewController {
	
	@Autowired
	ModelAttributeUtil modelAttributeUtil;
	
	@Autowired
	EnterpriseService enterpriseService;
	
	@Autowired
	BoardEntReviewService boardEntReviewService;
	
	@Autowired
	ComCodeMapper comCodeMapper;
	
	@Autowired
	MemberService memberService;
	
	@Autowired
	RecruitService recruitService;
	
	@Autowired
	ApplicationService applicationService;
	
	@Autowired
	AtchFileDetailMapper atchFileDetailMapper;
	
	@Autowired
	ResumeService resumeService;
	
	@Autowired
	PortfolioService portfolioService;
	
	/**
	 * 기업 리뷰
	 * @param model
	 * @param entNo
	 * @param boardEntReviewVO
	 * @return
	 */
	@GetMapping("/reviewList")
	public String reviewList(Model model,String entNo, BoardEntReviewVO boardEntReviewVO,
			@RequestParam(value = "currentPage",required = false,defaultValue="1")int currentPage
			) {
		
		log.info("reviewList -> currentPage : "+currentPage);
		
		// 현재 로그인한 회원 정보
		MemberVO memberVO = modelAttributeUtil.getCurrentLoginName();
		String memId = memberVO.getMemId();
		
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("currentPage",currentPage);
		
		// 리뷰 통계 - 합계, 평균 
		EnterpriseVO enterpriseVO = this.enterpriseService.entReviewAvg(memId);
		log.info("enterReview -> enterpriseVO : " + enterpriseVO); 
		
		// 리뷰 목록
		List<BoardEntReviewVO> brdEntReviewVOList = this.boardEntReviewService.brdEnterpriseVOList(memId);
		log.info("enterReview -> brdEntReviewVOList : " + brdEntReviewVOList);
		
		for (BoardEntReviewVO review : brdEntReviewVOList) {
			
			review.setEnterpriseVO(enterpriseVO);
		}
		
		// 리뷰 총 개수
		int totalReviewCount = boardEntReviewService.getTotalCount(enterpriseVO.getEntNo());
		log.info("enterReview -> totalReviewCount : " + totalReviewCount); 
		
		map.put("totalReviewCount", totalReviewCount);
		
//		int total = this.boardEntReviewService.totalReviewCount(map);
		
		ArticlePage<BoardEntReviewVO> data = new ArticlePage<BoardEntReviewVO>(totalReviewCount, currentPage, 10, 5, brdEntReviewVOList);
		data.setUrl("/entReview/reviewList");
		
		model.addAttribute("memberVO",memberVO);
		model.addAttribute("enterpriseVO",enterpriseVO);
		model.addAttribute("brdEntReviewVOList",brdEntReviewVOList);
		model.addAttribute("totalReviewCount",totalReviewCount);
		model.addAttribute("data",data);
		
		return "mypageEnt/entReview";
	}

	/**
	 * 리뷰 상세보기
	 * @param model
	 * @return
	 */
	@GetMapping("/reviewDetail")
	public String reviewDetail(Model model, String entRevNo) {
		
		// 현재 로그인한 회원 정보
		MemberVO memberVO = modelAttributeUtil.getCurrentLoginName();
		String memId = memberVO.getMemId();
		
		// 기업정보 
		EnterpriseVO enterpriseVO = this.enterpriseService.entReviewAvg(memId);
		log.info("enterReview -> enterpriseVO : " + enterpriseVO); 
		
		// 리뷰 목록
		BoardEntReviewVO entReviewVO = this.boardEntReviewService.entReviewVO(entRevNo);
		log.info("enterReview -> entReviewVO : " + entReviewVO);
		
		
		model.addAttribute("memberVO",memberVO);
		model.addAttribute("enterpriseVO",enterpriseVO);
		model.addAttribute("entReviewVO",entReviewVO);
		
		return "mypageEnt/entReviewDetail";
	}

}

