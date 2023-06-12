package com.ace.thrifty.carpool.model.vo;

import java.util.ArrayList;

import com.ace.thrifty.board.model.vo.Board;
import com.ace.thrifty.board.model.vo.Image;
import com.ace.thrifty.board.model.vo.Location;
import com.ace.thrifty.board.model.vo.SubCategory;
import com.ace.thrifty.member.model.vo.Member;

import lombok.Data;

@Data
public class CarPool {

	private int boardNo;
	private int recruitsNum;
	private int recruitsCurr;
	private String isEnd;
	private int locationNo;
	private String imgPath;
	
	private Board board;
	private Location location;
	private SubCategory subCategory;
	private ArrayList<Image> imageList;
	private Member member;
}
