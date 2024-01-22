package jobja.mypage.member.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import jobja.mypage.member.service.MemProfileService;
import jobja.mypage.member.vo.MemberVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@RequestMapping("/member")
@Controller
public class MemberProfileController {
	
	@Autowired
	MemProfileService memProfileService;
	
	@GetMapping("/profile")
	public String profile() {
		
		
		return "mypageMem/memProfile";
	}

}
