package jobja.application.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import jobja.application.service.ApplicationService;
import jobja.member.vo.ApplicationVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/application")
public class ApplicationController {

	@Autowired
	ApplicationService applicationService;
	
	@ResponseBody
	@PostMapping("/insert")
	public ApplicationVO insert(@RequestBody ApplicationVO applicationVO) {
		
		log.info("applicationVO : " + applicationVO);
		
		int result = applicationService.insert(applicationVO);
		
		return applicationVO;

	}

	
}
