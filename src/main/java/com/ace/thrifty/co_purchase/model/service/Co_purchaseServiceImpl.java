package com.ace.thrifty.co_purchase.model.service;

import java.util.ArrayList;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ace.thrifty.board.model.dao.BoardDao;
import com.ace.thrifty.board.model.vo.Board;
import com.ace.thrifty.board.model.vo.Image;
import com.ace.thrifty.co_purchase.model.dao.Co_purchaseDao;
import com.ace.thrifty.co_purchase.model.vo.Co_purchase;
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
	public int insertBoard(Board b, Co_purchase co, Image i, String webPath, String serverFolderPath) {
		boardDao.insertBoard(b);
		int boardNo = b.getBoardNo();
		int result = 0;
		if(boardNo > 0) {
			co.setBoardNo(boardNo);
			result = coDao.insertCo_purchase(co);
		}
		
		if(result > 0 && i != null) {
			Image image = new Image();
			image.setBoardNo(boardNo);
			
		}
		
		return boardNo;
	}
	
	@Override
	public void selectBoardList(int currentPage, String categoryPath, Map<String, Object> map) {
		
		int listCount = coDao.selectBoardListCount(categoryPath);
		int pageLimit = 10;
		int boardLimit = 5;
		PageInfo pi = pagination.getPageInfo(listCount, currentPage, pageLimit, boardLimit);
		
		ArrayList<Board> list = coDao.selectBoardList(pi, categoryPath);
		
		map.put("pi", pi);
		map.put("list", list);
	}
}
