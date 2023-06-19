package com.ace.thrifty.house.model.service;

import java.util.List;
import java.util.Map;

import org.springframework.web.multipart.MultipartFile;

import com.ace.thrifty.board.model.vo.Board;
import com.ace.thrifty.common.model.vo.Coordinate;
import com.ace.thrifty.house.model.vo.House;
import com.ace.thrifty.house.model.vo.Room;
import com.ace.thrifty.house.model.vo.Tour;

public interface HouseService {
	
	int insertHouse(Board b, House h, List<Room> rooms, Map<String,List<MultipartFile>> roomImgs, String webPath, String serverFolderPath) throws Exception;

	List<Object> selectHouse(int boardNo);
	
	Map<String, Object> selectBoard(Board b);

	List<Object> selectHouseList(int userNo);

	List<Object> selectLocation(Coordinate c, int userNo);
	
	List<Object> selectRoomImg(int roomNo);
	
	int scrapHouse(int userNo, int boardNo);

	int scrapCancel(int userNo, int boardNo);
	
	List<Object> searchHouse(String keyword, int userNo);
	
	int tourApply(Tour tour);
	
	int changeRecruitment(Room r);
	
	int updateHouse(Board b, House h, List<Room> rooms, Map<String,List<MultipartFile>> roomImgs, String webPath, String serverFolderPath
			, String deleteImgList, String deleteRoomList) throws Exception;
	
	List<Object> checkApply(int bNo);
	
	int checkStatus(Map map);
	
	List<Object> selectApply(int rNo, int uNo);
	
	House houseAd();
	
}
