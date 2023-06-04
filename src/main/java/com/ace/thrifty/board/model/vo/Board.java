package com.ace.thrifty.board.model.vo;

import java.sql.Date;
import java.util.ArrayList;

import com.ace.thrifty.co_purchase.model.vo.Co_purchase;

import com.ace.thrifty.member.model.vo.Member;
import com.ace.thrifty.smallgroup.model.vo.SmallGroup;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Board {
	private int boardNo;
	private int categorySNo;
	private int categoryUNo;
	private String upperCategoryName;
	private String content;
	private Date createDate;
	private int readCount;
	private int reportCount;
	private String title;
	private int userNo;
	private int wishCount;
	private String nickName;

	
	private ArrayList<Image> imgList;
	private ArrayList<Co_purchase> coPurchaseList;
}
