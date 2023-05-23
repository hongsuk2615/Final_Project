package com.ace.thrifty.board.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class BoardController {

	@RequestMapping("/home")
	public String home() {
		return "boardTemplate";
	}
	
	@RequestMapping("/usedProduct")
	public String usedProduct() {
		return "usedProduct/usedProduct";
	}
	
	@RequestMapping("/usedProductDetail")
	public String usedProductDetail() {
		return "usedProduct/usedProductDetail";
	}
	
	@RequestMapping("/usedProductEnroll")
	public String usedProductEnroll() {
		return "usedProduct/usedProductEnroll";
	}
}
