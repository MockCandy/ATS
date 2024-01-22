package jobja.board.service;

import java.util.List;
import java.util.Map;

import jobja.board.vo.BoardEntReviewVO;
import jobja.member.vo.EnterpriseVO;


public interface BoardEntReviewService {

	int createPost(BoardEntReviewVO boardEntReviewVO);

	List<BoardEntReviewVO> getByEntNo(Map<String, Object> map);

	int ajaxLikeUp(BoardEntReviewVO boardEntReviewVO);

	int getTotalCount(String entNo);

	EnterpriseVO ajaxGetEntInfo(EnterpriseVO enterpriseVO);

	List<BoardEntReviewVO> getRecent();

	// 리뷰 가져오기
	public List<BoardEntReviewVO> brdEnterpriseVOList(String memId);
	
	//마이페이지 내가 쓴 기업 리뷰 목록 가져오기
	public List<BoardEntReviewVO> getmyEntReview(Map<String, Object> map);
	
	//마이페이지
	public int getMyTotal(Map<String, Object> map);

	// 리뷰 목록
	public BoardEntReviewVO entReviewVO(String entRevNo);


}
