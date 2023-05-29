package com.ace.thrifty.member.model.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ace.thrifty.member.model.vo.Member;

@Repository
public class MemberDao {
	
	@Autowired
	SqlSession sqlSession;
	
	public Member selectMember() {
		return sqlSession.selectOne("memberMapper.selectMember");
	}
	
	public int insertMember(Member m) {
		return sqlSession.insert("memberMapper.insertMember", m);
	}
	
	public Member loginMember(Member m) {
		return sqlSession.selectOne("memberMapper.loginMember", m);
	}
}
