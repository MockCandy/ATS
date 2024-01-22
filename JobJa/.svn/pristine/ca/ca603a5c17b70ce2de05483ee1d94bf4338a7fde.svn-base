package jobja.report.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import jobja.report.service.ReportService;
import jobja.report.vo.ReportVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/report")
public class ReportController {

	@Autowired
	ReportService reportService;
	
	@ResponseBody
	@PostMapping("/ajaxReport")
	public int ajaxReport(@RequestBody ReportVO reportVO) {
		
		 log.info("reportVO : " + reportVO);
		
		 int result = reportService.report(reportVO);
		 
		 return result;
	}
	
	
}
