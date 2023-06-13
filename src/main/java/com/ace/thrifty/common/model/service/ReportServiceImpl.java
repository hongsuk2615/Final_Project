package com.ace.thrifty.common.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ace.thrifty.common.model.dao.ReportDao;
import com.ace.thrifty.common.model.vo.ReportCategory;

@Service
public class ReportServiceImpl implements ReportService{
	
	private ReportDao reportDao;
	
	@Autowired
	public ReportServiceImpl(ReportDao reportCategoryDao) {
		this.reportDao = reportCategoryDao;
	}
	
	@Override
	public List<Object> reportList() {
		return reportDao.reportList();
	}
}
