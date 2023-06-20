package com.ace.thrifty.admin.model.service;

import java.util.List;
import java.util.Map;

import com.ace.thrifty.board.model.vo.Board;
import com.ace.thrifty.board.model.vo.SubCategory;
import com.ace.thrifty.board.model.vo.UpperCategory;
import com.ace.thrifty.member.model.vo.Member;

public interface AdminService {

	Member loginAdmin(Member m);
	
	void memberList(Map<String, Object> map, Map<String, Object> paramMap);
	
	List<SubCategory> noticeSubCatList();
	
	List<SubCategory> faqSubCatList();
	
	void reportList(Map<String, Object> map, Map<String, Object> paramMap);
	
	void BoardList(Map<String, Object> map, Map<String, Object> paramMap);
	
	void noticeList(Map<String, Object> map, Map<String, Object> paramMap);
	
	void faqList(Map<String, Object> map, Map<String, Object> paramMap);
	
	Map<String, Integer> selectInfoBox();
	
	int StatusUpdate(String location, Map<String, Object> paramMap);
	
	int enrollInsert(Board b);
	
	int enrollUpdate(Board b);
	
	List<UpperCategory> upperCatList();
	
	List<SubCategory> subCatList(int catUNo);
	
	Board enrollSelect(int boardNo);
	
	public void getData(Map<String,Object> dataMap);

	List<Map<String, Object>> reportCountDetail(Map<String, Object> paramMap);
	
}
