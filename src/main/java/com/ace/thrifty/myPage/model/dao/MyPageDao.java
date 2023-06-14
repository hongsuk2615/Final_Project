package com.ace.thrifty.myPage.model.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ace.thrifty.board.model.vo.Board;
import com.ace.thrifty.member.model.vo.Member;


@Repository
public class MyPageDao {

	@Autowired
	SqlSession sqlSession;
	
	public String selectMyPage() {
		
		return sqlSession.selectOne("mypageMapper.selectMyPage");
	}
	
	public int myPageUpdate(Member m) {
		
		return sqlSession.update("memberMapper.myPageUpdate", m);
	}
	
	public Member myPageUpdateSelectM(Member m) {
		
		return sqlSession.selectOne("memberMapper.myPageUpdateSelectM", m);
	}
	
	public int changeProfile(Member m) {
		return sqlSession.update("memberMapper.changeProfile", m);
	}
	
	public ArrayList<Board> zzimSelect(Member m , Board b) {
		return (ArrayList)sqlSession.selectList("wishListMapper.zzimSelect", m);
	}
	
	public int selfban (Member m) {
		return sqlSession.update("memberMapper.selfban", m);
	}
	
}
