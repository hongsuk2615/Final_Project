package com.ace.thrifty.co_purchase.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ace.thrifty.board.model.vo.Board;
import com.ace.thrifty.board.model.vo.Image;
import com.ace.thrifty.co_purchase.model.service.Co_purchaseService;

@Controller
@RequestMapping("/co_purchase")
public class co_purchaseController {
	
	@Autowired
	private Co_purchaseService coService;

	@GetMapping(value = {"", "/main"})
	public String usedProduct() {
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
						// @PathVariable("boardNo") String boardNo,
						// Image img,
						Board b
						) {
		
		int result = coService.insertBoard(b);
		System.out.println(b);
		return "";
	}
	
}
