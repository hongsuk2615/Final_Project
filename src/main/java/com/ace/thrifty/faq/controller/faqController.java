package com.ace.thrifty.faq.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ace.thrifty.faq.model.service.FaqService;

@Controller
@RequestMapping("/faq")
public class faqController {
	
	private FaqService faqService;
	
	@Autowired
	public faqController(FaqService faqService) {
		this.faqService = faqService;
	}
	
	@GetMapping("")
	public String faq() {
		return "faq/faq";
	}
	
	@GetMapping("/selectList")
	@ResponseBody
	public String faqSelectList() {
		
		
		
		return "";
	}
	

}
