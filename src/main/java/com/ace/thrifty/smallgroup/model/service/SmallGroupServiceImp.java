package com.ace.thrifty.smallgroup.model.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.multipart.MultipartFile;

import com.ace.thrifty.board.model.dao.BoardDao;
import com.ace.thrifty.board.model.vo.Board;
import com.ace.thrifty.board.model.vo.Image;
import com.ace.thrifty.common.Utils;
import com.ace.thrifty.common.model.vo.PageInfo;
import com.ace.thrifty.smallgroup.model.dao.SmallGroupDao;
import com.ace.thrifty.smallgroup.model.vo.SmallGroup;
import com.ace.thrifty.usedProduct.model.vo.UsedProduct;
import com.ace.thrifty.common.model.vo.PageInfo;
import com.ace.thrifty.common.template.Pagination;

@Service
public class SmallGroupServiceImp implements SmallGroupService{

	@Autowired
	SmallGroupDao smallGroupDao;
	@Autowired
	BoardDao boardDao;
	
	@Autowired
	Pagination pagination;
	
	
	
	@Override
	public int sgInsertBoard(Board b, SmallGroup sg) {
		int result1 = 0;
		int result2 = 0;
		
		
		
		
		result1 = boardDao.sgInsertBoard(b);
		
		
		if(result1>0) {
			sg.setBoardNo(b.getBoardNo());
			
			result2 = smallGroupDao.sgInsertBoard2(sg);
			
		}
		
		return result1*result2;
	
	}
	
//	@Override
//	public ArrayList<SmallGroup> sgSelectList() {
//		return smallGroupDao.sgSelectList();
//	}
	
	@Override
	public SmallGroup selectsgDetail(int boardNo) {
		
		return smallGroupDao.selectsgDetail(boardNo);
	}
	
	@Override
	public int sgUpdateBoard(Board b, SmallGroup sg) {
		int result1 = 0;
		int result2 = 0;
		
		result1 = boardDao.sgUpdateBoard(b);
				
		if(result1>0) {
			sg.setBoardNo(b.getBoardNo());
			result2 = smallGroupDao.sgUpdateBoard2(sg);
		}
		return result1*result2;
	}
	
	@Override
	public int sgDeleteBoard(Board b) {
		return smallGroupDao.sgDeleteBoard(b);
	}
	
	
	@Override
	public void selectsmallgroup(Map<String, Object> queryString) {
		int listCount = smallGroupDao.selectsmallgroupCount(queryString);
		int pageLimit = 10;
		int boardLimit = 10;
		PageInfo pi = pagination.getPageInfo(listCount, Integer.parseInt((String)(queryString.get("currPage"))), pageLimit, boardLimit);
		List<SmallGroup> list = smallGroupDao.selectsmallgroup(pi, queryString);
		
		queryString.put("pi", pi);
		queryString.put("list", list);
	}
	
}
