package jobja.board.mapper;

import java.util.List;
import java.util.Map;

import jobja.board.vo.NoticeBoardVO;

public interface NoticeBoardMapper {

	// 공지사항 목록
	public List<NoticeBoardVO> list(Map<String,Object> map);

	// 총 페이지 수
	public int getTotal(Map<String, Object> map);

	// 공지사항 등록
	public int createForm(NoticeBoardVO noticeVO);

	// 기본키 다음 값 가져오기
	public String getBoardId();
	
	// 공지사항 상세보기
	public NoticeBoardVO detail(NoticeBoardVO noticeBoardVO);
	
	// 공지사항 이전글, 다음글 번호 가져오기
	public NoticeBoardVO detailPreNext(NoticeBoardVO noticeBoardVO);

	// 공지사항 수정
	public int updatePost(NoticeBoardVO noticeVO);
	
	// 공지사항 삭제
	public int deletePost(NoticeBoardVO noticeVO);
	
	// 첨부파일 삭제
	public int delAtch(String boardId);

	// 첨부파일 상세 삭제
	public int delAtchdt(String boardId);

}
