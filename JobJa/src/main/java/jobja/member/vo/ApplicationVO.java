package jobja.member.vo;

import java.util.Date;
import java.util.List;

import org.springframework.format.annotation.DateTimeFormat;

import com.fasterxml.jackson.annotation.JsonFormat;

import jobja.common.vo.ComDetCodeInfoVO;
import lombok.Data;

@Data
public class ApplicationVO {
	
	private String appNo;					// 입사지원 번호
	private String memId;					// 회원ID
	private String recruitNo;				// 채용공고번호
	private String resumeNo;				// 이력서 번호
	private String ptflNo;					// 자기소개서 번호
	@DateTimeFormat(pattern = "yyyy-MM-dd")	
	private Date appStdt;					// 채용 시작일
	private String appStateCd;				// 입사지원상태코드 - 공통코드로 관리
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date appStateDt;				// 상태변경일
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	@JsonFormat(shape=JsonFormat.Shape.STRING, pattern="yyyy-MM-dd", timezone = "Asia/Seoul")
	private Date appApplyDt;				// 입사지원일
	private String gubun;					// 자기소개서 구분
	
	private int rnum;						// 순번

	//마이페이지 내가 지원한 공고제목 가져오기.
	private String recruitTitle;
	
	//마이페이지 내가 지원한 공고의 상태를 알기위해.
	private String appStateNm;
	
	// 공통코드 - 입사지원상태 (APP01)
	public List<ComDetCodeInfoVO> comDetCodeInfoVOList;
	
	// 이력서 제목
	public String resumeTitle;
	
	// 자소서 제목
	public String ptflTitle;
	
	//엑셀 용 지원자 이름
	public String memNm;
	
	//엑셀 용 지원자 성별
	public String memGen;
	
	//엑셀 용 지원자 전화번호
	public String memTel;
	
}
