package com.ace.thrifty.member.model.service;

import com.ace.thrifty.member.model.vo.Member;

public interface MemberService {
	public Member selectMember();

	public int insertMember(Member m);
	
	public Member loginMember(Member m);
}
