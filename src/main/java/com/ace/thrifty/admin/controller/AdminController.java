package com.ace.thrifty.admin.controller;

import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.ace.thrifty.admin.model.service.AdminService;
import com.ace.thrifty.board.model.vo.Board;
import com.ace.thrifty.board.model.vo.SubCategory;
import com.ace.thrifty.board.model.vo.UpperCategory;
import com.ace.thrifty.common.Utils;
import com.ace.thrifty.member.model.vo.Member;
import com.ace.thrifty.report.model.vo.Report;
import com.google.gson.Gson;

@Controller
@RequestMapping("/admin")
@SessionAttributes({"loginUser"})
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
		
		Member loginUser = adminService.loginAdmin(m);
		
		if(loginUser != null) {
			model.addAttribute("loginUser", loginUser);
			
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
	
	@GetMapping(value="/{location}/status/update", produces = "application/text; charset=UTF-8")
	@ResponseBody
	public String statusUpdate(@PathVariable("location") String location, @RequestParam Map<String, Object> paramMap) {
		
		String alert = "";
		System.out.println(paramMap+" || "+location);
		
		int result = adminService.StatusUpdate(location, paramMap);
		
		if(result>0) {
		 alert = "변경되었습니다.";
		}else {
			alert = "변경실패";
		}
		
		return alert;
	}
	
	@GetMapping("/report")
	public String adminReport(Model model, @RequestParam Map<String, Object> paramMap) {
		
		Map<String, Object> map = new LinkedHashMap<>();
		
		List<UpperCategory> tabList = adminService.upperCatList();
		
		map.put("type", paramMap.get("type"));
		map.put("catUNo", paramMap.get("catUNo"));
		map.put("tabList", tabList);
		
		adminService.reportList(map, paramMap);
		
		model.addAttribute("contents", "report");
		model.addAttribute("map", map);
		return "admin/adminPage";
	}
	
	@GetMapping("/board")
	public String adminBoard(Model model, @RequestParam Map<String, Object> paramMap) {
		
		Map<String, Object> map = new LinkedHashMap<>();
		
		List<UpperCategory> tabList = adminService.upperCatList();
		adminService.BoardList(map, paramMap);
		
		map.put("catUNo", paramMap.get("catUNo"));
		map.put("tabList", tabList);
		
		model.addAttribute("contents", "board");
		model.addAttribute("map", map);
		
		return "admin/adminPage";
	}
	
	@GetMapping("/notice")
	public String adminNotice(Model model, @RequestParam Map<String, Object> paramMap) {
		
			Map<String, Object> map = new HashMap<>();
			
			
			map.put("catSNo", paramMap.get("catSNo"));
			
			List<SubCategory> tab = adminService.noticeSubCatList();
			adminService.noticeList(map, paramMap);
			
			map.put("catUNo", tab.get(0).getCategoryUNo());
			map.put("tabList", tab);
			
			model.addAttribute("contents", "notice");
			model.addAttribute("map", map);
			
			return "admin/adminPage";
	}
	
	@GetMapping("/faq")
	public String adminfaq(Model model, @RequestParam Map<String, Object> paramMap) {
		
		Map<String, Object> map = new HashMap<>();
		
		map.put("catSNo", paramMap.get("catSNo"));
		
		List<SubCategory> tab = adminService.faqSubCatList();
		adminService.faqList(map, paramMap);
		
		map.put("catUNo", tab.get(0).getCategoryUNo());
		map.put("tabList", tab);
		
		model.addAttribute("contents", "faq");
		model.addAttribute("map", map);
		 
		return "admin/adminPage";
	}
	
	@GetMapping("/enrollForm/{enroll}") // enrollForm으로 이동
	public String adminEnrollForm(Model model, @PathVariable("enroll") String enroll,  @RequestParam int catUNo) {
		
			List<SubCategory> subCatList = adminService.subCatList(catUNo);
			
			model.addAttribute("boardName", enroll);
			model.addAttribute("catUNo", catUNo);
			model.addAttribute("subCatList", subCatList);
			model.addAttribute("contents", ".btn-write");
			
			return "admin/adminPage";
	}
	
	
	@PostMapping("/enrollForm/{enroll}") //insert
	public String adminEnrollFormInsert(Board b, HttpSession session, @PathVariable("enroll") String enroll) {
		
		int userNo = ((Member)session.getAttribute("loginUser")).getUserNo();
	
		b.setUserNo(userNo);
		String returnVal = "";
		String alert = "";
		
		int result = adminService.enrollInsert(b);
		
		if(result > 0) {
			
			alert = "등록되었습니다.";
			
			returnVal = "redirect:/admin/"+enroll+"?catSNo=0&currentPage=1";
		}else {
			alert = "등록에 실패하였습니다.";
			
			returnVal = "redirect:/admin/enrollForm/"+enroll;
		}
		
		session.setAttribute("alert", alert);
		
		return returnVal;
	}
	
	@GetMapping("/enrollForm/update/{enroll}") // enrollForm으로 이동
	public String adminUpdateEnrollForm(Model model, @PathVariable("enroll") String enroll,  @RequestParam int catUNo, @RequestParam int boardNo) {
		
			List<SubCategory> subCatList = adminService.subCatList(catUNo);
			
			Board b = adminService.enrollSelect(boardNo);
			
			model.addAttribute("b", b);
			model.addAttribute("boardName", enroll);
			model.addAttribute("catUNo", catUNo);
			model.addAttribute("subCatList", subCatList);
			model.addAttribute("contents", ".btn-write");
			
			return "admin/adminPage";
	}
	
	@PostMapping("/enrollForm/update/{enroll}") //update
	public String adminEnrollFormUpdate(Board b, HttpSession session, @PathVariable("enroll") String enroll) {
		
		int userNo = ((Member)session.getAttribute("loginUser")).getUserNo();
	
		b.setUserNo(userNo);
		String returnVal = "";
		String alert = "";
		
		System.out.println("post"+b);
		
		int result = adminService.enrollUpdate(b);
		
		if(result > 0) {
			
			alert = "수정되었습니다.";
			
			returnVal = "redirect:/admin/"+enroll+"?catSNo=0&currentPage=1";
		}else {
			alert = "수정에 실패하였습니다.";
			returnVal = "redirect:/admin/enrollForm/update/"+enroll;
		}
		
		session.setAttribute("alert", alert);
		
		return returnVal;
	}
	
	@GetMapping("/logout")
	public String logOut(SessionStatus status) {
		status.setComplete();
		return "redirect:/admin/login";
	}
	
	@ResponseBody
	@GetMapping("/getData")
	public String getData() {
		Map<String,Object> dataMap = new HashMap<String, Object>();
		adminService.getData(dataMap);
		return new Gson().toJson(dataMap);
	}

}
