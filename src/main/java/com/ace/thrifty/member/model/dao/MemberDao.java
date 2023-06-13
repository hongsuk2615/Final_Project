package com.ace.thrifty.member.model.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ace.thrifty.member.model.vo.Member;

@Repository
public class MemberDao {
	
	@Autowired
	SqlSession sqlSession;
	
	public Member selectMember() {
		return sqlSession.selectOne("memberMapper.selectMember");
	}
	
	public int insertMember(Member m) {
		return sqlSession.insert("memberMapper.insertMember", m);
	}
	
	public Member loginMember(Member m) {
		return sqlSession.selectOne("memberMapper.loginMember", m);
	}
	
	public Member selectById(String userId) {
		return sqlSession.selectOne("memberMapper.selectById", userId);
	}
	
	public Member selectByEmail(String email) {
		return sqlSession.selectOne("memberMapper.selectByEmail", email);
	}
	
	public Member selectByNickName(String nickName) {
		return sqlSession.selectOne("memberMapper.selectByNickName", nickName);
	}
	
	public Member selectByKakaoId(String kakaoId) {
		return sqlSession.selectOne("memberMapper.selectByKakaoId", kakaoId);
	}
	
	public String findId(Member member) {
		return sqlSession.selectOne("memberMapper.findId", member);
	}
	
	public Member findPwd(Member member) {
		return sqlSession.selectOne("memberMapper.findPwd", member);
	}
	
	public int changeRandomPwd(Member member) {
		return sqlSession.update("memberMapper.changeRandomPwd", member);
	}
}
