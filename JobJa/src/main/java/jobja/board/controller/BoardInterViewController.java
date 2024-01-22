package jobja.board.controller;

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

import jobja.board.service.BoardInterViewSevice;
import jobja.board.vo.BoardInterViewQNACodeVO;
import jobja.board.vo.BoardInterViewVO;
import jobja.common.vo.ComCodeInfoVO;
import jobja.common.vo.ComDetCodeInfoVO;
import jobja.mypage.member.vo.MemberVO;
import jobja.util.ArticlePage;
import jobja.util.ModelAttributeUtil;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/boardInterView")
public class BoardInterViewController {
	
	@Autowired
	BoardInterViewSevice boardInterViewService;
	
	@Autowired
	ModelAttributeUtil modelAttributeUtil;
	
	
	/** 
	 * 직군별 인터뷰 리스트 가져 오는 기능
	 * @param comDetCodeInfoVO
	 * @param currentPage
	 * @param model
	 * @return
	 */
	@ResponseBody
	@PostMapping("/listAjax")
	public ArticlePage<BoardInterViewVO> listCode(
			@RequestBody ComDetCodeInfoVO comDetCodeInfoVO,
			@RequestParam(value = "currentPage",required = false,defaultValue = "1") int currentPage,
			
			Model model){
		log.info("안넘 어와?");
		log.info("listAjax -> currentPage : " + currentPage);
		
		String comDetCd = comDetCodeInfoVO.getComDetCd();
		//listAjax -> comDetCode : MWJ01000
		log.info("listAjax -> comDetCode : " + comDetCd);
		
		Map<String, Object> map = new HashMap<String, Object>();
		
		map.put("interJobCd", comDetCd);
		map.put("currentPage",currentPage);
		//listCode->map : {interJobCd=MWJ01000, currentPage=1}
		log.info("listCode->map : " + map);
		
		List<BoardInterViewVO> codeList = this.boardInterViewService.codeList(map);
		
		log.info(" listAjax -> codeList : " + codeList);
		
		int total = this.boardInterViewService.getTotal(map);
		
		log.info("listCode->total : " + total);
		
		ArticlePage<BoardInterViewVO> articlePage = new ArticlePage<BoardInterViewVO>(total, currentPage, 9,5, codeList);
		articlePage.setComDetCode(comDetCd);
		
		articlePage.setUrl("/boardInterView/list");
				
		return articlePage;
	}
	
	
	
	/**
	 * 인터뷰 리스트 가져오는 기능
	 * @param model
	 * @param boardInterViewVO
	 * @param keyword
	 * @param currentPage
	 * @param comDetCode
	 * @return
	 */
	@GetMapping("/list")
	public String list(Model model, BoardInterViewVO boardInterViewVO,
			@RequestParam(value = "keyword", required = false) String keyword,
			@RequestParam(value = "currentPage",required = false,defaultValue = "1") int currentPage,
			@RequestParam(value = "comDetCode",required = false) String comDetCode) {
		
		log.info("comDetCode : " + comDetCode);
		//직군코드 가져오기
		List<ComCodeInfoVO> comCodeList = this.boardInterViewService.comJob();
		log.info("인터뷰 직군코드 : " + comCodeList);
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("keyword", keyword);
		map.put("comDetCode", comDetCode);
		map.put("currentPage",currentPage);
		//list->map : {comDetCode=MWJ01000, keyword=, currentPage=2}
		log.info("list->map : " + map);
		
		//인터뷰 내용 가져오기.
		List<BoardInterViewVO> interViewList = this.boardInterViewService.listAll(map);
		log.info("인터뷰 내용  :"  + interViewList);
		
		int total = this.boardInterViewService.getTotal(map);
		
		ArticlePage<BoardInterViewVO> articlePage = new ArticlePage<BoardInterViewVO>(total, currentPage, 9,5, interViewList);
		
		articlePage.setComDetCode(comDetCode);
		articlePage.setKeyword(keyword);
		articlePage.setUrl("/boardInterView/list");
		
		model.addAttribute("comCodeList", comCodeList);
		model.addAttribute("interViewList",interViewList);
		model.addAttribute("articlePage", articlePage);
		
		return "boardInterView/list";
	}
	
