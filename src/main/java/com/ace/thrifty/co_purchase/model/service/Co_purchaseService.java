package com.ace.thrifty.co_purchase.model.service;

import java.util.Map;

import com.ace.thrifty.board.model.vo.Board;

public interface Co_purchaseService {
	
	public int insertBoard(Board b);

	public void selectBoardList(int currentPage, String categoryPath, Map<String, Object> map);

}
