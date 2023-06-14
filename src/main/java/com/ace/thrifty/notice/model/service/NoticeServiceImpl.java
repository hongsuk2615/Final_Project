package com.ace.thrifty.notice.model.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ace.thrifty.board.model.vo.Board;
import com.ace.thrifty.common.model.vo.PageInfo;
import com.ace.thrifty.common.template.Pagination;
import com.ace.thrifty.notice.model.dao.NoticeDao;

@Service
public class NoticeServiceImpl implements NoticeService{

	@Autowired
	private NoticeDao noticeDao;
	private Pagination pageination;
	
	public NoticeServiceImpl(NoticeDao noticeDao, Pagination pageination) {
		this.noticeDao = noticeDao;
		this.pageination = pageination;
	}
	
	@Override
	public List<Map<String, String>> noticeCatdList() {
		return noticeDao.noticeCatdList();
	}

	@Override
	public void noticeList(Map<String, Object> map, Map<String, Object> paramMap) {
		
		int listCount = noticeDao.selectNoticeListCount(paramMap);
		Integer currentPage = (Integer) paramMap.get("currentPage");
		int pageLimit = 5;
		int boardLimit = 10;
		
		PageInfo pi = pageination.getPageInfo(listCount, currentPage, pageLimit, boardLimit);
		
		List<Board> list = noticeDao.noticeList(pi, paramMap); 
		
		map.put("pi", pi);
		map.put("list", list);
	}

}
