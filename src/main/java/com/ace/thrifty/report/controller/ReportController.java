package com.ace.thrifty.report.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ace.thrifty.member.model.vo.Member;
import com.ace.thrifty.report.model.service.ReportService;
import com.ace.thrifty.report.model.vo.ReportCategory;
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
		List<ReportCategory> list = reportService.reportList();

		return new Gson().toJson(list);
	}

	@GetMapping(value = "/insert", produces = "application/text; charset=UTF-8")
	@ResponseBody
	public String reportInsert(HttpSession session, @RequestParam Map<String, Object> paramMap) {

		String resultStr = "";
		int result = 0;

		if (session.getAttribute("loginUser") == null) {
			resultStr = "-1";
		} else if (!paramMap.containsKey("reportCategoryNo") || ((String)paramMap.get("reportCategoryNo")).equals("") || paramMap.get("reportCategoryNo")== null) {
		
			resultStr ="3";
		}

		else {
			paramMap.put("userNo", ((Member) session.getAttribute("loginUser")).getUserNo());

			System.out.println(paramMap);
			result = reportService.reportInsert(paramMap);

			if (result > 0) {
				resultStr = "1";
			} else {
				resultStr = "2";
			}

		}

		return resultStr;
	}
}
