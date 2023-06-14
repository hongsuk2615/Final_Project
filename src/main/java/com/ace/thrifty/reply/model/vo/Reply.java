package com.ace.thrifty.reply.model.vo;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.RequiredArgsConstructor;

@Data
@AllArgsConstructor
@RequiredArgsConstructor
public class Reply {
	private int replyNo;
	private int refBno;
	private String content;
	private Date createDate;
	private String state;
	private int parentReplyNo;
	private int reportCount;
}
