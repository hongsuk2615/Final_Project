package com.ace.thrifty.admin.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ace.thrifty.admin.model.vo.Notice;
import com.ace.thrifty.board.model.vo.SubCategory;
import com.ace.thrifty.common.model.vo.PageInfo;
import com.ace.thrifty.member.model.vo.Member;

@Repository
public class AdminDao {

	private SqlSession sqlSession;
	
	@Autowired
	public AdminDao(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}
	
	public Member loginAdmin(Member m) {
		return sqlSession.selectOne("adminMapper.loginAdmin", m);
	}
	
	public Map<String, Integer> selectInfoBox(){
		return sqlSession.selectOne("adminMapper.selectInfoBox");
	}
	
	public int selectMemberListCount(Map<String, Object> paramMap) {
		return sqlSession.selectOne("adminMapper.selectMemberListCount", paramMap);
	}
	
	public List<Member> memberList(PageInfo pi, Map<String, Object> paramMap) {
		
		int offset = (pi.getCurrentPage() -1) * pi.getBoardLimit();
		int limit = pi.getBoardLimit();
		
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		return sqlSession.selectList("adminMapper.memberList", paramMap, rowBounds);
	}
	
	public int memberStatusUpdate(Map<String, Object> paramMap) {
		return sqlSession.update("adminMapper.memberStatusUpdate", paramMap);
	}
	
	public List<Notice> noticeList(PageInfo pi, Map<String, Object> paramMap) {
		
		int offset = (pi.getCurrentPage() -1) * pi.getBoardLimit();
		int limit = pi.getBoardLimit();
		
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		return sqlSession.selectList("adminMapper.noticeList", paramMap, rowBounds);
	}
	
	public int selectNoticeListCount(Map<String, Object> paramMap) {
		return sqlSession.selectOne("adminMapper.selectNoticeListCount", paramMap);
	}
	
	public List<SubCategory> subCatList(){
		return sqlSession.selectList("adminMapper.subCatList");
	}

	
}
