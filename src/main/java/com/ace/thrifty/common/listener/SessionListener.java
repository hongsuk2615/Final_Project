package com.ace.thrifty.common.listener;

import javax.servlet.http.HttpSession;
import javax.servlet.http.HttpSessionEvent;
import javax.servlet.http.HttpSessionListener;

import org.springframework.beans.factory.annotation.Autowired;

import com.ace.thrifty.member.model.service.MemberService;
import com.ace.thrifty.member.model.vo.Member;


public class SessionListener implements HttpSessionListener{

	
	@Autowired
	private MemberService memberService;
	
	@Override
	public void sessionDestroyed(HttpSessionEvent se) {
		
		System.out.println("test");
		
		HttpSession session = se.getSession();
		
		Member member = (Member)session.getAttribute("loginUser");
		System.out.println(member);
		
//		memberService.currentLogout(member.getUserNo());
		
		
		HttpSessionListener.super.sessionDestroyed(se);
	}
}
