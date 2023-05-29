package com.ace.thrifty.board.model.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ace.thrifty.board.model.vo.Board;

@Repository
public class BoardDao {

	@Autowired
	SqlSession sqlSession;
	
	public Board selectBoard() {
		return sqlSession.selectOne("boardMapper.selectBoard");
	}
}
