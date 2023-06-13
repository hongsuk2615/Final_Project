package com.ace.thrifty.common.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ace.thrifty.common.model.service.ReportService;
import com.ace.thrifty.common.model.vo.ReportCategory;
import com.google.gson.Gson;


@Controller
@RequestMapping("/report")
public class ReportController {
	
	private ReportService reportService;
	
	@Autowired
	public ReportController(ReportService reportService) {
		this.reportService = reportService;
	}
	
	@GetMapping(value = "/list", produces = "application/text; charset=UTF-8")
	@ResponseBody
	public String reportList() {
		System.out.println("?");
		List<Object> list = reportService.reportList();
		System.out.println(list);
		
		return new Gson().toJson(list);
	}
}
