package com.ace.thrifty.reply.model.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ace.thrifty.reply.model.dao.ReplyDao;
import com.ace.thrifty.reply.model.vo.Reply;

@Service
public class ReplyServiceImpl implements ReplyService{

	private ReplyDao replyDao;
	
	@Autowired
	public ReplyServiceImpl(ReplyDao replyDao) {
		this.replyDao = replyDao;
	}

	@Override
	public int replyInsert(Map<String, Object> paramMap) {
		return replyDao.replyInsert(paramMap);
	}

	@Override
	public List<Reply> BoardReplyList(int bNo) {
		return replyDao.BoardReplyList(bNo);
	}

	@Override
	public int replyDelete(int rNo) {
		return replyDao.replyDelete(rNo);
	}
}
