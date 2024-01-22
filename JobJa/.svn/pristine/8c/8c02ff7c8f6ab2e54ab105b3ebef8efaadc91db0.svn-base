package jobja.member.vo;

import java.util.Date;
import org.springframework.format.annotation.DateTimeFormat;
import lombok.Data;

/**
 * 자기소개서 자유양식
 */
@Data
public class PortfolioFreeFormVO {

	private String ptflFreeNo;				// 자기소개서 번호
	private String memId;					// 자기소개 작성자
	private String ptflFreeTitle;			// 자기소개서 자유양식 제목
	private String ptflFreeq;				// 자기소개서 자유 질문
	private String ptflFreea;				// 자기소개서 자유 답변
	
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date ptflWritingDt;				// 자기소개서 작성날짜
	
	@DateTimeFormat(pattern = "yyyy-MM-dd HH:mm")
	private Date ptflUpdtDt;				// 자기소개서 수정일시
	
}
