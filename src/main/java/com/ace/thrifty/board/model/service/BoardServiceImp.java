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
	
	@Override
	public int insertBoard(Board b, SmallGroup sg) {
		int result1 = 0;
		int result2 = 0;
		
		result1 = boardDao.insertBoard(b); 
		
		System.out.println(b.getBoardNo());
		if(result1 > 0) {
			sg.setBoardNo(b.getBoardNo());
			
			result2 = boardDao.insertSmallGroup(sg);
		}

		return result1*result2;
	
	}
	
	
	
}
