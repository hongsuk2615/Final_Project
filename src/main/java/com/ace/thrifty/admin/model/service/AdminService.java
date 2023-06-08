package com.ace.thrifty.admin.model.service;

import java.util.List;
import java.util.Map;

import com.ace.thrifty.board.model.vo.SubCategory;
import com.ace.thrifty.member.model.vo.Member;

public interface AdminService {

	Member loginAdmin(Member m);
	
	void memberList(Map<String, Object> map, Map<String, Object> paramMap);
	
	List<SubCategory> subCatList();
	
	void noticeList(Map<String, Object> map, Map<String, Object> paramMap);
	
	Map<String, Integer> selectInfoBox();
	
	int memberStatusUpdate(Map<String, Object> paramMap);
	
	
}
