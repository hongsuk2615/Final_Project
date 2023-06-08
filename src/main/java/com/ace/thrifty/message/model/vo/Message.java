package com.ace.thrifty.message.model.vo;

import java.sql.Date;

import lombok.NoArgsConstructor;
import lombok.AllArgsConstructor;
import lombok.Data;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Message {
	private int messageNo;
	private int sender;
	private int receiver;
	private String content;
	private Date sendDate;
}
