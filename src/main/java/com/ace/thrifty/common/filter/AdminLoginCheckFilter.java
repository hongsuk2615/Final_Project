package com.ace.thrifty.common.filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.ace.thrifty.member.model.vo.Member;

/**
 * Servlet Filter implementation class LoginCheckFilter
 * 
 * 관리자 로그인 없이 관리자 페이지로 이동하면 AdminLoginPage로 이동
 */
@WebFilter(urlPatterns = "/admin/*")
public class AdminLoginCheckFilter implements Filter {

	
	
    /**
     * Default constructor. 
     */
    public AdminLoginCheckFilter() {
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see Filter#destroy()
	 */
	public void destroy() {
		// TODO Auto-generated method stub
	}

	/**
	 * @see Filter#doFilter(ServletRequest, ServletResponse, FilterChain)
	 */
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
		
		String requestURI = ((HttpServletRequest)request).getRequestURI(); 
		String adminLoginURI = ((HttpServletRequest)request).getContextPath()+"/admin/login";

		HttpSession session = ((HttpServletRequest)request).getSession();
//		Member loginAdmin = (Member) session.getAttribute("loginAdmin");
		Member loginUser = (Member) session.getAttribute("loginUser");
		
		if(requestURI.equals(adminLoginURI)) {
			chain.doFilter(request, response);
			return;
		}else if(loginUser == null || loginUser.getAuthority() != 0 ){
			((HttpServletResponse)response).sendRedirect(adminLoginURI);
		}else {
			chain.doFilter(request, response);
		}
		

			
	}

	/**
	 * @see Filter#init(FilterConfig)
	 */
	public void init(FilterConfig fConfig) throws ServletException {
		// TODO Auto-generated method stub
	}

}
