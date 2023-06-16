package com.ace.thrifty.notice.model.service;

import java.util.List;
import java.util.Map;

import com.ace.thrifty.notice.model.vo.Notice;

public interface NoticeService {

	List<Map<String, String>> noticeCatdList();

	void noticeList(Map<String, Object> map, Map<String, Object> paramMap);

	Notice noticeDetail(int bNo);

}
