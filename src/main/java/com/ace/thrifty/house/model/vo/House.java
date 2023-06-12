package com.ace.thrifty.house.model.vo;

import java.util.ArrayList;

import com.ace.thrifty.board.model.vo.Board;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class House {
	private int boardNo;
	private String houseAddress;
	private String houseLongitude;
	private String houseLatitude;
	private String information;
	private String thumbnail;
	private int minAmount;
	private int wish;
	
	private ArrayList<Room> roomList;
	private Board board;
	
}
