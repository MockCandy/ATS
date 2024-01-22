package jobja.atchfile.mapper;

import java.util.List;

import jobja.atchfile.vo.AtchFileDetailVO;
import jobja.atchfile.vo.AtchFileVO;
import jobja.board.vo.BoardQNAVO;

public interface AtchFileDetailMapper {

	//ATCH_FILE 테이블에 insert
	public int insertAtchFile(AtchFileVO atchFileVO);

	//ATCH_FILE_DETAIL 테이블에 insert
	public int insertAtchFileDetail(AtchFileDetailVO atchFileDetailVO);

	public int deleteOneAtch(AtchFileDetailVO atchFileDetailVO);

	public List<AtchFileDetailVO> list(AtchFileDetailVO atchFileDetailVO);

	public int deleteRelated(BoardQNAVO boardQNAVO);

	public int getCount(String afId);

	public void deleteAtchFile(String afId);

	public String getAfdSaveNm(String entNo);

	public AtchFileDetailVO getOneAtch(AtchFileDetailVO atchFileDetailVO);

	public List<AtchFileDetailVO> getAtchByAfId(String recruitNo);

	// ATCH-FILE에 AF_ID 있나 체크
	public int checkAfId(String checkAfId);

	// ATCH-FILE-DETAIL 이력서 첨부파일 제거(ajax)
	// {"afdSeq":"6","afId":"a111"}
	public int deleteFileAjax(AtchFileDetailVO atchFileDetailVO);
	
}
