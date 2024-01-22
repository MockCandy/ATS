package jobja.board.service;

import java.util.List;
import java.util.Map;

import jobja.board.vo.BoardInquiryVO;
import jobja.item.vo.PaymentVO;

public interface BoardInquiryService {

	// 일대일 문의게시판 글쓰기
	public int createPost(BoardInquiryVO boardInquiryVO);

	// 일대일 문의게시판 리스트
	public List<BoardInquiryVO> list(Map<String, Object> map);

	// 전체 행수
	public int getTotal(Map<String, Object> map);

	// 게시글 상세
	public BoardInquiryVO detail(String boardId);

	// 게시글 수정
	public int updatePost(BoardInquiryVO boardInquiryVO);

	// 게시글 삭제
	public int deletePost(BoardInquiryVO boardInquiryVO);
	
	//마이페이지 내가쓴 게시물 가져오기.
	public List<BoardInquiryVO> myList(Map<String, Object> map);

	// 일반회원, 상담사회원 채팅하기
	public PaymentVO chatConsultant(Map<String, Object> map);
	
	//총 갯수 가져오기
	public int getMyTotal(Map<String, Object> map);
	

}
