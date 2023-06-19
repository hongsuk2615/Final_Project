package com.ace.thrifty.carpool.model.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import com.ace.thrifty.board.model.dao.BoardDao;
import com.ace.thrifty.board.model.vo.Board;
import com.ace.thrifty.board.model.vo.Image;
import com.ace.thrifty.carpool.model.dao.CarPoolDao;
import com.ace.thrifty.carpool.model.vo.CarPool;
import com.ace.thrifty.common.Utils;
import com.ace.thrifty.common.model.vo.PageInfo;
import com.ace.thrifty.common.template.Pagination;
import com.ace.thrifty.ptj.model.vo.Ptj;

@Service
public class CarPoolServiceImpl implements CarPoolService {
	
	@Autowired
	CarPoolDao carPoolDao;
	
	@Autowired
	BoardDao boardDao;
	
	@Autowired
	private Pagination pagination;
	
	@Override
	public void selectDriveList(Map<String, Object> queryString) {
		int listCount = carPoolDao.selectDriveListCount(queryString);
		int pageLimit = 10;
		int boardLimit = 9;
		PageInfo pi = pagination.getPageInfo(listCount, Integer.parseInt((String)(queryString.get("currPage"))), pageLimit, boardLimit);
		List<CarPool> list = carPoolDao.selectDriveList(pi, queryString);
		queryString.put("pi", pi);
		queryString.put("list", list);
	}
	
	@Override
	public CarPool driveDetail(int bNo) {
		CarPool detail = carPoolDao.driveDetail(bNo);
		if(detail != null) {
			boardDao.increaseReadCount(bNo);
			detail.getBoard().setReadCount(detail.getBoard().getReadCount()+1);
		}
		return detail;
	}
	
	@Transactional(rollbackFor = { Exception.class })
	@Override
	public int insertCarPool(CarPool c, Board b, List<MultipartFile>imgList, String webPath, 
			String serverFolderPath) throws Exception {
		boardDao.insertBoard(b);
		int boardNo = b.getBoardNo();
		int result = 0;
		if(boardNo > 0) {
			c.setBoardNo(boardNo);
			result = carPoolDao.insertCarPool(c);
		}
		if(result > 0 && imgList != null) {
			List<Image> imageList = new ArrayList();
			for(int i = 0; i < imgList.size(); i++) {
				if(imgList.get(i).getSize() >0) {
					String changeName = Utils.saveFile(imgList.get(i), serverFolderPath);
					Image img = new Image();
					img.setBoardNo(boardNo);
					img.setFileLevel(i);
					img.setOriginName(imgList.get(i).getOriginalFilename());
					img.setChangeName(changeName);
					imageList.add(img);
				}
			}
			if (!imageList.isEmpty()) {
				result = boardDao.insertImageList(imageList);
				if (!(result == imageList.size())) {
					throw new Exception("이미지 등록 예외발생");
				}
			}
		}
		return boardNo;
	}
	
	@Override
	public int deadLine(Board b) {
		return carPoolDao.deadLine(b);
	}
	
	@Override
	public CarPool carPoolUpdateForm(int bNo) {
		return carPoolDao.carPoolUpdateForm(bNo);
	}
	
	@Override
	public int carPoolBoardUpdate(Board b, CarPool cP , List<MultipartFile> imgList, String webPath,
							      String serverFolderPath, String removeImgList) throws Exception {
		int result = 0;
		result = boardDao.updateBoard(b);
		if(result > 0) {
			cP.setBoardNo(b.getBoardNo());
			result = carPoolDao.carPoolBoardUpdate(cP);
		}
		if(result > 0 && removeImgList.length() > 0 ) {
			result = boardDao.deleteImage(removeImgList);
		}
		if(result > 0 && imgList != null) {
			List<Image> imageList = new ArrayList();
			for(int i = 0; i < imgList.size(); i++) {
				if(imgList.get(i).getSize() > 0) {
					String changeName = Utils.saveFile(imgList.get(i), serverFolderPath);
					Image img = new Image();
					img.setBoardNo(b.getBoardNo());
					img.setFileLevel(i);
					img.setOriginName(imgList.get(i).getOriginalFilename());
					img.setChangeName(changeName);
					imageList.add(img);
				}
			}
			if(!imageList.isEmpty()) {
				result = boardDao.insertImageList(imageList);
				if(!(result == imageList.size())) {
					throw new Exception("이미지 등록 예외발생");
				}
			}
		}
		return result;
	}
}
