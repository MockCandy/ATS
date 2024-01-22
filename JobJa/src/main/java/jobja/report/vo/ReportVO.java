package jobja.report.vo;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.Data;

@Data
public class ReportVO {

	private String repNo;
	private String repSubId;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date repDt;
	private String repReason;
	private String repTypeCd;
	private String reporterId;
	private String adminId;
	private String repResultCd;
	private String repResultCntnt;
	private String repBoardId;
	
}
