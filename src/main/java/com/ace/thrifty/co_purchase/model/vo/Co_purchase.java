package com.ace.thrifty.co_purchase.model.vo;

import java.sql.Date;

import com.ace.thrifty.board.model.vo.Board;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Co_purchase {
	
	private int boardNo;
	private int recruitsCurr;
	private int recruitNum;
	private int price;
	private Date deadLine;
	private String isEnd;
	
}
