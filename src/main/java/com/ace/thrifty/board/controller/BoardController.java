package com.ace.thrifty.board.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ace.thrifty.board.model.service.BoardService;
import com.ace.thrifty.board.model.vo.Board;

@Controller
public class BoardController {
	
	@Autowired
	BoardService boardService;
	
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
	
	@RequestMapping("/home/carPool")
	public String carPool() {
		return "car_pool/carPool";
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
	@RequestMapping("/test")
	public String test() {
		Board b = boardService.selectBoard();
		System.out.println(b);
		return "usedProduct/usedProductEnroll";
	}
}
