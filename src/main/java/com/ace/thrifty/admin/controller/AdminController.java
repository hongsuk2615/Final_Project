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
	
		Map<String, Integer> infoBoxMap = adminService.selectInfoBox();
		model.addAttribute("contents", "home");
		model.addAttribute("infoBox", infoBoxMap);
		
		return "admin/adminPage";
	}
	
	@GetMapping("/member")
	public String adminMember(Model model, HttpSession session, @RequestParam Map<String, Object> paramMap) {
		
			Map<String, Object> map = new HashMap<>();
			map.put("tab", paramMap.get("tab"));
			
			adminService.memberList(map, paramMap);
			
			System.out.println(map);
			
			model.addAttribute("contents", ".sidebar-member");
			model.addAttribute("map", map);
			
			
			return "admin/adminPage";
	}
	
	@GetMapping("/member/status/update") // ajax로 할지... 요청방식으로 할지... 고민....
	@ResponseBody()
	public String member(String statusVal) {
		
		System.out.println(statusVal);
		
		return "성공 ";
	}
	
	@GetMapping("/report")
	public String adminReport(Model model, HttpSession session) {
		
			model.addAttribute("contents", ".sidebar-report");
			return "admin/adminPage";
	}
	
	@GetMapping("/board")
	public String adminBoard(Model model, HttpSession session) {
		
			model.addAttribute("contents", ".sidebar-board");
			return "admin/adminPage";
	}
	
	@GetMapping("/notice")
	public String adminNotice(Model model, HttpSession session) {
		
			model.addAttribute("contents", ".sidebar-notice");
			return "admin/adminPage";
	}
	
	@GetMapping("/faq")
	public String adminfaq(Model model, HttpSession session) {
		
			model.addAttribute("contents", ".sidebar-faq");
			return "admin/adminPage";
	}
	
	@GetMapping("/enrollForm/notice") //나중에 공지사항과 faq가 여기로 오게
	public String adminenrollForm(Model model, HttpSession session) {
		
			model.addAttribute("contents", ".btn-write");
			
			return "admin/adminPage";
	}
	
	
	
	

}
