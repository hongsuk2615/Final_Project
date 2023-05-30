package com.ace.thrifty.co_purchase.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ace.thrifty.board.model.vo.Board;

@Repository
public class Co_purchaseDao {
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	public int insertBoard(Board b) {
		return sqlSession.insert("co_purchaseMapper.insertBoard", b);
	}
}
