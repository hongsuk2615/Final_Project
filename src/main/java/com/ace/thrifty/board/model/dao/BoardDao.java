package com.ace.thrifty.board.model.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ace.thrifty.board.model.vo.Board;
import com.ace.thrifty.board.model.vo.UpperCategory;

@Repository
public class BoardDao {

	@Autowired
	SqlSession sqlSession;
	
	public Board selectBoard() {
		return sqlSession.selectOne("boardMapper.selectBoard");
	}
	
	
	public int insertBoard(Board b) {
		return sqlSession.insert("boardMapper.insertBoard", b);
	}

	public List<UpperCategory >selectBoardCategoryList() {
		return sqlSession.selectList("boardMapper.selectCategoryList");
	}
}
