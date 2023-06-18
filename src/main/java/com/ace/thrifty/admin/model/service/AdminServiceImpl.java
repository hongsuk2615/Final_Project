package com.ace.thrifty.admin.model.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ace.thrifty.admin.model.dao.AdminDao;
import com.ace.thrifty.notice.model.vo.Notice;
import com.ace.thrifty.board.model.vo.Board;
import com.ace.thrifty.board.model.vo.SubCategory;
import com.ace.thrifty.board.model.vo.UpperCategory;
import com.ace.thrifty.common.model.vo.PageInfo;
import com.ace.thrifty.common.template.Pagination;
import com.ace.thrifty.member.model.vo.Member;
import com.ace.thrifty.report.model.vo.Report;

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
			int result = adminDao.memberStatusUpdate(paramMap);
			return result;
		}else {
			return adminDao.boardStatusUpdate(paramMap);
		}
	}
	
	@Override
	public void reportList(Map<String, Object> map, Map<String, Object> paramMap) {
		
		int listCount = adminDao.selectReportListCount(paramMap);
		Integer currentPage = Integer.parseInt((String)paramMap.get("currentPage"));
		int pageLimit = 5;
		int boardLimit = 10;
		
		PageInfo pi = pageination.getPageInfo(listCount, currentPage, pageLimit, boardLimit);
		
		List<Report> list = adminDao.ReportList(pi, paramMap);
		
		map.put("pi", pi);
		map.put("list", list);
	}
	
	@Override
	public void BoardList(Map<String, Object> map, Map<String, Object> paramMap) {
		
		int listCount = adminDao.selectBoardListCount(paramMap);
		Integer currentPage = Integer.parseInt((String)paramMap.get("currentPage"));
		int pageLimit = 5;
		int boardLimit = 10;
		
		PageInfo pi = pageination.getPageInfo(listCount, currentPage, pageLimit, boardLimit);
		
		List<Board> list = adminDao.BoardList(pi, paramMap);
		
		map.put("pi", pi);
		map.put("list", list);
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
	public List<UpperCategory> upperCatList() {
		return adminDao.upperCatList();
	}
	
	@Override
	public List<SubCategory> noticeSubCatList() {
		return adminDao.noticeSubCatList();
	}


	@Override
	public List<SubCategory> faqSubCatList() {
		return adminDao.faqSubCatList();
	}


	@Override
	public int enrollInsert(Board b) {
		return adminDao.enrollInsert(b);
	}


	@Override
	public List<SubCategory> subCatList(int catUNo) {
		return adminDao.subCatList(catUNo);
	}


	@Override
	public Board enrollSelect(int boardNo) {
		return adminDao.enrollSelect(boardNo);
	}


	@Override
	public int enrollUpdate(Board b) {
		return adminDao.enrollUpdate(b);
	}


	@Override
	public void getData(Map<String, Object> dataMap) {
		List<Map<String,Object>>  dailyUser = adminDao.getDailyUser();
		List<Map<String,Object>> dailyBoard = adminDao.getDailyBoard();
		dataMap.put("dailyUser", dailyUser);
		dataMap.put("dailyBoard", dailyBoard);
		
	}









}
