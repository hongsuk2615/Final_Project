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