	/**
	 * 인터뷰 상세페이지 가져 오는 기능
	 * @param BoardInterViewVO
	 * @param model
	 * @return
	 */
	@GetMapping("/detail")
	public String detail(BoardInterViewVO BoardInterViewVO,
			Model model){
		
		int result = this.boardInterViewService.countUp(BoardInterViewVO.getBoardId());
		
		BoardInterViewVO boardInterViewVO = this.boardInterViewService.detail(BoardInterViewVO);
		
		log.info("BoardInterViewVO->ㅇㅇㅇㅇㅇㅇㅇㅇ boardInterViewVO : " + boardInterViewVO);
		
		model.addAttribute("data", boardInterViewVO);
		
		return "boardInterView/detail";
	}
	
	/**
	 * 인터뷰 등록하는 페이지
	 * @param model
	 * @return
	 */
	@GetMapping("/create")
	public String create(Model model) {
		
		List<BoardInterViewQNACodeVO> boardInterViewQNACodeVO = this.boardInterViewService.QNACodeList();
		
		List<ComCodeInfoVO> comCodeList = this.boardInterViewService.comJob();
		
		log.info("인터뷰 직군코드 : " + comCodeList);
		
		log.info("QNACodeList :" + boardInterViewQNACodeVO);
		
		model.addAttribute("data", boardInterViewQNACodeVO);
		model.addAttribute("comCodeList", comCodeList);
		
		return "boardInterView/detailCreate";
	}
	
	
	/**
	 * 인터뷰 등록
	 * @param boardInterViewVO
	 * @return
	 */
	@Transactional
	@PostMapping("/createForm")
	public String createForm(BoardInterViewVO boardInterViewVO,Principal principal) {
		
		log.info("createForm->boardInterViewVO : " + boardInterViewVO);
		
		boardInterViewVO.setMemId(principal.getName());
		
		
		int result = this.boardInterViewService.createForm(boardInterViewVO);
		
		log.info("result : " + result);
		
		return "redirect:/boardInterView/list";
	}
	
	
	/**
	 * 인터뷰 수정 페이지로 넘겨주는 기능
	 * @param boardId
	 * @param model
	 * @return
	 */
	@GetMapping("/update")
	public String update(String boardId, Model model) {
		
		log.info("update boardId : " + boardId);
		
		List<BoardInterViewQNACodeVO> boardInterViewQNACodeVO = this.boardInterViewService.QNACodeList();
		
		List<ComCodeInfoVO> comCodeList = this.boardInterViewService.comJob();
		
		BoardInterViewVO boardInterViewVO = new BoardInterViewVO();
		
		boardInterViewVO.setBoardId(boardId);
		
		boardInterViewVO = this.boardInterViewService.selectUpdate(boardInterViewVO);
		
		log.info(" update -> boardinterViewVO : " + boardInterViewVO);
		
		model.addAttribute("data", boardInterViewQNACodeVO);
		model.addAttribute("boardInterViewVO", boardInterViewVO);
		model.addAttribute("comCodeList", comCodeList);
		
		
		return "boardInterView/detailUpdate";
		
	}
	
	/**
	 * 인터뷰 수정
	 * @param boardInterViewVO
	 * @param model
	 * @return
	 */
	@PostMapping("/updatePost")
	public String updatePost(BoardInterViewVO boardInterViewVO, Model model) {
		
		log.info("updatePost -> boardInterViewVO : " + boardInterViewVO);
		
		MemberVO memberVO = this.modelAttributeUtil.getCurrentLoginName();
		
		String memId = "";
		
		if(memId.length()<1) {
			memId = "admin2";
		}else {
			memId = memberVO.getMemId();
		}
		
		int result = this.boardInterViewService.updatePost(boardInterViewVO);
		log.info("result : " + result);
		
		
		return "redirect:/boardInterView/detail?boardId="+boardInterViewVO.getBoardId();
	}
	
	
	/**
	 * 인터뷰 삭제기능.
	 * @param boardInterViewVO
	 * @return
	 */
	@GetMapping("/delete")
	public String delete(BoardInterViewVO boardInterViewVO) {
		
		log.info("delete -> BoardInterViewVO : " + boardInterViewVO);
		
		int result = this.boardInterViewService.delete(boardInterViewVO);
		
		return "redirect:/boardInterView/list";
	}
	
	

}
