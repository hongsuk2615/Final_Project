package com.ace.thrifty.co_purchase.model.service;

import java.util.Map;

import com.ace.thrifty.board.model.vo.Board;
import com.ace.thrifty.board.model.vo.Image;
import com.ace.thrifty.co_purchase.model.vo.Co_purchase;

public interface Co_purchaseService {
	
	public int insertBoard(Board b, Co_purchase co, Image i, String webPath, String serverFolderPath);

	public void selectBoardList(int currentPage, String categoryPath, Map<String, Object> map);

}
