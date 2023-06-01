package com.ace.thrifty.board.model.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ace.thrifty.board.model.vo.Board;
import com.ace.thrifty.board.model.vo.Location;
import com.ace.thrifty.board.model.vo.SubCategory;
import com.ace.thrifty.board.model.vo.UpperCategory;

@Repository
public class BoardDao {

	@Autowired
	SqlSession sqlSession;
	
	public Board selectBoard() {
		return sqlSession.selectOne("boardMapper.selectBoard");
	}
	
	
//	public int insertBoard(Board b, SmallGroup sg) {
//		return sqlSession.insert("boardMapper.insertBoard", b, sg);
//	}

	public List<UpperCategory >selectBoardCategoryList() {
		return sqlSession.selectList("boardMapper.selectCategoryList");		
	}
	public List<UpperCategory >selectUpperCategoryList() {
		return sqlSession.selectList("boardMapper.selectUpperCategoryList");
	}
	
	public List<SubCategory>selectSubCategoryList() {
		return sqlSession.selectList("boardMapper.selectSubCategoryList");
	}
	
	public List<Location> selectLocationList(){
		return sqlSession.selectList("boardMapper.selectLocationList");
	}
}
