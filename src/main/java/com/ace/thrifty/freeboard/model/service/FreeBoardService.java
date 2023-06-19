package com.ace.thrifty.freeboard.model.service;
import java.util.List;
import java.util.Map;

import com.ace.thrifty.board.model.vo.Board;

public interface FreeBoardService {

	int insertFreeBoard(Board b);

	Board freeBoardDetail(int bNo);

	int updateFreeBoard(Board b);
	
	void freeBoardList(Map<String, Object> map, Map<String, Object> paramMap);

}
