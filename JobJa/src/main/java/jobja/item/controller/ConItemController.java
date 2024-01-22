package jobja.item.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import jobja.item.service.ItemService;
import jobja.item.vo.ItemVO;
import jobja.item.vo.PaymentVO;
import jobja.mypage.member.vo.MemberVO;
import jobja.util.ModelAttributeUtil;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@RequestMapping("/consult")
@Controller
public class ConItemController {
	
	@Autowired
	ItemService itemService;
	 
	@Autowired
	ModelAttributeUtil modelAttributeUtil;
	
	@RequestMapping(value = "/items")
	public String items(Model model,ItemVO itemVO) {
		
		log.info("itemVO" + itemVO);
		
		MemberVO memberVO = modelAttributeUtil.getCurrentLoginName();
		
		log.info("memberVO2" + memberVO);
		
		List<ItemVO> consultItemVOList = this.itemService.getConsultItemList();
		
		String conMemId = itemVO.getConMemId();
		
		model.addAttribute("conMemId", conMemId);
		
		model.addAttribute("consultItemVOList", consultItemVOList);
		
		model.addAttribute("memberVO", memberVO);
		
		log.info("conMemId"+conMemId);
		
		return "mypageMem/consultItems";
	}
	

	@ResponseBody
	@RequestMapping(value = "/insertPayment")
	public int insertPayment(Model model, @RequestBody PaymentVO paymentVO) {

		log.info("paymentVO : " + paymentVO);

		int result = this.itemService.insertMemPayMent(paymentVO);
		
		return result;
	}
	
	
	
}
