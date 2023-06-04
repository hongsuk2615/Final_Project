package com.ace.thrifty.myPage.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class MyPageDao {

	@Autowired
	SqlSession sqlSession;
	
	public String selectMyPage() {
		
		return sqlSession.selectOne("mypageMapper.selectMyPage");
		
		
	}
	
	
	
}
