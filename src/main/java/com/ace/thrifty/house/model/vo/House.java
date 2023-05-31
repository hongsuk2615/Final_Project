package com.ace.thrifty.house.model.vo;

import java.util.ArrayList;

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
	private String houseCoordinate;
	private String information;
	private String thumbnail;
	
	private ArrayList<Room> roomList;
	
}
