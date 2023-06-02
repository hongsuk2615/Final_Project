package com.ace.thrifty.co_purchase.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.ace.thrifty.board.model.vo.Board;
import com.ace.thrifty.board.model.vo.Image;
import com.ace.thrifty.co_purchase.model.service.Co_purchaseService;
import com.ace.thrifty.co_purchase.model.vo.Co_purchase;
import com.ace.thrifty.member.model.vo.Member;

@Controller
@RequestMapping("/co_purchase")
@SessionAttributes({"loginUser"})
public class co_purchaseController {
	
	@Autowired
	private Co_purchaseService coService;

	@GetMapping(value={"", "/main"})
	public String usedProduct( 
							@RequestParam(value = "cpage", defaultValue = "1") int currentPage,
							Model model,
							Board b,
							@RequestParam Map<String, Object> paramMap,
							HttpServletRequest req) {
//		if(categoryPath == null) {
		System.out.println(req.getServletPath());
//		}
		
		Map<String, Object> map = new HashMap();
		
		//coService.selectBoardList(currentPage, categoryPath, map);
		
		model.addAttribute("map", map);
		
		return "co_purchase/purchaseMain";
	}
	
	@GetMapping("/enroll")
	public String selectEnroll() {
		return "co_purchase/purchaseEnrollForm";
	}
	
	@GetMapping("/detail")
	public String selectDetail() {
		return "co_purchase/purchaseDetail";
	}
	
	@PostMapping("/insert")
	public String insertBoard(
						HttpSession session,
						Board b
						) {
		Member loginUser = (Member)session.getAttribute("loginUser");
		b.setCategoryUNo(6);
		b.setUserNo(loginUser.getUserNo());
		String webPath = "/resources/upfiles/co_purchase/";
		
		int result = coService.insertBoard(b, webPath);
		System.out.println(b);
		return "co_purchase";
	}
	
}
