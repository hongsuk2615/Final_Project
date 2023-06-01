package com.ace.thrifty.house.model.service;

import java.util.List;
import java.util.Map;

import org.springframework.web.multipart.MultipartFile;

import com.ace.thrifty.board.model.vo.Board;
import com.ace.thrifty.house.model.vo.House;
import com.ace.thrifty.house.model.vo.Room;
import com.ace.thrifty.house.model.vo.RoomImg;
import com.ace.thrifty.member.model.vo.Member;

public interface HouseService {
	
	int insertHouse(Board b, House h, List<Room> rooms, Map<String,List<MultipartFile>> roomImgs, String webPath, String serverFolderPath) throws Exception;

	Map<String, Object> selectBoard(Board b);

	List<Object> selectLocation();

}
