package jobja.mypage.member.service.impl;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import jobja.mypage.member.mapper.ConAprvMapper;
import jobja.mypage.member.service.ConAprvService;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class ConAprvServiceImpl implements ConAprvService{

	@Autowired
	ConAprvMapper conAprvMapper;
	
	//마이페이지 상담사 신청
	@Override
	public int ajaxApplyCon(Map<String, Object> map) {
		
		int result = this. conAprvMapper.ajaxApplyCon(map);
		
		String memId = (String)map.get("memId");
		
		//상담사 신청 후 회원테이블 승인 컬럼 승인 대기로 바꿈.
		result += this.conAprvMapper.updateMemApproval(memId);
		
		return result;
	}

}
