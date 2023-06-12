package com.ace.thrifty.carpool.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.ace.thrifty.carpool.model.service.CarPoolService;
import com.ace.thrifty.carpool.model.vo.CarPool;

@Controller
@RequestMapping("/carPool")
public class CarPoolController {
	
	@Autowired
	public CarPoolService carPoolService;
	
	@GetMapping("")
	public String carPoolMain() {
		return "car_pool/carPoolMain";
	}
	
	@RequestMapping("/drive")
	public String driveList(Model model , @RequestParam Map<String, Object> queryString) {
		if(!queryString.containsKey("currPage")) {
			queryString.put("currPage", "1");
		}
		carPoolService.driveList(queryString);
		if(queryString.containsKey("lNo")) {
			model.addAttribute("lNo", queryString.get("lNo"));			
		}
		model.addAttribute("filter", queryString.get("filter"));
		model.addAttribute("list", queryString.get("list"));
		model.addAttribute("pi", queryString.get("pi"));
		
		return "car_pool/carPoolDriveList";
	}
	
	@GetMapping("/detail")
	public String driveDetail(Model model , @RequestParam(value="boardNo" , required = false)int boardNo ) {
		CarPool c = carPoolService.driveDetail(boardNo);
		model.addAttribute("c" , c);
		String webPath = "/resources/upfiles/carPool/";
		model.addAttribute("webPath" , webPath);
		return "car_pool/carPoolDetail";
	}
	
//	
//	@RequestMapping("/home/carPoolDetail")
//	public String carPoolDetail() {
//		return "car_pool/carPoolDetail";
//	}
//	
	@PostMapping("/enroll")
	public String EnrollForm() {
		return "car_pool/carPoolEnrollForm";
	}
	
}
