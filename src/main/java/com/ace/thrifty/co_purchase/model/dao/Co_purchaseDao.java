package com.ace.thrifty.co_purchase.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ace.thrifty.board.model.vo.Board;
import com.ace.thrifty.board.model.vo.Image;
import com.ace.thrifty.co_purchase.model.vo.Co_purchase;
import com.ace.thrifty.common.model.vo.PageInfo;

@Repository
public class Co_purchaseDao {
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	public int insertCo_purchase(Co_purchase co) {
		return sqlSession.insert("co_purchaseMapper.insertCo_purchase", co);
	}
	
	public int selectBoardListCount(String categoryPath) {
		return sqlSession.selectOne("co_purchaseMapper.selectBoardListCount", categoryPath);
	}
	
	public ArrayList<Board> selectBoardList(PageInfo pi, String categoryPath) {
		
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		int limit = pi.getBoardLimit();
		
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		return (ArrayList)sqlSession.selectList("boardMapper.selectBoardList", categoryPath, rowBounds);
	}

	public ArrayList<Image> selectImgList() {
		return (ArrayList)sqlSession.selectList("co_purchaseMapper.selectImgList");
	}
	
	public ArrayList<Co_purchase> selectCoList() {
		return (ArrayList)sqlSession.selectList("co_purchaseMapper.selectCoList");
	}
	
}
