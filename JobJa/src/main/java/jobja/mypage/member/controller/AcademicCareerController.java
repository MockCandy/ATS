package jobja.mypage.member.controller;

import java.security.Principal;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import jobja.mypage.member.service.AcademicCareerService;
import jobja.mypage.member.vo.AcademicCareerVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@RequestMapping("/academic")
@Controller
public class AcademicCareerController {
	
	@Autowired
	AcademicCareerService academicCareerService;
	
	//학력등록
	@PostMapping("/ajaxinsertmyAcademic")
	@ResponseBody
	public int ajaxinsertmyAcademic(@RequestBody List<AcademicCareerVO> academicCareerVOList) {
		
		log.info("djhsi???????와?");
		
		log.info("wpqkkkk재ㅔ발 : " + academicCareerVOList);
		
		int result = this.academicCareerService.ajaxinsertmyAcademic(academicCareerVOList);
		
		log.info("rhkdus? 고ㅓㅏ연" + result);
		
		return result;
		
	}
	
	//학력조회
	@PostMapping("/ajaxgetmyAcademic")
	@ResponseBody
	public List<AcademicCareerVO> ajaxgetmyAcademic(Principal principal){
		
		log.info("오냐?");
		
		List<AcademicCareerVO> academicVOList = this.academicCareerService.ajaxgetmyAcademic(principal.getName());
		
		log.info("받ㅇ라ㅏㅏㅏㅏㅏ : " + academicVOList);
		
		return academicVOList;
	}
	
	@PostMapping("/ajaxdeleteAcademic")
	@ResponseBody
	public int ajaxdeleteAcademic(@RequestBody AcademicCareerVO academicCareerVO) {
		
		log.info("dhis????????와???" +academicCareerVO);
		
		int result = this.academicCareerService.ajaxdeleteAcademic(academicCareerVO.getAcdmcrNo());
		
		log.info("삭제 result : " + result);
		
		return result;
	}
	
	@PostMapping("/ajaxupdatemyAcademic")
	@ResponseBody
	public int ajaxupdatemyAcademic(@RequestBody List<AcademicCareerVO> academicVOList) {
		
		log.info("ㅎㅁㄴㅇㅎㅁㄴㅇㅎ" + academicVOList);
		
		int result = this.academicCareerService.ajaxupdatemyAcademic(academicVOList);
		
		log.info("도ㅑㅐㅆ나유? " + result);
		
		return result;
	}

}
