package com.ace.thrifty.myPage.model.service;

import java.util.ArrayList;

import com.ace.thrifty.board.model.vo.Board;

public interface MyPageService {
//	public String selectMyPage();
	
	public ArrayList<Board> selectBoardByUserNo(int userNo);

	
}
