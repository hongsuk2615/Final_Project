package com.ace.thrifty.carpool.model.vo;

import java.sql.Time;
import java.util.ArrayList;

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
public class CarPool {

	private int boardNo;
	private int recruitsNum;
	private int recruitsCurr;
	private String isEnd;
	private int locationNo;
	private String imgPath;
	private Time startTime;
	private Time endTime;
	private int price;
	private String origin;
	private String destination;
	
	private Board board;
	private Location location;
	private SubCategory subCategory;
	private ArrayList<Image> imageList;
	private Member member;
}
