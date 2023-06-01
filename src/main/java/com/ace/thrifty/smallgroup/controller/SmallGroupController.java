package com.ace.thrifty.smallgroup.controller;

import java.util.ArrayList;

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
import com.ace.thrifty.smallgroup.model.service.SmallGroupService;
import com.ace.thrifty.smallgroup.model.vo.SmallGroup;


@Controller
@RequestMapping("/smallGroup")
public class SmallGroupController {
	
	@Autowired
	private SmallGroupService smallgroupService;
	
	
	

	
	@GetMapping("/boardEnrollForm")
	public String enroll() {
		return "myPage/smallgroupwrite";
	}
	//글작성 - 글작성 버튼 
	@PostMapping("/insert")
	public String sgInsertBoard(
			Model model,
			SmallGroup sg,
			Board b, HttpSession session) {
		int userNo = ((Member)session.getAttribute("loginUser")).getUserNo();
		b.setUserNo(userNo);
		System.out.println(userNo);
		
		
		System.out.println(sg);
		System.out.println(b);
		int result3 = smallgroupService.sgInsertBoard(b, sg);
		
		if(result3>0){
		
		
			model.addAttribute("alertMsg", "성공 ");	
		
		}
		 
		
		return "myPage/smallgrouplist";
	}
	
	@GetMapping("")
	public String sgSelectList(
								Model model) {
		
		ArrayList<SmallGroup> list = smallgroupService.sgSelectList();
		System.out.println(list);
		
		model.addAttribute("list", list);
		
		
		
		return "myPage/smallgrouplist";
	}
	// 리스트 조회 
	
	
	
			
		

	

}
