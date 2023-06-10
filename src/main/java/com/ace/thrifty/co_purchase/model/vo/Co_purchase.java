package com.ace.thrifty.co_purchase.model.vo;

import java.sql.Date;
import java.util.ArrayList;

import com.ace.thrifty.board.model.vo.Board;
import com.ace.thrifty.board.model.vo.Image;
import com.ace.thrifty.member.model.vo.Member;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Co_purchase {
	
	private int boardNo;
	private int recruitsCurr;
	private int recruitsNum;
	private int price;
	private Date deadLine;
	private String isEnd;
	
	private String title;
	private String content;
	private Date createDate;
	private int wishCount;
	private int readCount;
	private String thumbNail;
	
	private Board board;
	private Member seller;
	private ArrayList<Image> imageList;
}
