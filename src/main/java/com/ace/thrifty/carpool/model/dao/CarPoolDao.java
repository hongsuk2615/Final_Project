package com.ace.thrifty.carpool.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ace.thrifty.board.model.vo.Board;
import com.ace.thrifty.carpool.model.vo.CarPool;
import com.ace.thrifty.common.model.vo.PageInfo;

@Repository
public class CarPoolDao {
	
	@Autowired
	SqlSession sqlSession;
	
	public List<CarPool> driveList() {
		return sqlSession.selectList("carPoolMapper.driveList");
	}
	
	public CarPool driveDetail(int bNo) {
		return sqlSession.selectOne("carPoolMapper.driveDetail" , bNo);
	}
	
	public int selectDriveListCount(Map<String, Object> queryString) {
		return sqlSession.selectOne("carPoolMapper.selectDriveListCount" , queryString);
	}
	
	public List<CarPool> selectDriveList(PageInfo pi, Map<String, Object> queryString) {
		int offset = (pi.getCurrentPage() - 1 ) * pi.getBoardLimit();
		int limit = pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, limit);		
		return sqlSession.selectList("carPoolMapper.selectDriveList", queryString, rowBounds);
	}
	
	public int insertCarPool(CarPool c) {
		return sqlSession.insert("carPoolMapper.insertCarPool" , c);
	}
	
	public int deadLine(Board b) {
		return sqlSession.update("carPoolMapper.deadLine" , b);
	}
	
	public CarPool carPoolUpdateForm(int bNo) {
		return sqlSession.selectOne("carPoolMapper.carPoolUpdateForm" ,bNo);
	}
	
	public int carPoolBoardUpdate(CarPool cP) {
		return sqlSession.update("carPoolMapper.carPoolBoardUpdate", cP);
	}
}
