package jobja.reply.mapper;

import java.util.List;

import jobja.reply.vo.ReplyVO;

public interface ReplyMapper {

	List<ReplyVO> getReply(String boardId);

	int writeReply(ReplyVO replyVO);

}
