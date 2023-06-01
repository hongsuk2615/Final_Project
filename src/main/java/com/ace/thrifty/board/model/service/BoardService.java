package com.ace.thrifty.board.model.service;

import java.util.ArrayList;
import java.util.List;

import com.ace.thrifty.board.model.vo.Board;
import com.ace.thrifty.board.model.vo.UpperCategory;
import com.ace.thrifty.smallgroup.model.vo.SmallGroup;

public interface BoardService {

	public Board selectBoard();
	
	public List<UpperCategory> selectBoardCategoryList();
}
