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
	
	@RequestMapping("/home/carPoolDriveList")
	public String carPoolDriveList() {
		return "car_pool/carPoolDriveList";
	}
	
	@RequestMapping("/home/carPoolOccupantList")
	public String carPoolOccupantList() {
		return "car_pool/carPoolOccupantList";
	}
	
	@RequestMapping("/home/carPoolDetail")
	public String carPoolDetail() {
		return "car_pool/carPoolDetail";
	}
	
}
