package com.ace.thrifty.carpool.model.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ace.thrifty.carpool.model.vo.CarPool;

@Repository
public class CarPoolDao {
	
	@Autowired
	SqlSession sqlSession;
	
	public List<CarPool> driveList() {
		return sqlSession.selectList("carPoolMapper.driveList");
	}
	
	public CarPool driveDetail(int boardNo) {
		return sqlSession.selectOne("carPoolMapper.driveDetail" , boardNo);
	}
	
	
	
}
