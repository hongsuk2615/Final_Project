package com.ace.thrifty.board.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ace.thrifty.board.model.dao.BoardDao;
import com.ace.thrifty.board.model.vo.Board;
import com.ace.thrifty.board.model.vo.UpperCategory;
import com.ace.thrifty.smallgroup.model.vo.SmallGroup;

@Service
public class BoardServiceImp implements BoardService{
	
	@Autowired
	BoardDao boardDao;

	@Override
	public Board selectBoard() {
		Board b = boardDao.selectBoard();
		return b;
	}

	@Override
	public List<UpperCategory> selectBoardCategoryList() {
		
		return boardDao.selectBoardCategoryList();
	}
	
	
	
	// 이로직은 지켜야함 
	// sg.로 만 b안쓰고 할수있음
	// Dao. Mapper. Dao. mapper.
	
	
	
	
	
}
