package com.ace.thrifty.freeboard.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ace.thrifty.freeboard.model.service.FreeBoardService;

@Controller
@RequestMapping("/freeBoard")
public class FreeBoardController {

	private FreeBoardService freeBoardService;
	
	@Autowired
	public FreeBoardController(FreeBoardService freeBoardService) {
		this.freeBoardService = freeBoardService;
	}
	
	@GetMapping("")
	public String freeBoard() {
		
		return "freeBoard/freeBoard";
	}
}
