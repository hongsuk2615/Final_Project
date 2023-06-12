package com.ace.thrifty.smallgroup.model.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.multipart.MultipartFile;

import com.ace.thrifty.board.model.dao.BoardDao;
import com.ace.thrifty.board.model.vo.Board;
import com.ace.thrifty.common.Utils;
import com.ace.thrifty.smallgroup.model.dao.SmallGroupDao;
import com.ace.thrifty.smallgroup.model.vo.SmallGroup;

@Service
public class SmallGroupServiceImp implements SmallGroupService{

	@Autowired
	SmallGroupDao smallGroupDao;
	@Autowired
	BoardDao boardDao;
	
	
	
	@Override
	public int sgInsertBoard(Board b, SmallGroup sg, MultipartFile qrimage, String webPath, String serverFolderPath) throws Exception {
		int result1 = 0;
		int result2 = 0;
		String changeName = Utils.saveFile(qrimage, serverFolderPath);
		
		result1 = boardDao.sgInsertBoard(b);
		
		
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
	
}
