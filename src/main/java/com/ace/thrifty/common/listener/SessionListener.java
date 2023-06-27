package com.ace.thrifty.common.listener;

import javax.servlet.http.HttpSession;
import javax.servlet.http.HttpSessionEvent;
import javax.servlet.http.HttpSessionListener;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.ace.thrifty.admin.model.dao.AdminDao;
import com.ace.thrifty.member.model.service.MemberService;
import com.ace.thrifty.member.model.vo.Member;

@Component
public class SessionListener implements HttpSessionListener{

	
	@Autowired
	private MemberService memberService;
	
	@Autowired
	private AdminDao adminDao;
	
	@Override
	public void sessionDestroyed(HttpSessionEvent se) {
		
		System.out.println("test");
		
		HttpSession session = se.getSession();
		
		int userNo = ((Member)session.getAttribute("loginUser")).getUserNo();
		System.out.println(userNo);
		System.out.println(adminDao);
		
		System.out.println(memberService); 
		
		
		HttpSessionListener.super.sessionDestroyed(se);
	}
}
