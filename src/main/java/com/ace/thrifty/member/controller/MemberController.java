package com.ace.thrifty.member.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

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
	
	@PostMapping("/login")
	@ResponseBody
	public String loginMember(Member m, Model model) {
		
		if(memberService.loginMember(m) != null) {
			return "redirect:/";
		}else {
			return "redirect:/";
		}
	}
	
	@GetMapping("/enroll")
	public String enroll() {
		return "member/enrollForm";
	}
	
	@ResponseBody
	@PostMapping("/enroll")
	public boolean insertMember(Member m) {
		System.out.println(m);
		return memberService.insertMember(m) == 1 ? true : false;
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
