package com.ace.thrifty.house.model.vo;

import java.util.ArrayList;
import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class Room {
	
	private int boardNo;
	private int roomNo;
	private int recruitsNum; // 모집인원
	private String division; // 방이름
	private String gender; // 성별
	private String type; // 타입
	private double area; // 면적
	private int deposit; // 보증금
	private int rent; // 월임대료
	private int cost; // 관리비
	private String contrat; // 계약종료일
	private String symbol;
	private ArrayList<RoomImg> imgList;
	
}
