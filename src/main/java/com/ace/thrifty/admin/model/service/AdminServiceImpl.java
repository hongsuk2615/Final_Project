package com.ace.thrifty.admin.model.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ace.thrifty.admin.model.dao.AdminDao;
import com.ace.thrifty.admin.model.vo.Notice;
import com.ace.thrifty.board.model.vo.SubCategory;
import com.ace.thrifty.common.model.vo.PageInfo;
import com.ace.thrifty.common.template.Pagination;
import com.ace.thrifty.member.model.vo.Member;

@Service
public class AdminServiceImpl implements AdminService{

	private AdminDao adminDao;
	private Pagination pageination;
	
	@Autowired
	public AdminServiceImpl(AdminDao adminDao, Pagination pageination) {
		this.adminDao = adminDao;
		this.pageination = pageination;
	}
	
	
	@Override
	public Member loginAdmin(Member m) {
		return adminDao.loginAdmin(m);
	}

	@Override
	public Map<String, Integer> selectInfoBox() {
		return adminDao.selectInfoBox();
	}

	@Override
	public void memberList(Map<String, Object> map, Map<String, Object> paramMap) {
		
		int listCount = adminDao.selectMemberListCount(paramMap);
		Integer currentPage = Integer.parseInt((String)paramMap.get("currentPage"));
		int pageLimit = 5;
		int boardLimit = 10;
		
		PageInfo pi = pageination.getPageInfo(listCount, currentPage, pageLimit, boardLimit);
		
		List<Member> list = adminDao.memberList(pi, paramMap); 
		
		map.put("pi", pi);
		map.put("list", list);
	}
	
	@Override
	public int StatusUpdate(String location, Map<String, Object> paramMap) {
		
		if(location.equals("member")) {
			return adminDao.memberStatusUpdate(paramMap);
		}else {
			return adminDao.boardStatusUpdate(paramMap);
		}
	}

	@Override
	public void noticeList(Map<String, Object> map, Map<String, Object> paramMap) {
		
		int listCount = adminDao.selectNoticeListCount(paramMap);
		Integer currentPage = Integer.parseInt((String)paramMap.get("currentPage"));
		int pageLimit = 5;
		int boardLimit = 10;
		
		PageInfo pi = pageination.getPageInfo(listCount, currentPage, pageLimit, boardLimit);
		
		List<Notice> list = adminDao.noticeList(pi, paramMap); 
		
		map.put("pi", pi);
		map.put("list", list);
	}
	
	@Override
	public void faqList(Map<String, Object> map, Map<String, Object> paramMap) {
		int listCount = adminDao.selectFaqListCount(paramMap);
		Integer currentPage = Integer.parseInt((String)paramMap.get("currentPage"));
		int pageLimit = 5;
		int boardLimit = 10;
		
		PageInfo pi = pageination.getPageInfo(listCount, currentPage, pageLimit, boardLimit);
		
		List<Notice> list = adminDao.faqList(pi, paramMap); 
		
		map.put("pi", pi);
		map.put("list", list);
	}


	@Override
	public List<SubCategory> noticeSubCatList() {
		return adminDao.noticeSubCatList();
	}


	@Override
	public List<SubCategory> faqSubCatList() {
		return adminDao.faqSubCatList();
	}

}
