package com.ace.thrifty.co_purchase.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/co_purchase")
public class co_purchaseController {

	@GetMapping("")
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
}
