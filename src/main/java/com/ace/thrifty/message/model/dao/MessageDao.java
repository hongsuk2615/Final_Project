package com.ace.thrifty.message.model.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ace.thrifty.message.model.vo.Message;

@Repository
public class MessageDao {
	
	@Autowired
	SqlSession sqlSession;
	
	public int insertMessage(Message message) {
		return sqlSession.insert("messageMapper.insertMessage", message);
	}

}
