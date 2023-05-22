package com.ace.thrifty.board.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class BoardController {

	@RequestMapping("/home")
	public String home() {
		return "boardTemplate";
	}

	@RequestMapping("/home/ptj")
	public String ptj() {
		return "part_time_job/PTJ";
	}
}
