package jobja.reply.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import jobja.reply.mapper.ReplyMapper;
import jobja.reply.service.ReplyService;
import jobja.reply.vo.ReplyVO;

@Service
public class ReplyServiceImpl implements ReplyService{

	@Autowired
	ReplyMapper replyMapper;
	
	@Override
	public List<ReplyVO> getReply(String boardId) {
		return replyMapper.getReply(boardId);
	}

	@Override
	public int writeReply(ReplyVO replyVO) {
		return replyMapper.writeReply(replyVO);
	}

}
