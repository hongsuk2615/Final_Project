package com.ace.thrifty.smallgroup.model.vo;

import java.sql.Date;

import com.ace.thrifty.board.model.vo.Board;
import com.ace.thrifty.member.model.vo.Member;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class SmallGroup {
	private int boardNo;
	private String smallLocation;
	private int recruitNo;
	private Board board;
	private Member member;

}
