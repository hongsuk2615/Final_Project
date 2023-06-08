package com.ace.thrifty.board.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ace.thrifty.board.model.service.BoardService;
import com.ace.thrifty.board.model.vo.Board;
import com.ace.thrifty.member.model.vo.Member;

@Controller
@RequestMapping("/board")
public class BoardController {

	@Autowired
	BoardService boardService;

	@GetMapping("/delete")
	@ResponseBody
	public int deleteBoard(int bNo, HttpSession session) {
		Member loginUser = (Member) session.getAttribute("loginUser");
		System.out.println(loginUser);
		if (loginUser == null) {
			return -1;
		} else {
			Board board = new Board();
			if (loginUser.getAuthority() == 0) {
				board.setBoardNo(bNo);
			} else {
				board.setBoardNo(bNo);
				board.setUserNo(loginUser.getUserNo());
			}
			System.out.println(boardService.deleteBoard(board));
			return boardService.deleteBoard(board);
		}
	}
}
