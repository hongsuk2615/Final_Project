package com.ace.thrifty.freeboard.model.dao;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ace.thrifty.board.model.vo.Board;
import com.ace.thrifty.common.model.vo.PageInfo;

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


	public List<Board> selectList(PageInfo pi, Map<String, Object> paramMap) {
		
		int offset = (pi.getCurrentPage() -1) * pi.getBoardLimit();
		int limit = pi.getBoardLimit();
		
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		return sqlSession.selectList("freeBoardMapper.freeBoardList", paramMap, rowBounds);
	}


	public int selectfreeBoardListCount(Map<String, Object> paramMap) {
		return sqlSession.selectOne("freeBoardMapper.freeBoardListCount");
	}


	public int freeBoardreadCount(int bNo) {
		return sqlSession.insert("boardMapper.increaseReadCount", bNo);
	}

	
}
