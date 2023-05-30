package com.ace.thrifty.board.model.service;

import java.util.ArrayList;

import com.ace.thrifty.board.model.vo.Board;

public interface BoardService {

	public Board selectBoard();
	
	public int insertBoard(Board b);
	
	
	
}
