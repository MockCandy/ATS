package jobja.mypage.member.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import jobja.mypage.member.mapper.AcademicCareerMapper;
import jobja.mypage.member.service.AcademicCareerService;
import jobja.mypage.member.vo.AcademicCareerVO;
@Service
public class AcademicCareerServiceImpl implements AcademicCareerService {
	
	@Autowired
	AcademicCareerMapper academicCareerMapper;
	
	//학력등록
	@Override
	public int ajaxinsertmyAcademic(List<AcademicCareerVO> academicCareerVOList) {
		
		int result = 0;
		
		for(AcademicCareerVO academicCarrerVO : academicCareerVOList) {
			result += this.academicCareerMapper.ajaxinsertmyAcademic(academicCarrerVO);
		}
		
		return result;
	}
	
	//학력조회
	@Override
	public List<AcademicCareerVO> ajaxgetmyAcademic(String memId) {
		return this.academicCareerMapper.ajaxgetmyAcademic(memId);
	}
	
	//학력삭제
	@Override
	public int ajaxdeleteAcademic(String acdmcrNo) {
		return this.academicCareerMapper.ajaxdeleteAcademic(acdmcrNo);
	}
	//학력수정
	@Override
	public int ajaxupdatemyAcademic(List<AcademicCareerVO> academicVOList) {
		
		int result = 0;
		
		for(AcademicCareerVO academicCarrerVO : academicVOList) {
			result += this.academicCareerMapper.ajaxupdatemyAcademic(academicCarrerVO);
		}
		
		return result;
	}
	
	
	

}
