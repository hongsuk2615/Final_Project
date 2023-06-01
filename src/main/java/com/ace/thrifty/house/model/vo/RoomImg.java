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
public class RoomImg {
	
	private int roomNo;
	private int roomImgNo;
	private String originName;
	private String changeName;
	private int imgLevel;
	private String status;

}
