package com.ace.thrifty.chat.model.vo;

import java.sql.Date;

import lombok.Data;

@Data
public class ChatMessage {
	
	private int cmNo;
	private String message;
	private Date createDate;
	private int chatRoomNo;
	private int userNo;
	private String nickName;
}
