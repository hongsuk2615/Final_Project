package com.ace.thrifty.common.listener;

import javax.servlet.http.HttpSession;
import javax.servlet.http.HttpSessionEvent;
import javax.servlet.http.HttpSessionListener;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.context.WebApplicationContext;
import org.springframework.web.context.support.WebApplicationContextUtils;
import org.springframework.web.servlet.FrameworkServlet;

import com.ace.thrifty.admin.model.dao.AdminDao;
import com.ace.thrifty.member.model.service.MemberService;
import com.ace.thrifty.member.model.vo.Member;

@Component
public class SessionListener implements HttpSessionListener{

	@Override
	public void sessionCreated(HttpSessionEvent se) {
		
		HttpSessionListener.super.sessionCreated(se);
	}
	
	@Override
	public void sessionDestroyed(HttpSessionEvent se) {
		
		MemberService memberSerivce = getMemberService(se);
		HttpSession session = se.getSession();
		int userNo = ((Member)session.getAttribute("loginUser")).getUserNo();
		
		memberSerivce.currentLogout(userNo);
		
		HttpSessionListener.super.sessionDestroyed(se);
	}
	
	// 아니 web.xml에 등록된 클래스는 spring에서 관리되지 않기에 bean으로 등록이 안되고 @Autowired로도 적용되지 않다고 합니다. 그래서 직접 가져왔어요
	// https://stackoverflow.com/questions/20476760/dependency-injection-inside-of-httpsessionlistener-implementation
	// https://okky.kr/questions/157770
	// 참고링크
	private MemberService getMemberService(HttpSessionEvent se) {
		WebApplicationContext context = WebApplicationContextUtils.getWebApplicationContext(se.getSession().getServletContext(), FrameworkServlet.SERVLET_CONTEXT_PREFIX+"appServlet");
		
		return (MemberService) context.getBean(MemberService.class);
	}
}
