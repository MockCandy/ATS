package jobja.recruit.vo;

import java.util.Date;
import java.util.List;

import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.web.multipart.MultipartFile;

import jobja.common.vo.ComCodeInfoVO;
import jobja.member.vo.EnterpriseVO;
import jobja.member.vo.InterestRecruitVO;
import lombok.Data;

//recruitVO
@Data
public class RecruitVO {

	private String recruitNo; // 채용공고 번호
	
	@DateTimeFormat(pattern = "yyyy-MM-dd")//1
	private Date recruitStdt; // 채용 시작일
	
	@DateTimeFormat(pattern = "yyyy-MM-dd")   //1
	private Date recruitEddt; // 채용 종료일*`
	
	private String recruitTitle; // 공고 제목*   1
	
	private String recruitCntnt; // 공고내용* 1
	
	private String recruitWork; // 주요업무* 1 
	
	private String recruitQlf; // 자격요건*  1
	
	private String recruitPrefer; // 우대사항*  1
	
	private int recruitSalary; // 연봉*  1
	
	private String recruitLocation; // 근무지역*  1 2)
	
	private MultipartFile[] uploadFile; //게시글 첨부파일
	
	private MultipartFile[] uploadFile1; //썸네일 첨부파일
	
	private String recruitAfId; // 채용공고 첨부파일* 1
	
	private String entNo; // 사업자 등록번호*  1
	
	private String recruitLevel; // 직급*    1
	
	private String recruitWorkType; // 고용형태*  1 3)
	
	private String recruitAcdmCr; // 학력*    1 4)
	
	private String recruitCareer; // 경력*   1
	
	private int recruitCount; // 모집 인원수*  1
	
	private List<BenefitsVO> benefitsVOList;
	
	private ComCodeInfoVO comCodeInfoVO; //직군코드   1
	
	private String recruitThumb; // 채용공고 썸네일
	
	private String recruitPart;
	
	private EnterpriseVO enterpriseVO;
	
	private String entNm;
	
	private String recruitOtt; //직종1)
	
	private String recruitJob; //직업
	
	private String recruitSkill;
	
	private String remainingDate;
	
	private String comCd;
	
	private String cnt; // 해당 공고가 스크랩 된 횟수
	
	//관심공고
	private InterestRecruitVO interestRecruitVO;
	
	private String passedTime;
	
	private String recruitEntNo;	//채용상품 기업.
	
	private int appCount;			// 지원자 수
	
}
