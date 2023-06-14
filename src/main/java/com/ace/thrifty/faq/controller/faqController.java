package com.ace.thrifty.faq.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ace.thrifty.board.model.vo.SubCategory;
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
	public String faq(Model model) {
		
		ArrayList<SubCategory> faqCatList = faqService.faqCatList();
		
		return "faq/faq";
	}
	
	@GetMapping("/selectList")
	@ResponseBody
	public String faqSelectList() {
		
		
		
		return "";
	}
	

}
