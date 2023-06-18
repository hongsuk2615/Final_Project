package com.ace.thrifty.report.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ace.thrifty.report.model.vo.ReportCategory;

@Repository
public class ReportDao {
	
	private SqlSession sqlSession;
	
	@Autowired
	public ReportDao(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}
	
	public List<ReportCategory> reportList(){
		return sqlSession.selectList("reportMapper.reportList");
	}
	
	public int reportInsert(Map<String, Object> paramMap) {
		return sqlSession.insert("reportMapper.reportInsert", paramMap);
	}
	
	public int reportCount(Map<String, Object> paramMap) {
		return sqlSession.update("reportMapper.reportCount", paramMap);
	}

}
