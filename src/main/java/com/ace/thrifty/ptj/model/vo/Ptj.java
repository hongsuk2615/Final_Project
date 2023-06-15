package com.ace.thrifty.ptj.model.vo;

//import java.sql.Date;
import java.sql.Time;
import java.util.ArrayList;
import java.util.List;

import com.ace.thrifty.board.model.vo.Board;
import com.ace.thrifty.board.model.vo.Image;
import com.ace.thrifty.board.model.vo.Location;
import com.ace.thrifty.board.model.vo.SubCategory;
import com.ace.thrifty.member.model.vo.Member;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Ptj {

	private int boardNo;
	private int locationNo;
	private int price;
	private Time startTime;
	private Time endTime;
	private String isEnd;
	private String imgPath;
	private String locationCoordinate;
	
	
	private Board board;
	private Location location;
	private SubCategory subCategory;
	private ArrayList<Image> imageList;
	private Member member;
}
