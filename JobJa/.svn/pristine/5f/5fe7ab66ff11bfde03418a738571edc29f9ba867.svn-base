package jobja.mypage.enterprise.controller;


import java.security.Principal;
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
import org.springframework.web.bind.annotation.ResponseBody;

import jobja.atchfile.vo.AtchFileDetailVO;
import jobja.common.vo.ComCodeInfoVO;
import jobja.common.vo.ComDetCodeInfoVO;
import jobja.item.service.ItemService;
import jobja.item.vo.ItemVO;
import jobja.item.vo.PaymentVO;
import jobja.member.vo.EnterpriseVO;
import jobja.mypage.enterprise.service.EntProfileService;
import jobja.mypage.member.service.MemProfileService;
import jobja.mypage.member.service.MemberService;
import jobja.mypage.member.vo.MemberVO;
import jobja.mypage.member.vo.ResumeVO;
import jobja.recruit.vo.RecruitVO;
import jobja.util.ArticlePage;
import jobja.util.ModelAttributeUtil;
import lombok.extern.slf4j.Slf4j;

@RequestMapping("/entPremium")
@Slf4j
@Controller
public class EnterPremiumController {
	
	@Autowired
	ItemService itemService;
	
	// 기업 상품 목록 가져오기.
	@GetMapping("/itemList")
	public String items(Model model,Principal principal) {
		
		//배너광고 가져오기.
		List<ItemVO> banneritemVOList =  this.itemService.getBannerItemList();
		
		//채용광고 가져오기.
		List<ItemVO> recruitItemVOList =  this.itemService.getRecruitItemList();
		
		//로그인한 회원의 기업정보
		MemberVO memberVO = this.itemService.getLoginEntInfo(principal.getName());
		
		log.info("banneritemVOList gg : " + banneritemVOList);
		
		log.info("recruitItemList ㅎㅇㅎㅇ : " + recruitItemVOList);
		
		log.info("memberVO : " + memberVO);
		
		
		model.addAttribute("banneritemVOList", banneritemVOList);
		model.addAttribute("recruitItemVOList", recruitItemVOList);
		model.addAttribute("memberVO",memberVO);
		
		return "mypageEnt/entItems";
	}
	
	
	
	@GetMapping("/payitems")
	public String payitems(Principal principal,Model model,
			@RequestParam(value = "currentPage", required = false, defaultValue = "1")int currentPage
			) {
		int size = 10;
		int pageSize = 5;
		String memId = principal.getName();
		
		Map<String, Object> map = new HashMap<String, Object>();
		
		map.put("size", size);
		map.put("memId", memId);
		map.put("currentPage", currentPage);
		
		
		MemberVO memberVO = this.itemService.getLoginEntInfo(principal.getName());
		
		log.info("memberVO 기업 정보: " + memberVO);
		
		map.put("entNo", memberVO.getEntNo());
		
		//기업이 구매한 상품 내역
		List<PaymentVO> paymentVOList = this.itemService.getEntPayTotalList(map);
		
		log.info("ppaymentVOLista ㅇㅇㅇ: " + paymentVOList);
		
		int getEntpayTotal = this.itemService.getEntpayTotal(map);
		 
		
		ArticlePage<PaymentVO> info = new ArticlePage<PaymentVO>(getEntpayTotal, currentPage, size, pageSize, paymentVOList);
		
		//기업 총 구매 금액
		PaymentVO entTotalPay = this.itemService.getEntPayTotalMoney(memberVO.getEntNo());
		
		log.info("entTotalPay  : ㅇㅇ" + entTotalPay );
		
		info.setUrl("/entPremium/payitems");
		
		model.addAttribute("memberVO", memberVO);
		model.addAttribute("paymentVOList", paymentVOList);
		model.addAttribute("entTotalPay", entTotalPay);
		model.addAttribute("info", info);
		 
		return "mypageEnt/entPayitems";
	}
	
	
	
	
	
	
}

