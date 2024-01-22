package jobja.board.service;

import java.util.List;
import java.util.Map;

import jobja.board.vo.BoardNewsVO;

public interface BoardNewsService {
	
	// 취업뉴스 insert
	public int createPost(BoardNewsVO boardNewsVO);
	
	//리스트 가지고오기
	public List<BoardNewsVO> list(Map<String,Object> map);
	
	//조회수별 리스트 가지고 오기
	public List<BoardNewsVO> listOrderBy();
	
	//디테일 
	public BoardNewsVO detail(String boardId);

	//조회수 증가
	public int countUpHit(BoardNewsVO boardNewsVO);

	//전체 행수 가지고오기
	public int getTotal(Map<String, Object> map);

	//수정
	public int updatePost(BoardNewsVO boardNewsVO);

	//삭제
	public int deletePost(BoardNewsVO boardNewsVO);

	public List<BoardNewsVO> getPopularList();

}
