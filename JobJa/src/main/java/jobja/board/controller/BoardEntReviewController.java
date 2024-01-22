package jobja.board.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import jobja.board.service.BoardEntReviewService;
import jobja.board.vo.BoardEntReviewVO;
import jobja.board.vo.BoardQNAVO;
import jobja.common.mapper.ComCodeMapper;
import jobja.common.vo.ComCodeInfoVO;
import jobja.common.vo.ComDetCodeInfoVO;
import jobja.member.service.EnterpriseService;
import jobja.member.vo.EnterpriseVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/boardEntReview")
public class BoardEntReviewController {

	@Autowired
	ComCodeMapper comCodeMapper;
	
	@Autowired
	EnterpriseService enterpriseService;
	
	@Autowired
	BoardEntReviewService boardEntReviewService;
	
	@GetMapping("/create")
	public String create(Model model,String entNo) {
		
		log.info("entNo12" + entNo);
		
		if (entNo != null && !entNo.isEmpty()) {
		    
			String entNm = this.enterpriseService.getEntNm(entNo);
		    
		    log.info("entNm12" + entNm);
		    
		    model.addAttribute("entNm", entNm);
			
			model.addAttribute("entNo", entNo);
		}
		
		String comCode = "MWJ01";
		
		ComCodeInfoVO comCodeInfoVO =  comCodeMapper.getComCodeInfo(comCode);
		
		log.info("create -> comCodeInfoVO : " + comCodeInfoVO);
		
		model.addAttribute("comCodeInfoVO", comCodeInfoVO);
		
		return "entReview/create";
		
	}
	
	@PostMapping("/createPost")
	public String createPost(BoardEntReviewVO boardEntReviewVO) {
		
		log.info("createPost -> boardEntReviewVO : " + boardEntReviewVO);
		
		int result = boardEntReviewService.createPost(boardEntReviewVO);
		
		log.info("createPost -> boardEntReviewVO : " + boardEntReviewVO);
		log.info("createPost -> result : " + result);
		
		String entNo = boardEntReviewVO.getEntNo();
		
		return "redirect:/enterprise/"+entNo+"/review";
	}

	@ResponseBody
	@PostMapping("/ajaxGetComDetCode")
	public ComCodeInfoVO ajaxGetComDetCode(@RequestBody ComCodeInfoVO comCodeInfoVO) {
		
		log.info("ajaxGetComDetCode -> comCodeInfoVO : " + comCodeInfoVO);

		comCodeInfoVO =  comCodeMapper.getComCodeInfo(comCodeInfoVO.getComCd());

		log.info("ajaxGetComDetCode -> comCodeInfoVO : " + comCodeInfoVO);
		
		return comCodeInfoVO;
	}

	@ResponseBody
	@PostMapping("/ajaxGetEnt")
	public List<EnterpriseVO> ajaxGetComDetCode(@RequestBody EnterpriseVO enterpriseVO) {
		
		log.info("ajaxGetComDetCode -> enterpriseVO : " + enterpriseVO);

		List<EnterpriseVO> entVOList = enterpriseService.getAjaxEntList(enterpriseVO);
		
		return entVOList;
	}
	
	
	@ResponseBody
	@PostMapping("/ajaxLike")
	public BoardEntReviewVO ajaxLikeUp(@RequestBody BoardEntReviewVO boardEntReviewVO) {
		
		log.info("ajaxLikeUp -> boardQNAVO : " + boardEntReviewVO);
		
		int result = boardEntReviewService.ajaxLikeUp(boardEntReviewVO);
		
		log.info("ajaxLikeUp -> result : " + result);

		log.info("ajaxLikeUp -> boardQNAVO : " + boardEntReviewVO);

		return boardEntReviewVO;
	}
	
	
}
