package jobja.board.mapper;

import java.util.List;
import java.util.Map;

import jobja.board.vo.BoardQNAVO;
import jobja.reply.vo.ReplyVO;

public interface BoardQNAMapper {

	String getBoardId();
	
	int createPost(BoardQNAVO boardQNAVO);

	List<BoardQNAVO> list(Map<String, Object> map);

	int getTotal(Map<String, Object> map);

	BoardQNAVO detail(BoardQNAVO boardQNAVO);

	int delete(BoardQNAVO boardQNAVO);

	int update(BoardQNAVO boardQNAVO);

	void countUp(String boardId);

	int ajaxLikeUp(BoardQNAVO boardQNAVO);

	int ajaxLikeCancel(BoardQNAVO boardQNAVO);

	int getCount(BoardQNAVO boardQNAVO);
	
	//마이페이지 ->내가 쓴 취업QNA글 목록 가져오기.
	public List<BoardQNAVO> myList(Map<String, Object> map);
	
	//마이페이지 ->내가 쓴 취업QNA댓글 목록 가져오기.
	public List<ReplyVO> myReplyList(Map<String, Object> map);

	List<BoardQNAVO> getPopular5();
	
	//마이페이지 총 갯수
	int getMyTotal(Map<String, Object> map);
	
	//마이페이지 댓글 총 갯수
	public int getmyReplyTotal(Map<String, Object> map);

	
}
