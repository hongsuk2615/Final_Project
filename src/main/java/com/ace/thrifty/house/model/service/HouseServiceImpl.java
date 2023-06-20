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
import com.ace.thrifty.common.model.vo.Coordinate;
import com.ace.thrifty.house.model.dao.HouseDao;
import com.ace.thrifty.house.model.vo.House;
import com.ace.thrifty.house.model.vo.Room;
import com.ace.thrifty.house.model.vo.RoomImg;
import com.ace.thrifty.house.model.vo.Tour;
import com.ace.thrifty.member.model.dao.MemberDao;
import com.ace.thrifty.member.model.vo.Member;
import com.ace.thrifty.wishList.model.dao.WishListDao;
import com.ace.thrifty.wishList.model.vo.WishList;

@Service
public class HouseServiceImpl implements HouseService{
	
	private final HouseDao houseDao;
	private final BoardDao boardDao;
	private final WishListDao wishListDao;
	private final MemberDao memberDao;

	public HouseServiceImpl(HouseDao houseDao, BoardDao boardDao, WishListDao wishListDao,  MemberDao memberDao) {
		this.houseDao = houseDao;
		this.boardDao = boardDao;
		this.wishListDao = wishListDao;
		this.memberDao = memberDao;
	}

	@Override
	public int insertHouse(Board b, House h, List<Room> rooms, Map<String, List<MultipartFile>> roomImgs, String webPath, String serverFolderPath) throws Exception {
		boardDao.insertBoard(b);
		int boardNo =b.getBoardNo();
		h.setBoardNo(boardNo);
		
		List<List<MultipartFile>> roomImgsV = new ArrayList();
		List<RoomImg> roomImgList = new ArrayList();
		Iterator<String> keys = roomImgs.keySet().iterator();
		while (keys.hasNext()) {
			String key = keys.next();
			roomImgsV.add(roomImgs.get(key));
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
			}
		}
		String thumbnail = webPath + roomImgList.get(0).getChangeName();
		h.setThumbnail(thumbnail);
		int result = houseDao.insertHouse(h);
		int result1 = houseDao.insertRoomImg(roomImgList);

		return result1;
	}
	
	@Override
	public List<Object> selectHouse(int boardNo) {
		List<Object> list = new ArrayList();
		list.add(boardDao.selectBoard(boardNo));
		list.add(houseDao.selectHouse(boardNo));
		return list;
	}

	@Override
	public Map<String, Object> selectBoard(Board b) {
		return houseDao.selectBoard(b);
	}

	@Override
	public List<Object> selectHouseList(int userNo) {
		return houseDao.selectHouseList(userNo);
	}
	
	@Override
	public List<Object> selectLocation(Coordinate c, int userNo) {
		return houseDao.selectLocation(c, userNo);
	}

	@Override
	public List<Object> selectRoomImg(int roomNo) {
		return houseDao.selectRoomImg(roomNo);
	}

	@Override
	public int scrapHouse(int userNo, int boardNo) {
		
		WishList wL = new WishList();	
		wL.setBoardNo(boardNo);
		wL.setUserNo(userNo);
		
		wishListDao.insertWishList(wL);
		boardDao.scrapBoard(boardNo);
		
		return 0;
	}
	@Override
	public int scrapCancel(int userNo, int boardNo) {
		
		WishList wL = new WishList();	
		wL.setBoardNo(boardNo);
		wL.setUserNo(userNo);
		
		wishListDao.deleteWishList(wL);
		boardDao.scrapCancel(boardNo);
		
		return 0;
	}

	@Override
	public List<Object> searchHouse(String keyword, int userNo) {
		return houseDao.searchHouse(keyword, userNo);
	}

	@Override
	public int tourApply(Tour tour) {
		return houseDao.tourApply(tour);
	}

	@Override
	public int changeRecruitment(Room r) {
		return houseDao.changeRecruitment(r);
	}

	@Override
	public int updateHouse(Board b, House h, List<Room> rooms, Map<String, List<MultipartFile>> roomImgs,
			String webPath, String serverFolderPath, String deleteImgList, String deleteRoomList) throws Exception {
			boardDao.updateBoard(b);
			if(deleteImgList.length() > 2 ) {
			houseDao.deleteImage(deleteImgList);
			}
			if(deleteRoomList.length() > 2 ) {
			houseDao.deleteRoom(deleteRoomList);
			}
			List<List<MultipartFile>> roomImgsV = new ArrayList();
			List<RoomImg> roomImgList = new ArrayList();
			Iterator<String> keys = roomImgs.keySet().iterator();
			while (keys.hasNext()) {
				String key = keys.next();
				roomImgsV.add(roomImgs.get(key));
			}
			for (int i = 0; i < rooms.size(); i++) {
				if(rooms.get(i).getRoomNo() == 0) {
					houseDao.insertRoom(rooms.get(i));
					int roomNo = rooms.get(i).getRoomNo();
					for(int j = 0; j < roomImgsV.get(i).size(); j++) {
						MultipartFile file = roomImgsV.get(i).get(j);
						if(roomImgsV.get(i).get(j).getSize() != 0) {
						String changeName = Utils.saveFile(file, serverFolderPath);
						RoomImg roomImg = RoomImg
								.builder()
								.roomNo(roomNo)
								.originName(file.getOriginalFilename())
								.changeName(changeName)
								.imgLevel(j)
								.build();
						roomImgList.add(roomImg);
						}
					}
				}else {
					houseDao.updateRoom(rooms.get(i));
					int level = houseDao.ImageLevel(rooms.get(i).getRoomNo());
					for(int k = 0; k < roomImgsV.get(i).size(); k++) {
						MultipartFile file = roomImgsV.get(i).get(k);
						if(roomImgsV.get(i).get(k).getSize() != 0) {
						String changeName = Utils.saveFile(file, serverFolderPath);
						RoomImg roomImg = RoomImg
								.builder()
								.roomNo(rooms.get(i).getRoomNo())
								.originName(file.getOriginalFilename())
								.changeName(changeName)
								.imgLevel(k+level)
								.build();
						roomImgList.add(roomImg);
				}}
				}
				
			}
			if(!roomImgList.isEmpty()) {
			houseDao.insertRoomImg(roomImgList);
			}
			String thumbnail = webPath + houseDao.setThumbnail(b.getBoardNo());
				h.setThumbnail(thumbnail);
			int result = houseDao.updateHouse(h);
	
			return result;
		}

	@Override
	public List<Object> checkApply(int bNo) {
		List<Object> list = new ArrayList();
		List<Tour> list2 = houseDao.checkApply(bNo);
		List<Member> list3 = new ArrayList();
		list.add(list2);
		for(int i = 0; i < list2.size(); i++) {
			int userNo = list2.get(i).getUserNo();
			list3.add(memberDao.selectUser(userNo));
		}
		list.add(list3);
		
		return list;
	}
	
	@Override
	public int checkStatus(Map map) {
		return houseDao.checkStatus(map);
	}

	@Override
	public List<Object> selectApply(int rNo, int uNo) {
		List<Object> list = new ArrayList();
		list.add(houseDao.selectApply(rNo, uNo));
		list.add(memberDao.selectUser(uNo));
		return list;
	}

	@Override
	public House houseAd() {
		return houseDao.houseAd();
	}

}
