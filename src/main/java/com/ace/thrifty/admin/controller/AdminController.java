package com.ace.thrifty.admin.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.LinkedHashMap;
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
import org.springframework.web.bind.support.SessionStatus;

import com.ace.thrifty.admin.model.service.AdminService;
import com.ace.thrifty.board.model.vo.SubCategory;
import com.ace.thrifty.board.model.vo.UpperCategory;
import com.ace.thrifty.member.model.vo.Member;

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
	public String adminMember(Model model, @RequestParam Map<String, Object> paramMap) {
		
			Map<String, String> tabMap = new LinkedHashMap<String, String>();
			tabMap.put("all", "전체");
			tabMap.put("active", "활성");
			tabMap.put("suspend", "정지");
			tabMap.put("banned", "탈퇴");
			
			Map<String, Object> map = new HashMap<>();
			map.put("tab", paramMap.get("tab"));
			
			adminService.memberList(map, paramMap);
			
			model.addAttribute("contents", "member");
			model.addAttribute("tabMap", tabMap);
			model.addAttribute("map", map);
			
			return "admin/adminPage";
	}
	
	@GetMapping(value="/member/status/update", produces = "application/text; charset=UTF-8")
	@ResponseBody()
	public String member(@RequestParam Map<String, Object> paramMap) {
		
		adminService.memberStatusUpdate(paramMap);
		
		String result = "의 상태가 변경되었습니다.";
		
		return result;
	}
	
	@GetMapping("/report")
	public String adminReport(Model model, @RequestParam Map<String, Object> paramMap) {
		
			model.addAttribute("contents", "report");
			return "admin/adminPage";
	}
	
	@GetMapping("/board")
	public String adminBoard(Model model, @RequestParam Map<String, Object> paramMap) {
		
			model.addAttribute("contents", "board");
			return "admin/adminPage";
	}
	
	@GetMapping("/notice")
	public String adminNotice(Model model, @RequestParam Map<String, Object> paramMap) {
		
			Map<String, Object> map = new HashMap<>();
			
			map.put("catUNo", paramMap.get("catUNo"));
			
			List<SubCategory> tab = adminService.subCatList();
			adminService.noticeList(map, paramMap);
			
			map.put("tabList", tab);
			
			System.out.println(tab);
			
			model.addAttribute("contents", "notice");
			model.addAttribute("map", map);
			
			return "admin/adminPage";
	}
	
	@GetMapping("/faq")
	public String adminfaq(Model model, @RequestParam Map<String, Object> paramMap) {
		
			model.addAttribute("contents", "faq");
			return "admin/adminPage";
	}
	
	@GetMapping("/enrollForm/notice") //나중에 공지사항과 faq가 여기로 오게
	public String adminenrollForm(Model model, @RequestParam Map<String, Object> paramMap) {
		
			model.addAttribute("contents", ".btn-write");
			
			return "admin/adminPage";
	}
	
	@GetMapping("/logout")
	public String logOut(SessionStatus status) {
		status.setComplete();
		return "redirect:/admin/login";
	}

}
