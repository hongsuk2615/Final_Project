package com.ace.thrifty.admin.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ace.thrifty.notice.model.vo.Notice;
import com.ace.thrifty.board.model.vo.Board;
import com.ace.thrifty.board.model.vo.SubCategory;
import com.ace.thrifty.board.model.vo.UpperCategory;
import com.ace.thrifty.common.model.vo.PageInfo;
import com.ace.thrifty.member.model.vo.Member;
import com.ace.thrifty.report.model.vo.Report;

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
	
	public int selectReportListCount(Map<String, Object> paramMap) {
		return sqlSession.selectOne("adminMapper.selectReportListCount", paramMap);
	}
	
	public int selectBoardListCount(Map<String, Object> paramMap) {
		return sqlSession.selectOne("adminMapper.selectBoardListCount", paramMap);
	}

	
	public int selectNoticeListCount(Map<String, Object> paramMap) {
		return sqlSession.selectOne("adminMapper.selectNoticeListCount", paramMap);
	}
	
	
	public int selectFaqListCount(Map<String, Object> paramMap) {
		return sqlSession.selectOne("adminMapper.selectFaqListCount", paramMap);
	}
	
	
	public List<Member> memberList(PageInfo pi, Map<String, Object> paramMap) {
		
		int offset = (pi.getCurrentPage() -1) * pi.getBoardLimit();
		int limit = pi.getBoardLimit();
		
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		return sqlSession.selectList("adminMapper.memberList", paramMap, rowBounds);
	}
	
	public List<Report> ReportList(PageInfo pi, Map<String, Object> paramMap) {
		
		int offset = (pi.getCurrentPage() -1) * pi.getBoardLimit();
		int limit = pi.getBoardLimit();
		
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		return sqlSession.selectList("adminMapper.reportList", paramMap, rowBounds);
	}
	
	public List<Board> BoardList(PageInfo pi, Map<String, Object> paramMap) {
		
		int offset = (pi.getCurrentPage() -1) * pi.getBoardLimit();
		int limit = pi.getBoardLimit();
		
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		return sqlSession.selectList("adminMapper.boardList", paramMap, rowBounds);
	}

	
	public List<Notice> noticeList(PageInfo pi, Map<String, Object> paramMap) {
		
		int offset = (pi.getCurrentPage() -1) * pi.getBoardLimit();
		int limit = pi.getBoardLimit();
		
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		return sqlSession.selectList("adminMapper.noticeList", paramMap, rowBounds);
	}
	
	public List<Notice> faqList(PageInfo pi, Map<String, Object> paramMap) {
		
		int offset = (pi.getCurrentPage() -1) * pi.getBoardLimit();
		int limit = pi.getBoardLimit();
		
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		return sqlSession.selectList("adminMapper.faqList", paramMap, rowBounds);
	}
	
	public int memberStatusUpdate(Map<String, Object> paramMap) {
		return sqlSession.update("adminMapper.memberStatusUpdate", paramMap);
	}
	
	public int boardStatusUpdate(Map<String, Object> paramMap) {
		return sqlSession.update("adminMapper.boardStatusUpdate", paramMap);
	}
	
	public List<UpperCategory> upperCatList() {
		return sqlSession.selectList("adminMapper.upperCatList");
	}

	public List<SubCategory> noticeSubCatList(){
		return sqlSession.selectList("adminMapper.noticeSubCatList");
	}
	
	public List<SubCategory> faqSubCatList(){
		return sqlSession.selectList("adminMapper.faqSubCatList");
	}

	public int enrollInsert(Board b) {
		return sqlSession.insert("adminMapper.enrollInsert", b);
	}
	
	public int enrollUpdate(Board b) {
		return sqlSession.update("adminMapper.enrollUpdate", b);
	}
	
	public List<SubCategory> subCatList(int catUNo){
		return sqlSession.selectList("adminMapper.subCatList", catUNo);
	}
	
	public Board enrollSelect(int boardNo) {
		return sqlSession.selectOne("adminMapper.enrollSelect", boardNo);
	}

	public List<Map<String, Object>> getDailyUser(){
		return sqlSession.selectList("adminMapper.dailyUser");
	}

	public List<Map<String, Object>> getDailyBoard(){
		return sqlSession.selectList("adminMapper.dailyBoard");
	}

	public int todayLoginCount() {
		return sqlSession.insert("adminMapper.todayLoginCount");
	}

	public void todayLoginReset() {
		sqlSession.update("adminMapper.todayLoginReset");
	}

	public List<Map<String, Object>> reportCountDetail(int bNo) {
		return sqlSession.selectList("adminMapper.reportCountDetail", bNo);
	}





	
}
