package com.ace.thrifty.notice.model.vo;

import java.sql.Date;
import java.util.ArrayList;

import com.ace.thrifty.board.model.vo.Image;
import com.ace.thrifty.board.model.vo.SubCategory;
import com.ace.thrifty.board.model.vo.UpperCategory;
import com.ace.thrifty.member.model.vo.Member;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Notice {
	private int boardNo;
	private int categorySNo;
	private int categoryUNo;
	private String upperCategoryName;
	private String subCategoryName;
	private String content;
	private Date createDate;
	private int readCount;
	private int reportCount;
	private String title;
	private int userNo;
	private int wishCount;
	private String nickName;
	private String status;
	
	private Member member;
	private UpperCategory upperCategory;
	private SubCategory subCategory;
	
	private ArrayList<Image> imgList;
}
