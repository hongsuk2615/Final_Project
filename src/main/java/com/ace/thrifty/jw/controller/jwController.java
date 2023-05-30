package com.ace.thrifty.jw.controller;

import java.util.ArrayList;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.ace.thrifty.board.model.service.BoardService;
import com.ace.thrifty.board.model.vo.Board;

@Controller
public class jwController {
	
	@RequestMapping("/jwgroupdetail")
	public String abc() {
		return "myPage/smallgroupdetail";
	}
	
	@RequestMapping("/jwmyMainupdate")
	public String abcd() {
		return "myPage/myPageUpdate";
	}
	
	@RequestMapping("/jwmyMain")
	public String abcde() {
		return "myPage/myPageMain";
				
	}
	@RequestMapping("/jwgrouplist")
	public String abcdef() {
		return "myPage/smallgrouplist";
				
	}
	
	
	@RequestMapping("/jwmySelectwrite")
	public String abcdefg() {
		return "myPage/myPageSelectWrite";
				
	}
	
	@RequestMapping("/jwmyZzim")
	public String abcdefgf() {
		return "myPage/myPagezzim";
				
	}
	
	
	
	
	
	
	
	
	
	
	
}
