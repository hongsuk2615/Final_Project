package com.ace.thrifty.admin.model.service;

import java.util.List;

import com.ace.thrifty.member.model.vo.Member;

public interface AdminService {

	Member loginAdmin(Member m);
	
	List<Member> memberList();
}
