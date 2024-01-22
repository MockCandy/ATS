package jobja.member.vo;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.Data;

@Data
public class JobOfferVO {

	private String entNo;
	private String memId;
	private String resumeNo;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date offerDt;
	private String offerTitle;
	private String offerCntnt;
	private String offerResult;
	
	//마이페이지 받은제안에서 공고가져오기 위해.
	private String recruitNo;
	
	//마이페이지 받은제안에서 제안한 기업정보 가져오기 위해.
	private EnterpriseVO enterpriseVO;
	
	
}
