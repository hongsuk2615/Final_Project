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
	
	
	//게시글 상세조회
	
	@GetMapping("/detail/{boardNo}")
	public String sgDetail(@PathVariable("boardNo") int boardNo,
							Model model
							) {
		
		SmallGroup detail = smallgroupService.selectsgDetail(boardNo);
		
		model.addAttribute("sg", detail);
		
		return "myPage/smallgroupdetail";
	}
	
	
	@PostMapping("/update")
	public String sgUpdateBoard(
			Model model,
			SmallGroup sg,
			Board b,
			HttpSession session) {	
		
		int result3 = smallgroupService.sgUpdateBoard(b, sg);
		
		if(result3>0) {
			
			model.addAttribute("alertMsg", "성공 ");	
		}
		
		
		return "myPage/smallgrouplist";
	//update -> 일단 view(jsp)에서 session loginuser == userNo(글작성 유저 번호) 같으면 수정버튼 보이게
	// update 버튼 누를시 수정 페이지로 ㄱㄱ detail -> 수정하기 눌러 -> 수정하기 페이지로가 -> 수정하기 누르면 수정이
	// 제목, 내용, 지역 변경 ㄱㄱ 
	// 수정 버튼 누르기 
	
	}
		

	

}
