package jobja.mypage.member.vo;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import com.fasterxml.jackson.annotation.JsonFormat;

import lombok.Data;

@Data
public class AcademicCareerVO {
	
	private String acdmcrNo;		//학력번호
	private String memId;			//회원ID
	private String acdmcrNm;		//학교이름
	private String acdmcrMajor;		//전공
	private String acdmcrDegree;	//학위
	
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	@JsonFormat(shape=JsonFormat.Shape.STRING, pattern="yyyy-MM-dd", timezone = "Asia/Seoul")
	private Date acdmcrEntranceDt;	//입학일
	
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	@JsonFormat(shape=JsonFormat.Shape.STRING, pattern="yyyy-MM-dd", timezone = "Asia/Seoul")
	private Date acdmcrGrdtnDt;		//졸업일
	
	private String acdmcrAttnd;		//재학여부
	private float acdmcrPoint;		//학점
	private String acdmcrYn;		//학력사용여부
	
	private String acdmcrEducation; //학력

}
