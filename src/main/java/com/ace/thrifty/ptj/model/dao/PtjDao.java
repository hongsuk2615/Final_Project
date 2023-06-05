package com.ace.thrifty.ptj.model.dao;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ace.thrifty.ptj.model.vo.Ptj;

@Repository
public class PtjDao {
	
	@Autowired
	SqlSession sqlSession;
	
	public Ptj selectPtjDetail(int boardNo) {
		return sqlSession.selectOne("ptjMapper.selectPtjDetail" , boardNo);
	}
	
	public List<Ptj> selectPtj(String categorySNo) {
		return sqlSession.selectList("ptjMapper.selectPtj", categorySNo);
	}
	
	public List<Ptj> selectPtjAll() {
		return sqlSession.selectList("ptjMapper.selectPtjAll");
	}
	
	public int insertPtj(Ptj p) {
		return sqlSession.insert("ptjMapper.insertPtj" , p);
	}
	
	public int deletePtj(int boardNo) {
		return sqlSession.update("ptjMapper.deletePtj" , boardNo);
	}

}
