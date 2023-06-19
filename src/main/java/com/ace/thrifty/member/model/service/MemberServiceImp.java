package com.ace.thrifty.member.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import com.ace.thrifty.common.Utils;
import com.ace.thrifty.member.model.dao.MemberDao;
import com.ace.thrifty.member.model.vo.Member;

@Service
public class MemberServiceImp implements MemberService{

	@Autowired
	MemberDao memberDao;
	
	@Autowired
	private BCryptPasswordEncoder bcryptPasswordEncoder;
	
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

	@Override
	public String findId(Member member) {
		return memberDao.findId(member);
	}

	@Override
	public String findPwd(Member member) {
		String result ="";
		if(memberDao.findPwd(member) != null) {
			String changePwd = Utils.getRamdomPassword(13);
			System.out.println(changePwd);
			Utils.sendNewPwd(member.getEmail(), changePwd);
			member.setUserPwd(bcryptPasswordEncoder.encode(changePwd));
			if(memberDao.changeRandomPwd(member)>0) {
				result = member.getEmail();				
			};
		}
		return result;
	}

	@Override
	public int todayLogin(int userNo) {
		return memberDao.todayLogin(userNo);
	}

	@Override
	public int currentLogOut(int userNo) {
		return memberDao.currentLogOut(userNo);
	}
	
	
	

}
