package com.ace.thrifty.ptj.model.vo;

//import java.sql.Date;
import java.sql.Time;

import lombok.Data;

@Data
public class Ptj {

	private int boardNo;
	private int locationNo;
	private int price;
	private Time startTime;
	private Time endTime;
	private String isEnd;
	private int categorySNo;
	private String title;
	private String content;
	private int wishCount;
	private String locationName;
	
}
