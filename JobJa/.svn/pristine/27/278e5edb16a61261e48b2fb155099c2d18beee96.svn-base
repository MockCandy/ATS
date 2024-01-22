package jobja.member.service;

import java.util.List;

import jobja.member.vo.ApplicationVO;
import jobja.mypage.member.vo.MemberVO;
import jobja.mypage.member.vo.ResumeVO;
import jobja.recruit.vo.RecruitVO;

public interface ResumeService {

	List<ResumeVO> getResumes(MemberVO memberVO);

	List<ApplicationVO> getApplications(String resumeNo);
	
	//마이페이지 상담사신청 -> 나의 이력서 내역가져오기.
	List<ResumeVO> myResume(String memId);
	
	//마이페이지 상담사신청 -> 내가 선택한 이력서 가져오기.
	ResumeVO getCheckResume(String resumeNo);
	
}
