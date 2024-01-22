package jobja.mypage.member.vo;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import com.fasterxml.jackson.annotation.JsonFormat;

import lombok.Data;

@Data
public class AwardsVO {
	
	private String awdNo;
	private String resumeNo;
	private String awdNm;
	private String awdCntnt;
	
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	@JsonFormat(shape=JsonFormat.Shape.STRING, pattern="yyyy-MM-dd", timezone = "Asia/Seoul")
	private Date awdDt;
	
	private String awdOrg;
	
	private int awdSeq;

}
