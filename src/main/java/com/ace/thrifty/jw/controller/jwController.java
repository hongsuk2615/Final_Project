package com.ace.thrifty.jw.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class jwController {
	
	@RequestMapping("/jw")
	public String abc() {
		return "myPage/smallgroupdetail";
	}
	
	@RequestMapping("/jwmy")
	public String abcd() {
		return "myPage/myPageUpdate";
	}
	
	@RequestMapping("/jwmyMain")
	public String abcde() {
		return "myPage/myPageMain";
				
	}
	
	
}
