package jobja.board.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import jobja.board.service.BoardEmplConsultService;
import jobja.board.vo.BoardEmplConsultVO;
import jobja.util.ArticlePage;
import jobja.util.TimeUtil;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/boardConsulting")
public class BoardEmplConsultController {
	
	@Autowired
	BoardEmplConsultService boardEmplConsultService;
	
	@Autowired
	TimeUtil timeUtil;
	
	@RequestMapping(value = "/list")
	public String list(BoardEmplConsultVO boardEmplConsultVO, Model model
			, @RequestParam(value = "currentPage",required = false,defaultValue="1")int currentPage) {
		
		Map<String,Object> map = new HashMap<String,Object>();
		String keyword = boardEmplConsultVO.getBoardTitle();
		
		log.info("BoardEmplConsultController -> keyWord : " +keyword);
		
		map.put("currentPage", currentPage);
		map.put("keyword", keyword);
		
		List<BoardEmplConsultVO> data = this.boardEmplConsultService.list(map);
		log.info("BoardEmplConsultController -> data : " +data);
		
		int total = this.boardEmplConsultService.getTotal(map);
		
		ArticlePage<BoardEmplConsultVO> info 
			= new ArticlePage<BoardEmplConsultVO>(total, currentPage, 5,5, data);
		
		info.setUrl("/boardConsulting/list");
		
		model.addAttribute("info", info);
		
		model.addAttribute("data", data);
		
		log.info("BoardEmplConsult -> list : "+data);
		
		return "boardConsulting/list";
	}
	
	@GetMapping("/create")
	public String create() {
		
		return "boardConsulting/create";
	}
	
	@PostMapping("/createPost")
	public String createPost(BoardEmplConsultVO boardEmplConsultVO) {
		
		log.info("createPost->boardEmplConsultVO : " + boardEmplConsultVO);
		
		int result = this.boardEmplConsultService.createPost(boardEmplConsultVO);
		
		log.info("createPost -> result : " +result);
		
		return "redirect:/boardConsulting/list";
	}
	
	@GetMapping("/detail")
	public String detail(BoardEmplConsultVO boardEmplConsultVO, Model model) {
		
		int hitResult = this.boardEmplConsultService.countUpHit(boardEmplConsultVO);
		
		boardEmplConsultVO = this.boardEmplConsultService.detail(boardEmplConsultVO.getBoardId());
		
		log.info("aaaaa : " + boardEmplConsultVO);
		
		model.addAttribute("boardEmplConsultVO", boardEmplConsultVO);
		
		return "boardConsulting/detail";
	}
	
	@GetMapping("/detailUpdate")
	public String detailUpdate(BoardEmplConsultVO boardEmplConsultVO, Model model) {
		
		boardEmplConsultVO = this.boardEmplConsultService.detail(boardEmplConsultVO.getBoardId());
		
		log.info("detailUpdate -> boardEmplConsultVO :" + boardEmplConsultVO);
		
		model.addAttribute("boardEmplConsultVO", boardEmplConsultVO);
		
		return "boardConsulting/detailUpdate";
	}
	
	@PostMapping("/updatePost")
	public String updatePost(BoardEmplConsultVO boardEmplConsultVO) {
		
		log.info("boardNewsVO : " +boardEmplConsultVO);
		
		int result = this.boardEmplConsultService.updatePost(boardEmplConsultVO);
		
		return "redirect:/boardConsulting/detail?boardId="+boardEmplConsultVO.getBoardId();
	}
	
	@PostMapping("/deletePost")
	public String deletePost(BoardEmplConsultVO boardEmplConsultVO) {
		
		log.info("deletePost -> boardEmplConsultVO.getBoardId()" +boardEmplConsultVO.getBoardId());
		
		int result = this.boardEmplConsultService.deletePost(boardEmplConsultVO);
		
		return "redirect:/boardConsulting/list";
	}

}