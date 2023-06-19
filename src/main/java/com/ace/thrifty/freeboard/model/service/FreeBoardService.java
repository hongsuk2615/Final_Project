package com.ace.thrifty.freeboard.model.service;
import java.util.List;

import com.ace.thrifty.board.model.vo.Board;

public interface FreeBoardService {

	int insertFreeBoard(Board b);

	Board freeBoardDetail(int bNo);

	int updateFreeBoard(Board b);
	List<Board> freeBoardList();

}
