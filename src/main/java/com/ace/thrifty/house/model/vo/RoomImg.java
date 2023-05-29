package com.ace.thrifty.house.model.vo;

import lombok.Builder;
import lombok.Data;

@Data
@Builder
public class RoomImg {
	
	private int roomNo;
	private int boardImgNo;
	private String originName;
	private String changeName;
	private int imgLevel;

}
