package com.ace.thrifty.admin.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/admin")
public class AdminController {

	@GetMapping("/home")
	public String adminHome() {
		return "admin/adminHome";
	}
	@GetMapping("/member")
	public String adminMember() {
		return "admin/adminMember";
	}
	@GetMapping("/report")
	public String adminReport() {
		return "admin/adminReport";
	}
	@GetMapping("/board")
	public String AdminBoard() {
		return "admin/adminBoard";
	}
	@GetMapping("/notice")
	public String AdminNotice() {
		return "admin/adminNotice";
	}
	@GetMapping("/faq")
	public String Adminfaq() {
		return "admin/adminFaq";
	}
}
