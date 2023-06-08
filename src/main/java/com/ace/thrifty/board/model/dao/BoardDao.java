package com.ace.thrifty.board.model.dao;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ace.thrifty.board.model.vo.Board;
import com.ace.thrifty.board.model.vo.Image;
import com.ace.thrifty.board.model.vo.Location;
import com.ace.thrifty.board.model.vo.SubCategory;
import com.ace.thrifty.board.model.vo.UpperCategory;
import com.ace.thrifty.smallgroup.model.vo.SmallGroup;

@Repository
public class BoardDao {

	@Autowired
	SqlSession sqlSession;
	
	public Board selectBoard(int boardNo) {
		return sqlSession.selectOne("boardMapper.selectBoard", boardNo);
	}	
	
	public int sgInsertBoard(Board b) {
		return sqlSession.insert("boardMapper.sgInsertBoard", b);
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
	

	public int sgUpdateBoard(Board b) {
		return sqlSession.update("boardMapper.sgUpdateBoard", b);
	}	
	public int insertBoard(Board b) {
		return sqlSession.insert("boardMapper.insertBoard",b);
	}
	
	public int insertImageList(List<Image> imageList) {
		return sqlSession.insert("boardMapper.insertImageList", imageList);
	}
	
	public ArrayList<Board> selectBoardByUserNo(int userNo){
		return (ArrayList)sqlSession.selectList("boardMapper.selectBoardByUserNo", userNo);}
	public int increaseReadCount(int bNo) {
		return sqlSession.update("boardMapper.increaseReadCount", bNo);
	}
	
	public int deleteBoard(Board b) {
		return sqlSession.update("boardMapper.deleteBoard", b);
	}
}
