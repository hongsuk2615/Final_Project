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
	
	@PostMapping("/smallgroupupdate")
	public String updatePage(Board b, SmallGroup sg, Model model) {
		// detail 에있는 boardNo안받아왔다 
		// 받아오기위해선 param을 써야함? 
		// 수정하기 -> form 감싸서 원래 정보 다가져와 -> update페이제에서 써 
		
		model.addAttribute("b", b);
		model.addAttribute("sg", sg);
		
		return "myPage/smallgroupupdate";
	}
	

	
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
		
		
//		model.addAttribute("alertMsg", "성공");
		
		
	}
	return "redirect:/smallGroup";
	}
	
	
	@GetMapping("")
	public String sgSelectList(
								Model model) {
		
		ArrayList<SmallGroup> list = smallgroupService.sgSelectList();
		
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
		System.out.println(b);
		int result3 = smallgroupService.sgUpdateBoard(b, sg);
		
		if(result3>0) {
			

			model.addAttribute("alertMsg", "성공 ");	
		}
		
		
		return "redirect:/smallGroup";
	//update -> 일단 view(jsp)에서 session loginuser == userNo(글작성 유저 번호) 같으면 수정버튼 보이게
	// update 버튼 누를시 수정 페이지로 ㄱㄱ detail -> 수정하기 눌러 -> 수정하기 페이지로가 -> 수정하기 누르면 수정이
	// 제목, 내용, 지역 변경 ㄱㄱ 
	// 수정 버튼 누르기 
	
	}
	
	@GetMapping("/delete")
	public String sgDeleteBoard(
//			@RequestParam("boardNo") int boardNo,
			Board b,
			HttpSession session
			
	) {
		
		System.out.println(b);
	int result1 = smallgroupService.sgDeleteBoard(b);
	
	if(result1>0) {
		
		session.setAttribute("alertMsg", "성공");
	}else {
		
		session.setAttribute("alertMsg", "실패");
	}
	 // 삭제버튼 form에 영향을안받은 
	
		return "redirect:/smallGroup";
	}
		

	

}
