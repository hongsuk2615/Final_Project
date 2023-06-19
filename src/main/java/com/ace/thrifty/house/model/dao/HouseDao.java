package com.ace.thrifty.house.model.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ace.thrifty.board.model.vo.Board;
import com.ace.thrifty.common.model.vo.Coordinate;
import com.ace.thrifty.house.model.vo.House;
import com.ace.thrifty.house.model.vo.Room;
import com.ace.thrifty.house.model.vo.RoomImg;
import com.ace.thrifty.house.model.vo.Tour;

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
	
	public House selectHouse(int boardNo) {
		return sqlSession.selectOne("houseMapper.selectHouse", boardNo);
	}

	public Map<String, Object> selectBoard(Board b) { 
		return sqlSession.selectMap("houseMapper.selectBoard" , b, null);
	}
	
	public List<Object> selectHouseList(int userNo) {
		return sqlSession.selectList("houseMapper.selectHouseList", userNo);
	}
	
	public List<Object> selectLocation(Coordinate c, int userNo) {
			Map<String, Object> map = new HashMap();
			map.put("C", c);
			map.put("userNo", userNo);
		return sqlSession.selectList("houseMapper.searchHouse", map);
	}
	
	public List<Object> selectRoomImg(int roomNo) {
		return sqlSession.selectList("houseMapper.selectImgList", roomNo);
	}
	
	public List<Object> searchHouse(String keyword, int userNo) {
		Map<String, Object> map = new HashMap();
		map.put("keyword", keyword);
		map.put("userNo", userNo);
	return sqlSession.selectList("houseMapper.searchHouse", map);
	}
	
	public int tourApply(Tour tour) {
		return sqlSession.insert("houseMapper.tourApply", tour);
	}
	
	public int changeRecruitment(Room r) {
		return sqlSession.update("houseMapper.changeRecruitment", r);
	}
	
	public int updateHouse(House h) { 
		return sqlSession.update("houseMapper.updateHouse" , h);
	}

	public int deleteImage(String deleteImgList) { 
		return sqlSession.update("houseMapper.deleteImage" , deleteImgList);
	}

	public int deleteRoom(String deleteRoomList) { 
		return sqlSession.update("houseMapper.deleteRoom" , deleteRoomList);
	}
	
	public int updateRoom(Room r) { 
		return sqlSession.update("houseMapper.updateRoom" , r);
	}

	public int ImageLevel(int roomNo) { 
		return sqlSession.selectOne("houseMapper.ImageLevel" , roomNo);
	}

	public String setThumbnail(int boardNo) { 
		return sqlSession.selectOne("houseMapper.setThumbnail" , boardNo);
	}
	
	public List<Tour> checkApply(int bNo) {
	return sqlSession.selectList("houseMapper.checkApply", bNo);
	}
	
	public int checkStatus(Map map) {
	return sqlSession.update("houseMapper.checkStatus", map);
	}
	
	public Tour selectApply(int rNo, int uNo) {
		Map<String, Object> map = new HashMap();
		map.put("rNo", rNo);
		map.put("uNo", uNo);
		return sqlSession.selectOne("houseMapper.selectApply", map);
		}
	
	public House houseAd(){
		return sqlSession.selectOne("houseMapper.houseAd");
		}
	
}
