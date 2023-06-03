package com.ace.thrifty.admin.model.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ace.thrifty.admin.model.dao.AdminDao;
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
	public void memberList(Map<String, Object> map, Map<String, Object> paramMap) {
		
		int listCount = adminDao.selectMemberListCount(paramMap);
		Integer currentPage = Integer.parseInt((String)paramMap.get("currentPage"));
		int pageLimit = 5;
		int boardLimit = 10;
		
		PageInfo pi = pageination.getPageInfo(listCount, currentPage, pageLimit, boardLimit);
		
		List<Member> list = adminDao.memberList(pi, (String)paramMap.get("tab")); 
		
		map.put("pi", pi);
		map.put("list", list);
	}


	@Override
	public Map<String, Integer> selectInfoBox() {
		return adminDao.selectInfoBox();
	}


	@Override
	public List<Member> memberListAjax(String tab) {
		return adminDao.memberListAjax(tab);
	}

}
