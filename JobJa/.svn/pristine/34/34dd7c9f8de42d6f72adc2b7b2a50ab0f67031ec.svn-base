package jobja.likes.mapper;

import java.util.List;

import jobja.board.vo.BoardEntReviewVO;
import jobja.board.vo.BoardQNAVO;
import jobja.likes.vo.LikesVO;

public interface LikesMapper {

	int like(BoardQNAVO boardQNAVO);
	
	int unlike(BoardQNAVO boardQNAVO);

	int getCount(BoardQNAVO boardQNAVO);

	List<LikesVO> getLikes(String boardId);

	int getEntReviewCount(BoardEntReviewVO boardEntReviewVO);

	int entReviewUnlike(BoardEntReviewVO boardEntReviewVO);

	int entReviewLike(BoardEntReviewVO boardEntReviewVO);

	
	
}
