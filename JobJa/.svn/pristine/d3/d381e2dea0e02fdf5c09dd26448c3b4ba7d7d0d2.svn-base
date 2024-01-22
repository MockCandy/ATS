package jobja.member.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import jobja.member.mapper.ResumeMapper;
import jobja.member.service.ResumeService;
import jobja.member.vo.ApplicationVO;
import jobja.mypage.member.vo.MemberVO;
import jobja.mypage.member.vo.ResumeVO;

@Service
public class ResumeServiceImpl implements ResumeService{

	@Autowired
	ResumeMapper resumeMapper;
	
	@Override
	public List<ResumeVO> getResumes(MemberVO memberVO) {
		return resumeMapper.getResumes(memberVO);
	}

	@Override
	public List<ApplicationVO> getApplications(String resumeNo) {
		return resumeMapper.getApplications(resumeNo);
	}
	
	//마이페이지 상담사신청 -> 나의 이력서 내역가져오기.
	@Override
	public List<ResumeVO> myResume(String memId) {
		return this.resumeMapper.myResume(memId);
	}
	
	//마이페이지 상담사신청 -> 내가 선택한 이력서 가져오기.
	@Override
	public ResumeVO getCheckResume(String resumeNo) {
		return this.resumeMapper.getCheckResume(resumeNo);
	}


}
