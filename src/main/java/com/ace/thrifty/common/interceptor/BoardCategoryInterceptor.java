package com.ace.thrifty.common.interceptor;

import java.util.ArrayList;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.ace.thrifty.board.model.service.BoardService;
import com.ace.thrifty.board.model.vo.Location;
import com.ace.thrifty.board.model.vo.SubCategory;
import com.ace.thrifty.board.model.vo.UpperCategory;
import com.google.gson.Gson;


public class BoardCategoryInterceptor extends HandlerInterceptorAdapter{
	
	@Autowired
	private BoardService boardService;
	
	@Override // 전처리할 메서드 작성
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) {
		
		//application scope에 boardTypeList가 있는지 체크, 없을 경우 이를 조회하는 boardService메서드 호출후 결과를 세팅
		
		//application scope객체 얻어오기
		ServletContext application = request.getServletContext();
		
		if(application.getAttribute("upperCategoryList") == null) {
			ArrayList<UpperCategory> upperList = (ArrayList<UpperCategory>) boardService.selectUpperCategoryList();
			application.setAttribute("upperCategoryList", upperList);
			
		}
		
		if(application.getAttribute("locationList") == null) {
			ArrayList<Location> locationList = (ArrayList<Location>) boardService.selectLocationList();
			
			application.setAttribute("locationList", locationList);
		}
		
		
		if(application.getAttribute("subCategoryList") == null) {
		ArrayList<SubCategory> subList = (ArrayList<SubCategory>) boardService.selectSubCategoryList();
			request.setAttribute("subCategoryList", subList);
		}
		
		
		return true;
	}
	
	
	@Override 
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler, ModelAndView modelAndView) {
		
	
	}
	
	@Override
	public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex) {
		
		
	}
}
