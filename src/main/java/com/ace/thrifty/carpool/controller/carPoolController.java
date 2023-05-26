package com.ace.thrifty.carpool.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class carPoolController {
	
	@RequestMapping("/home/carPoolMain")
	public String carPoolMain() {
		return "car_pool/carPoolMain";		
	}
	
	@RequestMapping("/home/carPool")
	public String carPool() {
		return "car_pool/carPool";
	}
	
}
