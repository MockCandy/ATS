package jobja.board.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import jobja.board.mapper.BoardEntReviewMapper;
import jobja.board.service.BoardEntReviewService;
import jobja.board.vo.BoardEntReviewVO;
import jobja.likes.mapper.LikesMapper;
import jobja.member.vo.EnterpriseVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class BoardEntReviewServiceImpl implements BoardEntReviewService {
	
	@Autowired
	BoardEntReviewMapper boardEntReviewMapper;

	@Autowired
	LikesMapper likesMapper;
	
	@Override
	public int createPost(BoardEntReviewVO boardEntReviewVO) {
		return boardEntReviewMapper.createPost(boardEntReviewVO);
	}

	@Override
	public List<BoardEntReviewVO> getByEntNo(Map<String, Object> map) {
		return boardEntReviewMapper.getByEntNo(map);
	}
	

	@Override
	public int ajaxLikeUp(BoardEntReviewVO boardEntReviewVO) {

		log.info("ajaxLikeUp -> boardEntReviewVO : " + boardEntReviewVO);
		
		int count = likesMapper.getEntReviewCount(boardEntReviewVO);
		
		log.info("ajaxLikeUp -> count : " + count);
		
		int result = 0;
		
		if(count >= 1) {
			result += boardEntReviewMapper.ajaxLikeCancel(boardEntReviewVO);
			result += likesMapper.entReviewUnlike(boardEntReviewVO);
		}else {
			result = boardEntReviewMapper.ajaxLikeUp(boardEntReviewVO);
			result += likesMapper.entReviewLike(boardEntReviewVO);
		}
		
		return result;
	}

	@Override
	public int getTotalCount(String entNo) {
		return boardEntReviewMapper.getTotalCount(entNo);
	}

	@Override
	public EnterpriseVO ajaxGetEntInfo(EnterpriseVO enterpriseVO) {
		return boardEntReviewMapper.ajaxGetEntInfo(enterpriseVO);
	}

	@Override
	public List<BoardEntReviewVO> getRecent() {
		return boardEntReviewMapper.getRecent();
	}

	// 리뷰가져오기
	@Override
	public List<BoardEntReviewVO> brdEnterpriseVOList(String memId) {
		return boardEntReviewMapper.brdEnterpriseVOList(memId);
	}
	
	//마이페이지 내가 쓴 기업 리뷰 가져오기
	@Override
	public List<BoardEntReviewVO> getmyEntReview(Map<String, Object> map) {
		return boardEntReviewMapper.getmyEntReview(map);
	}
	
	//마이페이지
	@Override
	public int getMyTotal(Map<String, Object> map) {
		return boardEntReviewMapper.getMyTotal(map);
	}

	// 리뷰 상세보기
	@Override
	public BoardEntReviewVO entReviewVO(String entRevNo) {
		return boardEntReviewMapper.entReviewVO(entRevNo);
	}

}
