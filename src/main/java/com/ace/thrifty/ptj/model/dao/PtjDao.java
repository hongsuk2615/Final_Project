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

}
