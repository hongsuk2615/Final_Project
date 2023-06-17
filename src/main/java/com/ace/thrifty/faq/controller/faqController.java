package com.ace.thrifty.faq.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ace.thrifty.faq.model.service.FaqService;
import com.google.gson.Gson;

@Controller
@RequestMapping("/faq")
public class faqController {
	
	private FaqService faqService;
	
	@Autowired
	public faqController(FaqService faqService) {
		this.faqService = faqService;
	}
	
	@GetMapping("")
	public String faq(Model model) {
		
		return "faq/faq";
	}
	
	@GetMapping(value = "/selectList", produces = "application/text; charset=UTF-8")
	@ResponseBody
	public String faqSelectList(@RequestParam int catUNo) {
		
		List<Map<String, String>> faqBoardList = faqService.faqBoardList(catUNo);
		
		return new Gson().toJson(faqBoardList);
	}
	

}
