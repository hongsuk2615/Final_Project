package com.ace.thrifty.member.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ace.thrifty.member.model.service.MemberService;
import com.ace.thrifty.member.model.vo.Member;

@Controller
@RequestMapping("/member")
public class MemberController {
	
	@Autowired
	MemberService memberService;
	
	@GetMapping("/login")
	public String login() {
		return "member/login";
	}
	
	@GetMapping("/enroll")
	public String enroll() {
		return "member/enrollForm";
	}
	
	@GetMapping("/findId")
	public String findId() {
		return "member/findId";
	}
	
	@GetMapping("/findPwd")
	public String findPwd() {
		return "member/findPwd";
	}
	
	@GetMapping("/test")
	public String test() {
		Member m = memberService.selectMember();
		System.out.println(m);
		return "member/findPwd";
	}
}
