package com.ace.thrifty.member.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ace.thrifty.member.model.dao.MemberDao;
import com.ace.thrifty.member.model.service.MemberService;
import com.ace.thrifty.member.model.vo.Member;

@Service
public class MemberServiceImp implements MemberService{

	@Autowired
	MemberDao memberDao;
	
	@Override
	public Member selectMember() {
		
		return memberDao.selectMember();
	}

}
