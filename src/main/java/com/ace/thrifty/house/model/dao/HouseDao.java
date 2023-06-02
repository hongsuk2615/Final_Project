package com.ace.thrifty.house.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Select;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ace.thrifty.board.model.vo.Board;
import com.ace.thrifty.house.model.vo.House;
import com.ace.thrifty.house.model.vo.Room;
import com.ace.thrifty.house.model.vo.RoomImg;

@Repository
public class HouseDao {
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	public int insertHouse(House h) { 
		return sqlSession.insert("houseMapper.insertHouse" , h);
	}
	
	public int insertRoom(Room r) { 
		return sqlSession.insert("houseMapper.insertRoom" , r);
	}
	
	public int insertRoomImg(List<RoomImg> roomImgList) { 
		return sqlSession.insert("houseMapper.insertRoomImg" , roomImgList);
	}
	
	public Map<String, Object> selectBoard(Board b) { 
		return sqlSession.selectMap("houseMapper.selectBoard" , b, null);
	}
	
	public List<Object> selectLocation() { 
		return sqlSession.selectList("houseMapper.selectLocation");
	}



	

}
