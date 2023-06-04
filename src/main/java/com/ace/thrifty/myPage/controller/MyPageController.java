package com.ace.thrifty.myPage.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ace.thrifty.board.model.vo.Board;
import com.ace.thrifty.member.model.vo.Member;
import com.ace.thrifty.myPage.model.service.MyPageService;
import com.ace.thrifty.smallgroup.model.vo.SmallGroup;

@Controller
@RequestMapping("/mypage")
public class MyPageController {

	@Autowired
	private MyPageService myPageService;
	
	@GetMapping("/myPageMain")
	public String Main() {
		return "myPage/myPageMain";
				
	}
	
	
	@GetMapping("/myWrite")
	public String MyPageSelectList(
								Model model, 
								HttpSession session) {
		
		ArrayList<Board> list = myPageService.selectBoardByUserNo(((Member)session.getAttribute("loginUser")).getUserNo());
		
		model.addAttribute("list", list);
		
		System.out.println(list);
		
		return "myPage/myPageSelectWrite";
	}
	
}
