package com.ace.thrifty.member.model.service;

import com.ace.thrifty.member.model.vo.Member;

public interface MemberService {
	public Member selectMember();

	public int insertMember(Member m);
	
	public Member loginMember(Member m);
	
	public Member selectById(String userId);
	
	public Member selectByEmail(String email);
	
	public Member selectByNickName(String nickName);
	
	public Member selectByKakaoId(String kakaoId);
}
