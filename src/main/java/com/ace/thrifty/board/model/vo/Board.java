package com.ace.thrifty.board.model.vo;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Board {
	private int boardNo;
	private int categorySNo;
	private String content;
	private Date createDate;
	private int readCount;
	private int reportCount;
	private String title;
	private int userNo;
	private int wishCount;
	private int categoryUNo;
}
