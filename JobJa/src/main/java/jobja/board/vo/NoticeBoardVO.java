package jobja.board.vo;

import java.util.Date;
import java.util.List;

import org.hibernate.validator.constraints.NotBlank;
import org.springframework.web.multipart.MultipartFile;

import jobja.atchfile.vo.AtchFileDetailVO;
import jobja.atchfile.vo.AtchFileVO;
import lombok.Data;

/**
 * 공지사항  VO
 * @author 
 */
@Data
public class NoticeBoardVO {
	
	@NotBlank
	private int boardCnt;
	private String boardId;
	private String memId;
	private String boardTitle;
	private String boardCntnt;
	private Date boardWritingDt;
	private Date boardUpdtDt;
	private String ntbdAfId;
	private int rnum;
	
	// 페이지 이전글, 다음글
	private String prevno; //이전글의 글번호
	private String nextno; //다음글의 글번호

	public MultipartFile[] uploadFile;
	
	// 첨부파일 
	private AtchFileVO atchFileVO;

	// 첨부파일 상세
	public List<AtchFileDetailVO> atchFileDetailVOList;

	//몇분전 업로드한지 시간
	public void setPassedTime(String passedTime) {
		
		
	}

}
