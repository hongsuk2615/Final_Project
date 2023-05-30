package com.ace.thrifty.smallgroup.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.ace.thrifty.board.model.service.BoardService;
import com.ace.thrifty.board.model.vo.Board;
import com.ace.thrifty.member.model.vo.Member;


@Controller
@RequestMapping("/smallgroup")
public class SmallGroupController {
	
	@Autowired
	private BoardService boardService; 
	
	
	@GetMapping("")
	public String smallgrouplist(){
		return "myPage/smallgrouplist";
	}
	
	@GetMapping("/boardEnrollForm")
	public String enroll() {
		return "myPage/smallgroupwrite";
	}
	
	@PostMapping("/insert")
	public String insertBoard(
			Model model,
			Board b, HttpSession session) {
		int userNo = ((Member)session.getAttribute("loginUser")).getUserNo();
		b.setUserNo(userNo);
		
		
		boardService.insertBoard(b);
		return "myPage/smallgrouplist";
	}
			
		

	

}
