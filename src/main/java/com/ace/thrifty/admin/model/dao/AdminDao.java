package com.ace.thrifty.admin.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ace.thrifty.member.model.vo.Member;

@Repository
public class AdminDao {

	private SqlSession sqlSession;
	
	@Autowired
	public AdminDao(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}
	
	public Member loginAdmin(Member m) {
		return sqlSession.selectOne("adminMapper.loginAdmin", m);
	}
	
	public List<Member> memberList() {
		return sqlSession.selectList("adminMapper.memberList");
	}
	
	public Map<String, Integer> selectInfoBox(){
		return sqlSession.selectOne("adminMapper.selectInfoBox");
	}
}
