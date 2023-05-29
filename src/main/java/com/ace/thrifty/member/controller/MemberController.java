package com.ace.thrifty.member.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;

import com.ace.thrifty.member.model.service.MemberService;
import com.ace.thrifty.member.model.vo.Member;

@Controller
@RequestMapping("/member")
@SessionAttributes({"loginUser"})
public class MemberController {
	
	@Autowired
	MemberService memberService;
	
	
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
	
	@GetMapping("/login")
	public String login() {
		return "member/login";
	}
	
	@PostMapping("/login")
	public String loginMember(Member m, Model model) {
		System.out.println(m);
		Member loginUser = memberService.loginMember(m);
		if( loginUser != null) {
			model.addAttribute("loginUser", loginUser);
			return "redirect:/";
		}else {
			model.addAttribute("alertMsg", "로그인 실패");
			return "redirect:/";
		}
	}
	
	@GetMapping("/logout")
	public String logOut(SessionStatus status) {
		status.setComplete();
		return "redirect:/";
	}
	
	@GetMapping("/validateId")
	@ResponseBody
	public boolean validateId(String userId) {
		return memberService.selectById(userId) == null;
	}
	
	@GetMapping("/validateEmail")
	@ResponseBody
	public boolean validateEmail(String email) {
		return memberService.selectByEmail(email) == null;
	}
	
	@GetMapping("/validateNickName")
	@ResponseBody
	public boolean validateNickName(String nickName) {
		return memberService.selectByNickName(nickName) == null;
	}
	

}
