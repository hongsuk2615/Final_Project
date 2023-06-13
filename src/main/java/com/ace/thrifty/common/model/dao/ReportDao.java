package com.ace.thrifty.common.model.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ace.thrifty.common.model.vo.ReportCategory;

@Repository
public class ReportDao {
	
	private SqlSession sqlSession;
	
	@Autowired
	public ReportDao(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}
	
	public List<Object> reportList(){
		return sqlSession.selectList("reportMapper.reportList");
	}
}
