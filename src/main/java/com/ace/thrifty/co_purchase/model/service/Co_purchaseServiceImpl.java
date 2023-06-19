package com.ace.thrifty.co_purchase.model.service;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.ace.thrifty.board.model.dao.BoardDao;
import com.ace.thrifty.board.model.vo.Board;
import com.ace.thrifty.board.model.vo.Image;
import com.ace.thrifty.co_purchase.model.dao.Co_purchaseDao;
import com.ace.thrifty.co_purchase.model.vo.Co_purchase;
import com.ace.thrifty.common.Utils;
import com.ace.thrifty.common.model.vo.PageInfo;
import com.ace.thrifty.common.template.Pagination;

@Service
public class Co_purchaseServiceImpl implements Co_purchaseService{

	@Autowired
	BoardDao boardDao;
	
	@Autowired
	Co_purchaseDao coDao;
	
	@Autowired
	private Pagination pagination;

	@Override
	public int insertBoard(Board b, Co_purchase co, List<MultipartFile> imgList, String webPath, String serverFolderPath) throws Exception {
		boardDao.insertBoard(b);
		int boardNo = b.getBoardNo();
		int result = 0;
		if(boardNo > 0) {
			co.setBoardNo(boardNo);
			result = coDao.insertCo_purchase(co);
		}
		
		if (result > 0 && imgList != null) {
			List<Image> imageList = new ArrayList();
			for (int i = 0; i < imgList.size(); i++) {
				if (imgList.get(i).getSize() > 0) {
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
	public void selectCoPurchaseList(Map<String, Object> map) {
		
		int currentPage = Integer.parseInt((String)map.get("currPage"));
		int listCount = coDao.selectBoardListCount(map);
		int pageLimit = 10;
		int boardLimit = 5;
		
		PageInfo pi = pagination.getPageInfo(listCount, currentPage, pageLimit, boardLimit);
		
		ArrayList<Board> list = coDao.selectCoPurchaseList(pi, map);
		map.put("pi", pi);
		map.put("list", list);
		
	}
	
	@Override
	public Co_purchase selectCoPurchase(int bNo) {
		Co_purchase co = coDao.selectBoardDetail(bNo);
		if(co != null) {
			boardDao.increaseReadCount(bNo);
			co.getBoard().setReadCount(co.getBoard().getReadCount()+1);
		}
		return co;
	}
	
	@Override
	public int updateBoard(Board b, Co_purchase co, MultipartFile imgList, String webPath,
			String serverFolderPath) throws Exception{
		int result = 0;
		result = boardDao.updateCoBoard(b);
		if (result > 0) {
			co.setBoardNo(b.getBoardNo());
			result = coDao.updateCo_purchase(co);
		}
		
		if (result > 0 && !imgList.isEmpty()) {
			String changeName = Utils.saveFile(imgList, serverFolderPath);
			
			Image img = new Image();
			img.setBoardNo(b.getBoardNo());
			img.setFileLevel(1);
			img.setOriginName(imgList.getOriginalFilename());
			img.setChangeName(changeName);
					
					
			result = boardDao.updateCoImageList(img);
			if (result < 0) {
				throw new Exception("이미지 등록 예외발생");
			}
		}
			
		return result;

	}
	
	
	public void selectSearchCoPurchaseList(Map<String, Object> map) {
		
		int currentPage = Integer.parseInt((String)map.get("currPage"));
		int listCount = coDao.selectBoardListCount(map);
		int pageLimit = 10;
		int boardLimit = 5;
		
		PageInfo pi = pagination.getPageInfo(listCount, currentPage, pageLimit, boardLimit);
		
		ArrayList<Board> list = coDao.selectSearchCoPurchaseList(pi, map);
		map.put("pi", pi);
		map.put("list", list);
		
	}

}
