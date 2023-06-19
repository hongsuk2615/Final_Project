package com.ace.thrifty.freeboard.model.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ace.thrifty.board.model.vo.Board;
import com.ace.thrifty.common.model.vo.PageInfo;
import com.ace.thrifty.common.template.Pagination;
import com.ace.thrifty.freeboard.model.dao.FreeBoardDao;

@Service
public class FreeBoardServiceImpl implements FreeBoardService{
	
	private FreeBoardDao freeBoardDao;
	private Pagination pageination;
	
	@Autowired
	public FreeBoardServiceImpl(FreeBoardDao freeBoarDao, Pagination pageination) {
		this.freeBoardDao = freeBoarDao;
		this.pageination = pageination;
	}

	@Override
	public int insertFreeBoard(Board b) {
		return freeBoardDao.insertFreeBoard(b);
	}

	@Override
	public Board freeBoardDetail(int bNo) {
		
		Board b = freeBoardDao.freeBoardDetail(bNo);
		int result2 = 0;
		
		if(b != null) {
			result2 = freeBoardDao.freeBoardreadCount(bNo);
		}
		
		return b;
	}

	@Override
	public int updateFreeBoard(Board b) {
		return freeBoardDao.updateFreeBoard(b);
	}
	
	@Override
	public void freeBoardList(Map<String, Object> map, Map<String, Object> paramMap) {
		
		int listCount = freeBoardDao.selectfreeBoardListCount(paramMap);
		Integer currentPage = (Integer) paramMap.get("currentPage");
		int pageLimit = 5;
		int boardLimit = 10;
		
		PageInfo pi = pageination.getPageInfo(listCount, currentPage, pageLimit, boardLimit);
		
		List<Board> list = freeBoardDao.selectList(pi, paramMap); 
		
		map.put("pi", pi);
		map.put("list", list);
		
	}

}
