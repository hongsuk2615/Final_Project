package com.ace.thrifty.admin.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/admin")
public class AdminController {

	@GetMapping(value = { "", "/home" } )
	public String adminHome(Model model) {
		model.addAttribute("contents", "home");
		return "admin/adminPage";
	}
	@GetMapping("/member")
	public String adminMember(Model model) {
		model.addAttribute("contents", ".sidebar-member");
		return "admin/adminPage";
	}
	@GetMapping("/report")
	public String adminReport(Model model) {
		model.addAttribute("contents", ".sidebar-report");
		return "admin/adminPage";
	}
	@GetMapping("/board")
	public String adminBoard(Model model) {
		model.addAttribute("contents", ".sidebar-board");
		return "admin/adminPage";
	}
	@GetMapping("/notice")
	public String adminNotice(Model model) {
		model.addAttribute("contents", ".sidebar-notice");
		return "admin/adminPage";
	}
	@GetMapping("/faq")
	public String adminfaq(Model model) {
		model.addAttribute("contents", ".sidebar-faq");
		return "admin/adminPage";
	}
	@GetMapping("/enrollForm/notice") //나중에 공지사항과 faq가 여기로 오게
	public String adminenrollForm(Model model) {
		model.addAttribute("contents", ".btn-write");
		return "admin/adminPage";
	}
}
