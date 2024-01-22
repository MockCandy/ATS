package jobja.blacklist.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import jobja.blacklist.service.BlackListService;
import jobja.blacklist.vo.BlackListVO;
import lombok.extern.slf4j.Slf4j;


@RequestMapping("/blackList")
@Slf4j
@Controller
public class BlackListController {

	@Autowired
	BlackListService blackListService;
	
	@RequestMapping(value = "adminBlackListPage")
	public String BlackList(BlackListVO blackListVO,Model model, @RequestParam( value = "currentPage",required = false,defaultValue="1")int currentPage) {
		
		
		return "admin/adminBlackListPage";
	}
	
}
