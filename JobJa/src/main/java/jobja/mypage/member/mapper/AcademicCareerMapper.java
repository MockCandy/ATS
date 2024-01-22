package jobja.mypage.member.mapper;

import java.util.List;

import jobja.mypage.member.vo.AcademicCareerVO;

public interface AcademicCareerMapper {
	
	//학력등록
	public int ajaxinsertmyAcademic(AcademicCareerVO academicCarrerVO);
	
	//학력조회
	public List<AcademicCareerVO> ajaxgetmyAcademic(String memId);
	
	//학력삭제
	public int ajaxdeleteAcademic(String acdmcrNo);
	
	//학력수정
	public int ajaxupdatemyAcademic(AcademicCareerVO academicCarrerVO);

}
