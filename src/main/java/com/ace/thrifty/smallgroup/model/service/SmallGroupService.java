package com.ace.thrifty.smallgroup.model.service;

import java.util.ArrayList;

import org.springframework.web.multipart.MultipartFile;

import com.ace.thrifty.board.model.vo.Board;
import com.ace.thrifty.smallgroup.model.vo.SmallGroup;

public interface SmallGroupService {

	
	
	public int sgInsertBoard(Board b, SmallGroup sg, MultipartFile qrimage, String webPath, String serverFolderPath)throws Exception;
	
	public ArrayList<SmallGroup> sgSelectList();
	
	public SmallGroup selectsgDetail(int boardNo);
	
	public int sgUpdateBoard(Board b, SmallGroup sg);
	
	public int sgDeleteBoard(Board b);
}
