package com.ace.thrifty.smallgroup.model.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.ace.thrifty.board.model.dao.BoardDao;
import com.ace.thrifty.board.model.vo.Board;
import com.ace.thrifty.smallgroup.model.dao.SmallGroupDao;
import com.ace.thrifty.smallgroup.model.vo.SmallGroup;

@Service
public class SmallGroupServiceImp implements SmallGroupService{

	@Autowired
	SmallGroupDao smallGroupDao;
	@Autowired
	BoardDao boardDao;
	
	
	
	@Override
	public int sgInsertBoard(Board b, SmallGroup sg) {
		int result1 = 0;
		int result2 = 0;
		
		result1 = boardDao.sgInsertBoard(b);
		System.out.println(result1);
		
		if(result1>0) {
			sg.setBoardNo(b.getBoardNo());
			result2 = smallGroupDao.sgInsertBoard2(sg);
		}
		
		return result1*result2;
	
	}
	
	@Override
	public ArrayList<SmallGroup> sgSelectList() {
		return smallGroupDao.sgSelectList();
	}
	
	//컨 - s
	//service imp - s
	//service - s
	// dao - s , b
	// mapper - s, b
	
}
