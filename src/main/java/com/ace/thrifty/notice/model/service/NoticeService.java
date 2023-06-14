package com.ace.thrifty.notice.model.service;

import java.util.List;
import java.util.Map;

public interface NoticeService {

	List<Map<String, String>> noticeCatdList();

	void noticeList(Map<String, Object> map, Map<String, Object> paramMap);

}
