package com.ace.thrifty.usedProduct.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ace.thrifty.board.model.vo.Board;
import com.ace.thrifty.member.model.vo.Member;
import com.ace.thrifty.usedProduct.model.service.UsedProductService;
import com.ace.thrifty.usedProduct.model.vo.UsedProduct;

@Controller
@RequestMapping("/usedProduct")
public class UsedProductController {

	@Autowired
	UsedProductService usedProductService;

	
	
	@GetMapping("")
	public String usedProduct() {
		return "usedProduct/usedProduct";
	}
	
	@GetMapping("/detail")
	public String usedProductDetail() {
		return "usedProduct/usedProductDetail";
	}
	
	@GetMapping("/enroll")
	public String usedProductEnroll() {
		return "usedProduct/usedProductEnroll";
	}
	
	@PostMapping("/enroll")
	public String insertUsedProduct(HttpSession session, Board b, UsedProduct uP) {
		Member loginUser = (Member)session.getAttribute("loginUser");
		b.setCategoryUNo(4);
		b.setUserNo(loginUser.getUserNo());
		usedProductService.insertUsedProduct(b,uP);
		return "usedProduct/usedProduct";
	}
}
