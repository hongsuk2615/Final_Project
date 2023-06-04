package com.ace.thrifty.myPage.model.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ace.thrifty.board.model.dao.BoardDao;
import com.ace.thrifty.board.model.vo.Board;
import com.ace.thrifty.myPage.model.dao.MyPageDao;

@Service
public class MyPageServiceImp  implements MyPageService{

	@Autowired
	BoardDao boardDao;
	
	
//	public String selectMyPage() {
//		
//		return myPageDao.selectMyPage();
//	}
	
	@Override
	public ArrayList<Board> selectBoardByUserNo(int userNo){
		return boardDao.selectBoardByUserNo(userNo);
	}
	
	
}
