package jobja.board.vo;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.web.multipart.MultipartFile;

import com.fasterxml.jackson.annotation.JsonFormat;

import jobja.atchfile.vo.AtchFileVO;
import jobja.mypage.member.vo.MemberVO;
import lombok.Data;

@Data
public class BoardInquiryVO {
	
	private String boardId;
	private String memId;
	private String boardTitle;
	private String boardCntnt;
	private String boardAdminAnswer;
	
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	@JsonFormat(shape=JsonFormat.Shape.STRING, pattern="yyyy-MM-dd", timezone = "Asia/Seoul")
	private Date wirtDt;
	
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	@JsonFormat(shape=JsonFormat.Shape.STRING, pattern="yyyy-MM-dd", timezone = "Asia/Seoul")
	private Date boardUpdtDt;
	
	private String emplTipAfId;
	
	private MultipartFile[] uploadFile;			
	
	private AtchFileVO atchFileVO;
	
	private String passedTime;
	
	private MemberVO memberVO;
	
}
