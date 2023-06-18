package com.ace.thrifty.freeboard.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ace.thrifty.board.model.vo.Board;
import com.ace.thrifty.freeboard.model.service.FreeBoardService;
import com.ace.thrifty.member.model.vo.Member;

@Controller
@RequestMapping("/freeBoard")
public class FreeBoardController {

	private FreeBoardService freeBoardService;
	
	@Autowired
	public FreeBoardController(FreeBoardService freeBoardService) {
		this.freeBoardService = freeBoardService;
	}
	
	@GetMapping("")
	public String freeBoard() {
		
		return "freeBoard/freeBoard";
	}
	
	@GetMapping("/enroll")
	public String freeBoardEnrollForm() {
		
		return "freeBoard/freeBoardEnrollForm";
	}
	
	@PostMapping("/insert")
	public String freeBoardInsert(Board b, Model model, HttpSession session) {
		String alert = "";
		
		b.setUserNo(((Member)session.getAttribute("loginUser")).getUserNo());
		b.setCategoryUNo(8);
		
		int result = freeBoardService.insertFreeBoard(b);
		
		if(result>0) {
			alert = "게시물이 등록되었습니다.";
		}else {
			alert = "게시물이 등록에 실패했습니다.";
		}
		
		model.addAttribute("alert", alert);
		
		return "redirect:/freeBoard";

	}
	
	@GetMapping("/detail") 
	public String freeBoardDetail(int bNo) {
		
		System.out.println(bNo);
		
		return "freeBoard/freeBoardDetail";
	}
}
