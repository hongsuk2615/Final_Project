package com.ace.thrifty.admin.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/admin")
public class AdminController {

	@GetMapping("/home")
	public String adminHome(Model model) {
		model.addAttribute("sidebar", "home");
		return "admin/adminPage";
	}
	@GetMapping("/member")
	public String adminMember(Model model) {
		model.addAttribute("sidebar", ".sidebar-member");
		return "admin/adminPage";
	}
	@GetMapping("/report")
	public String adminReport(Model model) {
		model.addAttribute("sidebar", ".sidebar-report");
		return "admin/adminPage";
	}
	@GetMapping("/board")
	public String AdminBoard(Model model) {
		model.addAttribute("sidebar", ".sidebar-board");
		return "admin/adminPage";
	}
	@GetMapping("/notice")
	public String AdminNotice(Model model) {
		model.addAttribute("sidebar", ".sidebar-notice");
		return "admin/adminPage";
	}
	@GetMapping("/faq")
	public String Adminfaq(Model model) {
		model.addAttribute("sidebar", ".sidebar-faq");
		return "admin/adminPage";
	}
}
