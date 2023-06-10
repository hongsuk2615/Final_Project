package com.ace.thrifty.ptj.model.dao;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ace.thrifty.admin.model.vo.Notice;
import com.ace.thrifty.board.model.vo.Board;
import com.ace.thrifty.common.model.vo.PageInfo;
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
	
	public Ptj updateFormPtj(int boardNo) {
		return sqlSession.selectOne("ptjMapper.updateFormPtj" , boardNo);
	}
	
	public int updatePtj(Ptj p) {
		return sqlSession.update("ptjMapper.updatePtj" , p);
	}
	
	public int workEnd(Ptj p) {
		return sqlSession.update("ptjMapper.workEnd" , p);
	}
	
	public int deleteImage(Board b) {
		return sqlSession.update("ptjMapper.deleteImage", b);
	}
	
	/*
	 * public int selectPtjBoardListCount(Map<String, Object> paramMap) { return
	 * sqlSession.selectOne("ptjMapper.selectPtjBoardListCount", paramMap); }
	 */
	
	/*
	 * public List<Ptj> selectPtjAll(PageInfo pi, Map<String, Object> paramMap) {
	 * 
	 * int offset = (pi.getCurrentPage() -1) * pi.getBoardLimit(); int limit =
	 * pi.getBoardLimit();
	 * 
	 * RowBounds rowBounds = new RowBounds(offset, limit);
	 * 
	 * return sqlSession.selectList("pjtMapper.selectPtjAll", paramMap, rowBounds);
	 * }
	 */

}
