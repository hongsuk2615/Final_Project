package com.ace.thrifty.admin.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.ace.thrifty.admin.model.service.AdminService;
import com.ace.thrifty.member.model.vo.Member;
import com.google.gson.Gson;

@Controller
@RequestMapping("/admin")
@SessionAttributes({"loginAdmin"})
public class AdminController {
	
	private AdminService adminService;
	
	@Autowired
	public AdminController(AdminService adminService) {
		this.adminService = adminService;
	}
	
	@GetMapping("/login")
	public String login() {
		return "admin/adminLoginPage";
	}
	
	@PostMapping("/login")
	public String adminLogin(Model model, HttpSession session, Member m) {
		
		Member loginAdmin = adminService.loginAdmin(m);
		
		if(loginAdmin != null) {
			model.addAttribute("loginAdmin", loginAdmin);
			
			return "redirect:/admin";
			
		}else {
			Map<String, String> errorAlert = new HashMap<>();
			errorAlert.put("title", "로그인 실패!");
			errorAlert.put("content", "다시 한번 시도해주세요.");
			
			session.setAttribute("errorAlert", errorAlert);
			
			return "redirect:/admin/login";
		}
	}
	
	
	@GetMapping(value = { "", "/home" } )
	public String adminHome(Model model, HttpSession session) {
		
		Member loginAdmin = (Member) session.getAttribute("loginAdmin");
		
		if(loginAdmin != null) {
			Map<String, Integer> infoBoxMap = adminService.selectInfoBox();
			model.addAttribute("contents", "home");
			model.addAttribute("infoBox", infoBoxMap);
			
			return "admin/adminPage";
		}else {
			return "redirect:/admin/login";
		}
	}
	
	@GetMapping("/member")
	public String adminMember(Model model, HttpSession session, @RequestParam(value="currentPage", required = false, defaultValue = "1") int pageNo) {
		
		Member loginAdmin = (Member) session.getAttribute("loginAdmin"); 

		if(loginAdmin != null) {
			
			List<Member> memberList = adminService.memberList();
			
			model.addAttribute("contents", ".sidebar-member");
			model.addAttribute("memberList", memberList);
			
			return "admin/adminPage";
		}else {
			return "redirect:/admin/login";
		}
	}
	
	@GetMapping("/report")
	public String adminReport(Model model, HttpSession session) {
		
		Member loginAdmin = (Member) session.getAttribute("loginAdmin"); 
		
		if(loginAdmin != null) {
			model.addAttribute("contents", ".sidebar-report");
			return "admin/adminPage";
		}else {
			return "redirect:/admin/login";
		}
	}
	
	@GetMapping("/board")
	public String adminBoard(Model model, HttpSession session) {
		
		Member loginAdmin = (Member) session.getAttribute("loginAdmin"); 
		
		if(loginAdmin != null) {
			model.addAttribute("contents", ".sidebar-board");
			return "admin/adminPage";
		}else {
			return "redirect:/admin/login";
		}
	}
	
	@GetMapping("/notice")
	public String adminNotice(Model model, HttpSession session) {
		
		Member loginAdmin = (Member) session.getAttribute("loginAdmin"); 
		
		if(loginAdmin != null) {
			model.addAttribute("contents", ".sidebar-notice");
			return "admin/adminPage";
		}else {
			return "redirect:/admin/login";
		}
	}
	
	@GetMapping("/faq")
	public String adminfaq(Model model, HttpSession session) {
		
		Member loginAdmin = (Member) session.getAttribute("loginAdmin"); 
		
		if(loginAdmin != null) {
			model.addAttribute("contents", ".sidebar-faq");
			return "admin/adminPage";
		}else {
			return "redirect:/admin/login";
		}
	}
	
	@GetMapping("/enrollForm/notice") //나중에 공지사항과 faq가 여기로 오게
	public String adminenrollForm(Model model, HttpSession session) {
		
		Member loginAdmin = (Member) session.getAttribute("loginAdmin"); 
		
		if(loginAdmin != null) {
			model.addAttribute("contents", ".btn-write");
			
			return "admin/adminPage";
		}else {
			return "redirect:/admin/login";
		}
	}
	
	@GetMapping("/member/tabs")
	@ResponseBody
	public String memberTabs(String tab) {
		System.out.println(tab);
		List<Member> list = adminService.memberListAjax(tab);
		System.out.println(list);
		return new Gson().toJson(list);
	}
	
	
	

}
