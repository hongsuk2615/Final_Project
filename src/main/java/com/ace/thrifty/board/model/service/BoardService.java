package com.ace.thrifty.board.model.service;

import java.util.ArrayList;
import java.util.List;

import com.ace.thrifty.board.model.vo.Board;
import com.ace.thrifty.board.model.vo.Image;
import com.ace.thrifty.board.model.vo.Location;
import com.ace.thrifty.board.model.vo.SubCategory;
import com.ace.thrifty.board.model.vo.UpperCategory;

public interface BoardService {

	public Board selectBoard(int boardNo);	
//	public int insertBoard(Board b, SmallGroup sg);	
	public List<UpperCategory> selectUpperCategoryList();	
	public List<SubCategory> selectSubCategoryList();
	public List<Location> selectLocationList();
	public int insertBoard(Board b);
	public int insertImageList(ArrayList<Image> imageList);
}
