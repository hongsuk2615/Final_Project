package com.ace.thrifty.report.model.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ace.thrifty.report.model.dao.ReportDao;
import com.ace.thrifty.report.model.vo.ReportCategory;


@Service
public class ReportServiceImpl implements ReportService{
	
	private ReportDao reportDao;
	
	@Autowired
	public ReportServiceImpl(ReportDao reportCategoryDao) {
		this.reportDao = reportCategoryDao;
	}
	
	@Override
	public List<ReportCategory> reportList() {
		return reportDao.reportList();
	}

	@Override
	public int reportInsert(Map<String, Object> paramMap) {
		
		
		if(paramMap. containsValue("")) {
			return -2; //잘못된 리폿카테고리 번호
		}
		int result2 = 0;
		int result1 = reportDao.reportInsert(paramMap);
		if(result1 > 0) {
			result2 = reportDao.reportCount(paramMap);
		}
		
		return result1*result2;
	}
}
