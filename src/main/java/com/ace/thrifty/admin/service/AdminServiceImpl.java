package com.ace.thrifty.admin.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ace.thrifty.admin.dao.AdminDao;
import com.ace.thrifty.member.model.vo.Member;

@Service
public class AdminServiceImpl implements AdminService{

	private AdminDao adminDao;
	
	@Autowired
	public AdminServiceImpl(AdminDao adminDao) {
		this.adminDao = adminDao;
	}
	
	
	@Override
	public Member loginAdmin(Member m) {
		return adminDao.loginAdmin(m);
	}

}
