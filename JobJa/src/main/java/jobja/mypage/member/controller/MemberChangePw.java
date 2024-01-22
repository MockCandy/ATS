package jobja.mypage.member.controller;

import java.security.Principal;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import jobja.common.vo.ComCodeInfoVO;
import jobja.common.vo.ComDetCodeInfoVO;
import jobja.mypage.member.mapper.MemProfileMapper;
import jobja.mypage.member.service.MemProfileService;
import jobja.mypage.member.vo.MemberVO;
import jobja.util.ModelAttributeUtil;
import lombok.extern.java.Log;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@RequestMapping("/member")
@Controller
public class MemberChangePw {
	
	@Autowired
	MemProfileService memProfileService;
	
	@Autowired
	ModelAttributeUtil modelAttributeUtil;
	

}








