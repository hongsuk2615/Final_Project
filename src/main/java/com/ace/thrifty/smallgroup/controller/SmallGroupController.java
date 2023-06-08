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
import com.ace.thrifty.smallgroup.model.vo.SmallGroup;


@Controller
@RequestMapping("/smallGroup")
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
	
//	@PostMapping("/insert")
//	public String insertBoard( Model model, Board b, SmallGroup sg, HttpSession session) {
//		
//		int userNo = ((Member)session.getAttribute("loginUser")).getUserNo(); 
//		b.setUserNo(userNo);
//		
//		System.out.println(sg);
//		System.out.println(b);
//		
////		int result = boardService.insertBoard(b, sg); 
//		
//		if(result>0) {
//			model.addAttribute("alertmsg", "작성성공");
//		}
//		
//		return "myPage/smallgrouplist";
//	}
//			
//	@GetMapping("/detail/{boardNo}")
//	public String selectSmallGroupDetail(@PathVariable("boardNo") int boardNo) {
//		
////		Board sgBoard = boardService.selectSmallGroupDetail(boardNo);
//		
//		System.out.println(sgBoard);
//		
//		return "smallgroupdetail";
//	}

	

}
