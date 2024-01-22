package jobja.member.controller;

import java.security.Principal;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import jobja.member.service.EnterpriseService;
import jobja.member.vo.EnterpriseVO;
import jobja.report.vo.ReportVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@RequestMapping("/entApplication")
@Controller
public class EnterApplicationController {
	
	   @Autowired
	   EnterpriseService enterpriseService;
	
	 @GetMapping("/offerEntList")
     public String offerEntList(Principal principal, Model model) {
  	   
  	   String memId = principal.getName();
  	   
  	   List<EnterpriseVO> list = this.enterpriseService.getEntOfferList(memId);
  	   
  	   model.addAttribute("list",list);
  	   
  	   return "mypageEnt/offerEntList";
  	   
     }
	 
	 @GetMapping("/offerReportList")
	 public String offerReportList(Principal principal,Model model) {
		 
		 String memId = principal.getName();
		 
			
			Map<String, Object> map = new HashMap<String, Object>();
			
			map.put("memId", memId);
			
			List<ReportVO> list = this.enterpriseService.getReportVo(map);
			
			model.addAttribute("list", list);
			
			return "mypageEnt/offerReportList";
	 }
}
