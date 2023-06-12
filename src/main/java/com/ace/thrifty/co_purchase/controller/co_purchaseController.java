package com.ace.thrifty.co_purchase.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
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
import org.springframework.web.multipart.MultipartFile;

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

	// 게시글 목록 조회
	@GetMapping("")
	public String selectCoPurchaseList( 
							@RequestParam(value = "cpage", defaultValue = "1") int currentPage,
							Model model,
							Board b,
							@RequestParam Map<String, Object> paramMap,
							HttpServletRequest req) {
		System.out.println(req.getServletPath());
		
		String categoryPath = "co_purchase";
		Map<String, Object> map = new HashMap();
		
		coService.selectCoPurchaseList(currentPage, map);
		
		model.addAttribute("map", map);
		
		return "co_purchase/purchaseMain";
	}
	
	@GetMapping("/enroll")
	public String selectEnroll() {
		return "co_purchase/purchaseEnrollForm";
	}
	
	// 게시글 상세 조회
	@GetMapping("/detail")
	public String selectDetail(int bNo, Model model) {
		Co_purchase co = coService.selectCoPurchase(bNo);
		System.out.println(bNo);
		
		if(co != null) {
			model.addAttribute("co_purchase", co);
			model.addAttribute("board", co.getBoard());
			model.addAttribute("imageList", co.getImageList());
			model.addAttribute("seller", co.getSeller());
			
			return "co_purchase/purchaseDetail";
		}else {
			return "redirect:/thrifty/co_purchase";
		}
	}
	
	
	// 게시글 삽입
	@PostMapping("/insert")
	public String insertBoard(
						HttpSession session,
						Board b,
						Co_purchase cp,
						@RequestParam(value = "image", required = false ) List<MultipartFile> imgList
						) throws Exception {
		Member loginUser = (Member)session.getAttribute("loginUser");
		b.setCategoryUNo(6);
		b.setUserNo(loginUser.getUserNo());
		String webPath = "/resources/upfiles/co_purchase/";
		String serverFolderPath = session.getServletContext().getRealPath(webPath);
		System.out.println(cp);
		System.out.println(b);
		
		coService.insertBoard(b, cp, imgList, webPath, serverFolderPath);
		
		return "redirect:/co_purchase";
	}

}
