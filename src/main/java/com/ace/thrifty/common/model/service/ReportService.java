package com.ace.thrifty.common.model.service;

import java.util.List;
import java.util.Map;

import com.ace.thrifty.common.model.vo.ReportCategory;


public interface ReportService {
	List<ReportCategory> reportList();
	
	int reportInsert(Map<String, Object> paramMap);
}

