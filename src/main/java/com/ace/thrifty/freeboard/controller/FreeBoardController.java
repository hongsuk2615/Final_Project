package com.ace.thrifty.freeboard.controller;

import javax.servlet.http.HttpSession;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.ace.thrifty.board.model.vo.Board;
import com.ace.thrifty.freeboard.model.service.FreeBoardService;
import com.ace.thrifty.member.model.vo.Member;
import com.ace.thrifty.reply.model.service.ReplyService;
import com.ace.thrifty.reply.model.vo.Reply;

@Controller
@RequestMapping("/freeBoard")
public class FreeBoardController {

	private FreeBoardService freeBoardService;
	private ReplyService replyService;
	
	@Autowired
	public FreeBoardController(FreeBoardService freeBoardService, ReplyService replyService) {
		this.freeBoardService = freeBoardService;
		this.replyService = replyService;
	}
	
	@GetMapping("")
	public String freeBoard(Model model,
							@RequestParam(defaultValue = "0") int categorySNo,
							@RequestParam(defaultValue = "1") int currentPage) {
		
		Map<String, Object> paramMap = new HashMap<>();
		Map<String, Object> map = new HashMap<>();
		
		map.put("categorySNo", categorySNo);
		paramMap.put("categorySNo",categorySNo);
		paramMap.put("currentPage",currentPage);
		
		
		freeBoardService.freeBoardList(map, paramMap);
		
		model.addAttribute("map", map);
		
		return "freeBoard/freeBoard";
	}
	
	@GetMapping("/enroll")
	public String freeBoardEnrollForm(Model model, @RequestParam(value="bNo", required = false) Integer bNo) {
		
		if(bNo != null) {
			Board b = freeBoardService.freeBoardDetail(bNo);
			
			model.addAttribute("b", b);
		}
		
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
	
	@PostMapping("/update")
	public String freeBoardUpdate(Board b, Model model) {
		
		System.out.println(b);
		
		String alert = "";
		
		int result = freeBoardService.updateFreeBoard(b);
		
		if(result>0) {
			alert = "게시물이 수정되었습니다.";
		}else {
			alert = "게시물이 수정에 실패했습니다.";
		}
		
		model.addAttribute("alert", alert);
		
		
		return "redirect:/freeBoard/detail?bNo="+b.getBoardNo();
		
	}
	
	@GetMapping("/detail") 
	public String freeBoardDetail(Model model, int bNo,  @RequestParam Map<String, Object> paramMap) {
		
		Board b = freeBoardService.freeBoardDetail(bNo);
		
		List<Reply> rList = replyService.BoardReplyList(bNo);
		
		model.addAttribute("map", paramMap);
		model.addAttribute("b",b);
		model.addAttribute("rList", rList);
		
		return "freeBoard/freeBoardDetail";
	}
}
