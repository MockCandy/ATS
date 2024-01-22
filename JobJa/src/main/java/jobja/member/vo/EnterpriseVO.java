package jobja.member.vo;

import java.util.Date;
import java.util.List;

import org.hibernate.validator.constraints.NotBlank;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.web.multipart.MultipartFile;

import com.fasterxml.jackson.annotation.JsonFormat;

import jobja.atchfile.vo.AtchFileDetailVO;
import jobja.board.vo.BoardEntReviewVO;
import jobja.common.vo.ComCodeInfoVO;
import jobja.common.vo.ComDetCodeInfoVO;
import jobja.mypage.member.vo.MemberVO;
import jobja.recruit.vo.RecruitVO;
import lombok.Data;

@Data
public class EnterpriseVO {
	
	private String rnum; 						//ROWNUM
	
	@NotBlank
	private String entNo;						//사업자등록번호(N.N)
	@NotBlank
	private String entNm;						//기업명(N.N)
	@NotBlank
	private String entAprv;						//기업승연여부(N.N)
	private String entPostno;					//우편번호
	private String entAddr;						//주소
	private String entAddr2;					//상세주소
	@DateTimeFormat(pattern = "yyyy-MM-dd")		
	private Date entRegDt;						//신청일자(N.N , sysdate)
	@DateTimeFormat(pattern = "yyyy-MM-dd")		
	private Date entAprvDt;						//승인일자
	private String entIntrcn;					//기업소개
	private String entUrl;						//기업사이트주소
	private int entSales;						//기업매출액
	@NotBlank
	private String entSector;					//기업산업군(N.N)
	private int entEmpcnt;						//기업직원수
	@DateTimeFormat(pattern = "yyyy-MM-dd")		
	@JsonFormat(shape=JsonFormat.Shape.STRING, pattern="yyyy-MM-dd", timezone = "Asia/Seoul")
	private Date entBday;						//설립일자 (N.N)
	private String entFax;						//기업팩스번호
	@NotBlank
	private String entCeonm;					//대표자명 (N.N)
	private String entLogo;						//기업로고
	private String entIntWord;					//기업관심키워드
	private MemberVO memberVO;					//memberVO
	private String recruitLocation;             //근무지역
	private String jobNd;       //직업번호
	private int reviewCount;					//리뷰 수
	private float sumEntRevChances;				// 승진 기회 및 가능성 평균
	private float sumEntRevWelfare;				// 복지 및 급여 평균
	private float sumEntRevBalance;				// 업무와 삶의 균형 평균
	private float sumEntRevCulture;				// 사내문화 평균
	private float sumEntRevManager;				// 경영진 평균
	private float sumEntRevCeoView;				// CEO에 대한 견해 
	private float sumEntRevPotential;			// 기업의 전망
	private float sumEntRevRecomendYn;			// 기업 추천 여부
	private float entAvgRate;					// 항목 평균
	private String regYear;
	private float rslt;							//마이페이지 평균
	
	private String enterpriseEntNo; 			//채용상품 구매기업
	
	//파일업로드
	private MultipartFile[] uploadFile;
	
	// ENTERPRISE : ATCH_FILE_DETAIL = 1 : N
	private List<AtchFileDetailVO> atchFileDetailVOList;

	// ENTERPRISE : ENT_REVIEW = 1 : N
	private List<BoardEntReviewVO> boardEntReviewVOList;

	// ENTERPRISE : RECRUIT= 1 : N
	private List<RecruitVO> recruitVOList;
	
	// 공통코드 가져오기
	private List<ComCodeInfoVO> comCodeInfoVOList;
	
	// 공통상세 코드 가져오기
	private List<ComDetCodeInfoVO> comDetCodeInfoVOList;
	
	private String memId;
	private String entYn;
	
	
}
