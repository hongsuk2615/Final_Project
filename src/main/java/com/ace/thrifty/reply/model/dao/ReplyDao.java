package com.ace.thrifty.reply.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ace.thrifty.reply.model.vo.Reply;

@Repository
public class ReplyDao {

	private SqlSession sqlSession;
	
	@Autowired
	public ReplyDao(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}

	public int replyInsert(Map<String, Object> paramMap) {
		return sqlSession.insert("replyMapper.replyInsert", paramMap);
	}

	public List<Reply> BoardReplyList(int bNo) {
		return sqlSession.selectList("replyMapper.BoardReplyList", bNo);
	}

	public int replyDelete(int rNo) {
		return sqlSession.update("replyMapper.replyDelete", rNo);
	}
}
