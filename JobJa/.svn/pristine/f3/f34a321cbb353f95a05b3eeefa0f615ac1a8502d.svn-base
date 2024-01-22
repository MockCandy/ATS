package jobja.mypage.member.vo;

import java.util.List;

import jobja.common.vo.ComCodeInfoVO;
import jobja.member.vo.ApplicationVO;
import lombok.Data;

@Data
public class ResumeVO {
	
	private String resumeNo;
	private String memId;
	private String resumeTitle;
	private String resumeTemp;
	private String resumeRep;
	private String resumeCd;
	private String resumeAfId;
	private String resumeYn;
	private String resumeSkill;
	private String resumeOccp;
	private String resumeJob;
	
	// RESUME : CAREER = 1 : N
	private List<CareerVO> careerVOList;
	
	// RESUME : LANGUAGE = 1 : N
	private List<LanguageVO> languageVOList;
	
	// RESUME : RESULT = 1 : N
	private List<ResultVO> resultVOList;
	
	// RESUME : AWARDS = 1 : N
	private List<AwardsVO> awardsVOList;

	// RESUME : APPLICATION = 1 : N
	private List<ApplicationVO> applicationVOList;
	
	// RESUME : ComCodeInfoVO = 1 : N 인데 그냥 List로 함.
	private List<ComCodeInfoVO> comCodeInfoVOList;
	
	
}
