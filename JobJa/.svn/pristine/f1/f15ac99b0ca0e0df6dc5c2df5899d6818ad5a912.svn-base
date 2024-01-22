package jobja.board.vo;

import java.util.Date;
import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import jobja.atchfile.vo.AtchFileDetailVO;
import jobja.likes.vo.LikesVO;
import jobja.reply.vo.ReplyVO;
import lombok.Data;

@Data
public class BoardQNAVO {

	private String boardId;
	private String memId;
	private String boardTitle;
	private String boardCntnt;
	private Date boardWritingDt;
	private Date boardUpdtDt;
	private String qnaAfId;
	private int boardCnt;
	private int boardLike;
	private String passedTime;
	
	private List<ReplyVO> replys;
	
	private List<LikesVO> likes;
	
	// form을 통해 전달된 파일 객체들
	private MultipartFile[] uploadFile;
	
	// BOM : ATCH_FILE_DETAIL = 1 : N
	private List<AtchFileDetailVO> atchFileDetailVOList;
	
}
