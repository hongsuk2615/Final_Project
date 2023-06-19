package com.ace.thrifty.chat.model.vo;

import lombok.Data;

@Data
public class ChatRoom {
	
	private int chatRoomNo;
	private String title;
	private String status;
	private int userNo;

	private String nickName;
	private int cnt;

}
