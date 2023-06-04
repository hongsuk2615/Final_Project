package com.ace.thrifty.usedProduct.model.vo;

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
public class UsedProduct {
	private int boardNo;
	private String productName;
	private String title;
	private int price;
	private String tradeMethod;
	private String isSoldOut;
	private int locationNo;
	
	private String locationName;
	private String categoryName;
	private String thumbNail;
	
	private Board board;
	private Member seller;
	private ArrayList<Image> imageList;
}
