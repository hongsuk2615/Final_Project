package com.ace.thrifty.board.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class BoardController {

	@RequestMapping("/home")
	public String home() {
		return "boardTemplate";
	}

	@RequestMapping("/home/ptjList")
	public String ptj() {
		return "part_time_job/PTJList";
	}
	
	@RequestMapping("/home/ptjMain")
	public String ptjMain() {
		return "part_time_job/PTJMain";
	}
	
	@RequestMapping("/home/ptjDetail")
	public String ptjDetail() {
		return "part_time_job/PTJDetail";
	}
	
	@RequestMapping("/home/ptjEnrollForm")
	public String ptjEnrollForm() {
		return "part_time_job/PTJEnrollForm";
	}
	
	@RequestMapping("/home/ptjUpdateForm")
	public String ptjUpdateForm() {
		return "part_time_job/PTJUpdateForm";
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
