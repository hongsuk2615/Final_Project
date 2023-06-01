package com.ace.thrifty.ptj.model.vo;

import java.sql.Date;

import lombok.Data;

@Data
public class Ptj {

	private int boardNo;
	private int locationNo;
	private int price;
	private Date time;
	private String isEnd;
	
}
