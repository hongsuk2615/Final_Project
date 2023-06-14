package com.ace.thrifty.faq.model.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ace.thrifty.faq.model.dao.FaqDao;

@Service
public class FaqServiceImpl implements FaqService{

	private FaqDao faqDao;
	
	@Autowired
	public FaqServiceImpl(FaqDao faqDao) {
		this.faqDao = faqDao;
	}

	@Override
	public List<Map<String, String>> faqBoardList(int catUNo) {
		return faqDao.faqBoardList(catUNo);
	}
	

}
