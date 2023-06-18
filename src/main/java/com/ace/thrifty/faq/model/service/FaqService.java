package com.ace.thrifty.faq.model.service;

import java.util.List;
import java.util.Map;

public interface FaqService {

	List<Map<String, String>> faqBoardList(int catUNo);

}
