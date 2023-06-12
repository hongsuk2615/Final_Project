package com.ace.thrifty.member.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ace.thrifty.member.model.dao.MemberDao;
import com.ace.thrifty.member.model.vo.Member;

@Service
public class MemberServiceImp implements MemberService{

	@Autowired
	MemberDao memberDao;
	
	@Override
	public Member selectMember() {
		
		return memberDao.selectMember();
	}

	@Override
	public int insertMember(Member m) {
		return memberDao.insertMember(m);
	}

	@Override
	public Member loginMember(Member m) {
		return memberDao.loginMember(m);
	}

	@Override
	public Member selectById(String userId) {
		return memberDao.selectById(userId);
	}

	@Override
	public Member selectByEmail(String email) {
		return memberDao.selectByEmail(email);
	}

	@Override
	public Member selectByNickName(String nickName) {
		return memberDao.selectByNickName(nickName);
	}

	@Override
	public Member selectByKakaoId(String kakaoId) {
		return memberDao.selectByKakaoId(kakaoId);
	}
	
	
	

}
