package com.ace.thrifty.board.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ace.thrifty.board.model.dao.BoardDao;
import com.ace.thrifty.board.model.vo.Board;
import com.ace.thrifty.board.model.vo.Location;
import com.ace.thrifty.board.model.vo.SubCategory;
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
	public List<UpperCategory> selectUpperCategoryList() {
		return boardDao.selectUpperCategoryList();
	}

	@Override
	public List<SubCategory> selectSubCategoryList() {
		return boardDao.selectSubCategoryList();
	}

	@Override
	public List<Location> selectLocationList() {
		return boardDao.selectLocationList();
	}
	
//	@Override
//	public int insertBoard(Board b, SmallGroup sg) {
//		int result = boardDao.insertBoard(b, sg);
//		return result;
//
//	}
	
}
