package com.ace.thrifty.co_purchase.model.service;

import java.util.List;
import java.util.Map;

import org.springframework.web.multipart.MultipartFile;

import com.ace.thrifty.board.model.vo.Board;
import com.ace.thrifty.board.model.vo.Image;
import com.ace.thrifty.co_purchase.model.vo.Co_purchase;

public interface Co_purchaseService {
	
	public int insertBoard(Board b, Co_purchase co, List<MultipartFile> imgList, String webPath, String serverFolderPath) throws Exception;

	public void selectBoardList(int currentPage, String categoryPath, Map<String, Object> map);

}
