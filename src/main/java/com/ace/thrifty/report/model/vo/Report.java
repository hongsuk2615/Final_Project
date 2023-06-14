package com.ace.thrifty.report.model.vo;

import com.ace.thrifty.board.model.vo.Board;
import com.ace.thrifty.board.model.vo.UpperCategory;
import com.ace.thrifty.member.model.vo.Member;
import com.ace.thrifty.reply.model.vo.Reply;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.RequiredArgsConstructor;

@Data
@AllArgsConstructor
@RequiredArgsConstructor
public class Report {
	private int boardNo;
	private int replyNo;
	private int rcategoryNo;
	private int reportUserNo;
	
	private Board board;
	private Member member;
	private UpperCategory upperCategory;
	private Reply reply;
}
