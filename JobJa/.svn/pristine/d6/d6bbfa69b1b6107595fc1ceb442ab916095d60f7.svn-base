package jobja.member.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import jobja.member.mapper.JobOfferMapper;
import jobja.member.service.JobOfferService;
import jobja.member.vo.EnterpriseVO;
import jobja.member.vo.JobOfferVO;
import jobja.mypage.member.vo.ConAprvVO;
import jobja.mypage.member.vo.MemberVO;
import jobja.report.vo.ReportVO;

@Service
public class JobOfferServiceImpl implements JobOfferService {

	@Autowired
	JobOfferMapper jobOfferMapper;
	
	@Override
	public List<JobOfferVO> getOffers(MemberVO memberVO) {
		return jobOfferMapper.getOffers(memberVO);
	}
	
	//마이페이지 일반회원이 제안받은 목록 가져오기
	@Override
	public List<JobOfferVO> myJobOffer(Map<String, Object> map) {
		return this.jobOfferMapper.myJobOffer(map);
	}
	//마이페이지 받은제안 목록에서 클릭한 기업 정보 가져오기.
	@Override
	public EnterpriseVO ajaxgetJobOfferEnt(String entNo) {
		return this.jobOfferMapper.ajaxgetJobOfferEnt(entNo);
	}
	//마이페이지 받은제안 총 갯수
	@Override
	public int getMyJobOfferTotal(Map<String, Object> map) {
		return this.jobOfferMapper.getMyJobOfferTotal(map);
	}

	@Override
	public List<ConAprvVO> getConAprvVo(Map<String, Object> map) {
		
		return this.jobOfferMapper.getConAprvVO(map);
	}

	@Override
	public List<ReportVO> getReportVo(Map<String, Object> map) {
		
		return this.jobOfferMapper.getReportVO(map);
	}


}
