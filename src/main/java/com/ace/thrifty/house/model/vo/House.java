package com.ace.thrifty.house.model.vo;

import java.util.ArrayList;

import lombok.Builder;
import lombok.Data;

@Data
@Builder
public class House {
	private int boardNo;
	private String houseAddress;
	private String houseCoordinate;
	private String information;
	private String thumbnail;
	
	private ArrayList<Room> roomList;
	
}
