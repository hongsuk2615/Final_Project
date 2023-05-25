package com.ace.thrifty.jw.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

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
