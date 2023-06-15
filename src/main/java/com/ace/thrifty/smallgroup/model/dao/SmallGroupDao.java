package com.ace.thrifty.smallgroup.model.dao;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.web.multipart.MultipartFile;

import com.ace.thrifty.board.model.vo.Board;
import com.ace.thrifty.board.model.vo.Image;
import com.ace.thrifty.common.model.vo.PageInfo;
import com.ace.thrifty.smallgroup.model.vo.SmallGroup;
import com.ace.thrifty.usedProduct.model.vo.UsedProduct;

@Repository
public class SmallGroupDao {

	
	@Autowired
	SqlSession sqlSession;
	
	public int sgInsertBoard2(SmallGroup sg) {
		return sqlSession.insert("smallgroupMapper.sgInsertBoard2", sg);
	
	}
	
//	public ArrayList<SmallGroup> sgSelectList(){
//		return (ArrayList)sqlSession.selectList("smallgroupMapper.sgSelectList");
//	}
	
	public SmallGroup selectsgDetail(int bNo) {
		return sqlSession.selectOne("smallgroupMapper.selectsgDetail", bNo);
	}
	
	public int sgUpdateBoard2(SmallGroup sg){
		return sqlSession.update("smallgroupMapper.sgUpdateBoard2", sg);
	}
	
	public int sgDeleteBoard(Board b) {
		return sqlSession.update("smallgroupMapper.sgDeleteBoard", b);
	}
	
	public int selectsmallgroupCount(Map<String, Object> queryString) {
		return sqlSession.selectOne("smallgroupMapper.selectsmallgroupCount", queryString);
	}


	public List<SmallGroup> selectsmallgroup(PageInfo pi, Map<String, Object> queryString) {
		int offset = (pi.getCurrentPage() - 1 ) * pi.getBoardLimit();
		int limit = pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, limit);		
		return sqlSession.selectList("smallgroupMapper.selectsmallgroup", queryString, rowBounds);
	}
	
	
	public List<SmallGroup> selectSgAll(){
		return sqlSession.selectList("smallgroupMapper.selectSgAll");
	}
	
	
}
// controller에서 일단 제목이랑, 내용, boardNo