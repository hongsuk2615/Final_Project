package com.ace.thrifty.usedProduct.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ace.thrifty.usedProduct.model.service.UsedProductService;

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
	public String insertUsedProduct() {
		
		return "usedProduct/usedProduct";
	}
}
