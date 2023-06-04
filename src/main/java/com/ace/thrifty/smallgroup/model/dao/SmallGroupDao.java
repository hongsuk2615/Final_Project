package com.ace.thrifty.smallgroup.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ace.thrifty.board.model.vo.Board;
import com.ace.thrifty.smallgroup.model.vo.SmallGroup;

@Repository
public class SmallGroupDao {

	
	@Autowired
	SqlSession sqlSession;
	
	public int sgInsertBoard2(SmallGroup sg) {
		return sqlSession.insert("smallgroupMapper.sgInsertBoard2", sg);
	
	}
	
	public ArrayList<SmallGroup> sgSelectList(){
		return (ArrayList)sqlSession.selectList("smallgroupMapper.sgSelectList");
	}
	
	public SmallGroup selectsgDetail(int boardNo) {
		return sqlSession.selectOne("smallgroupMapper.selectsgDetail", boardNo);
	}
	
	public int sgUpdateBoard2(SmallGroup sg){
		return sqlSession.update("smallgroupMapper.sgUpdateBoard2", sg);
	}
	
	public int sgDeleteBoard(Board b) {
		return sqlSession.update("smallgroupMapper.sgDeleteBoard", b);
	}
	
}
// controller에서 일단 제목이랑, 내용, boardNo