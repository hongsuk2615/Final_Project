package com.ace.thrifty.reply.controller;

import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ace.thrifty.member.model.vo.Member;
import com.ace.thrifty.reply.model.service.ReplyService;

@Controller
@RequestMapping("/reply")
public class ReplyController {

	private ReplyService replyService;
	
	@Autowired
	public ReplyController(ReplyService replyService) {
		this.replyService = replyService;
	}
	
	@GetMapping("/insert")
	@ResponseBody
	public String replyInsert(@RequestParam Map<String, Object> paramMap, HttpSession session) {
		
		paramMap.put("userNo", ((Member)session.getAttribute("loginUser")).getUserNo());
		
		int result = replyService.replyInsert(paramMap);
		
		
		return  Integer.toString(result);
	}
	
	@GetMapping("/delete")
	@ResponseBody
	public String replyDelete(int rNo) {
		
		
		int result = replyService.replyDelete(rNo);
		
		System.out.println(result);
		return Integer.toString(result);
	}
}
