package jobja.consultreview.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import jobja.item.service.ConsultReviewService;
import jobja.item.service.ConsultService;
import jobja.item.vo.ConsultantReviewVO;
import jobja.mypage.member.service.MemberService;
import jobja.mypage.member.vo.MemberVO;
import jobja.util.ArticlePage;
import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
@RequestMapping("/consultReview")
public class ConsultReviewController {

	@Autowired
	ConsultReviewService consultReviewService;

	@Autowired
	ConsultService consultService;
	
	@Autowired
	MemberService memberService;
	
	@GetMapping("/list")
	public String list(String memId, Model model,
			@RequestParam(name = "currentPage", defaultValue = "1") int currentPage) {
		
		int size = 10;
		int pageSize = 10;
		
		Map<String, Object> map = new HashMap<String, Object>();
		
		map.put("memId", memId);
		map.put("size", size);
		map.put("currentPage", currentPage);
		
		int total = consultReviewService.getTotalByConId(map);
		
		MemberVO memVO  = memberService.getMemberById(memId);
		
		List<ConsultantReviewVO> cosultantReviewVOList = consultReviewService.getConsultRevByConId(map);
		
		ArticlePage<ConsultantReviewVO> data = new ArticlePage<ConsultantReviewVO>(total, currentPage,size, pageSize, cosultantReviewVOList);
		
		data.setUrl("/consultReview/list");
		data.setKeyword(memId);
		
		model.addAttribute("total", total);
		model.addAttribute("data", data);
		model.addAttribute("memVO", memVO);
		
		return "consultReview/list";
		
	}
	
	
}
