package com.ace.thrifty.co_purchase.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class co_purchaseController {

//	@RequestMapping("/home")
//	public String home() {
//		return "boardTemplate";
//	}
	@RequestMapping("/main.co")
	public String usedProduct() {
		return "co_purchase/purchaseMain";
	}
}
