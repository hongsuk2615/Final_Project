package com.ace.thrifty.board.model.service;

import java.util.List;

import com.ace.thrifty.board.model.vo.Board;
import com.ace.thrifty.board.model.vo.UpperCategory;

public interface BoardService {

	public Board selectBoard();
	
	public List<UpperCategory> selectBoardCategoryList();
}
