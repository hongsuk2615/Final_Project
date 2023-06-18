package com.ace.thrifty.freeboard.model.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ace.thrifty.board.model.vo.Board;

@Repository
public class FreeBoardDao {

	private SqlSession sqlSession;
	
	@Autowired
	public FreeBoardDao(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}
	
	
	public int insertFreeBoard(Board b) {
		return sqlSession.insert("boardMapper.insertBoard", b);
	}


	public Board freeBoardDetail(int bNo) {
		return sqlSession.selectOne("boardMapper.selectBoard", bNo);
	}


	public int updateFreeBoard(Board b) {
		return sqlSession.update("freeBoardMapper.updateFreeBoard", b);
	}

}
