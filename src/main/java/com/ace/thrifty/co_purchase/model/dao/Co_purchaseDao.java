package com.ace.thrifty.co_purchase.model.dao;

import java.util.ArrayList;
import java.util.Map;

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
	
	public int selectBoardListCount() {
		return sqlSession.selectOne("co_purchaseMapper.selectBoardListCount");
	}
	
	public ArrayList<Board> selectCoPurchaseList(PageInfo pi, Map<String, Object> map) {
		
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		int limit = pi.getBoardLimit();
		
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		return (ArrayList)sqlSession.selectList("co_purchaseMapper.selectCoPurchaseList", map);
	}

	public Co_purchase selectBoardDetail(int bNo) {
		return sqlSession.selectOne("co_purchaseMapper.selectBoardDetail", bNo);
	}

	public int updateCo_purchase(Co_purchase co) {
		return sqlSession.update("co_purchaseMapper.updateCo_purchase", co);
	}

	
}
