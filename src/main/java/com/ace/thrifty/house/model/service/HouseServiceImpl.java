package com.ace.thrifty.house.model.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.ace.thrifty.board.model.dao.BoardDao;
import com.ace.thrifty.board.model.vo.Board;
import com.ace.thrifty.common.Utils;
import com.ace.thrifty.house.model.dao.HouseDao;
import com.ace.thrifty.house.model.vo.House;
import com.ace.thrifty.house.model.vo.Room;
import com.ace.thrifty.house.model.vo.RoomImg;

@Service
public class HouseServiceImpl implements HouseService{
	
	private final HouseDao houseDao;
	private final BoardDao boardDao;

	public HouseServiceImpl(HouseDao houseDao, BoardDao boardDao) {
		this.houseDao = houseDao;
		this.boardDao = boardDao;
	}

	@Override
	public int insertHouse(Board b, House h, List<Room> rooms, Map<String, List<MultipartFile>> roomImgs, String webPath, String serverFolderPath) throws Exception {
		
		System.out.println("b" + b);
		boardDao.insertBoard(b);
		int boardNo =b.getBoardNo();
		h.setBoardNo(boardNo);
		
		System.out.println("서비스");
		List<List<MultipartFile>> roomImgsV = new ArrayList();
		List<RoomImg> roomImgList = new ArrayList();
		Iterator<String> keys = roomImgs.keySet().iterator();
		System.out.println(keys);
		while (keys.hasNext()) {
			String key = keys.next();
			roomImgsV.add(roomImgs.get(key));
			System.out.println("roomImgsV: "+ roomImgsV);
		}
		for (int i = 0; i < rooms.size(); i++) {
			rooms.get(i).setBoardNo(boardNo);
			houseDao.insertRoom(rooms.get(i));
			int roomNo = rooms.get(i).getRoomNo();
			for(int j = 0; j < roomImgsV.get(i).size(); j++) {
				MultipartFile file = roomImgsV.get(i).get(j);
				String changeName = Utils.saveFile(file, serverFolderPath);
				RoomImg roomImg = RoomImg
						.builder()
						.roomNo(roomNo)
						.originName(file.getOriginalFilename())
						.changeName(changeName)
						.imgLevel(j)
						.build();
				roomImgList.add(roomImg);
				System.out.println(roomImgList);
			}
		}
		String thumbnail = webPath + roomImgList.get(0).getChangeName();
		h.setThumbnail(thumbnail);
		int result = houseDao.insertHouse(h);
		int result1 = houseDao.insertRoomImg(roomImgList);

		return boardNo;
	}

	@Override
	public Map<String, Object> selectBoard(Board b) {
		return houseDao.selectBoard(b);
	}

	@Override
	public List<Object> selectLocation() {
		return houseDao.selectLocation();
	}
	
	
	
}
