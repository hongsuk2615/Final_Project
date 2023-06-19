package com.ace.thrifty.message.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ace.thrifty.member.model.vo.Member;
import com.ace.thrifty.message.model.vo.Message;

@Repository
public class MessageDao {
	
	@Autowired
	SqlSession sqlSession;
	
	public int insertMessage(Message message) {
		return sqlSession.insert("messageMapper.insertMessage", message);
	}
	
	public List<Member> selectUsers(int userNo) {
		return sqlSession.selectList("messageMapper.selectUsers", userNo);
	}
	
	public List<Message> selectMessage(Map<String, Integer> map){
		return sqlSession.selectList("messageMapper.selectMessage", map);
	}

}
