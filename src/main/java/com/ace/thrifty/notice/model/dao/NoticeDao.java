package com.ace.thrifty.notice.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ace.thrifty.board.model.vo.Board;
import com.ace.thrifty.common.model.vo.PageInfo;
import com.ace.thrifty.notice.model.vo.Notice;

@Repository
public class NoticeDao {

	@Autowired
	SqlSession sqlSession;
	
	public List<Map<String, String>> noticeCatdList() {
		return sqlSession.selectList("noticeMapper.noticeCatdList");
	}

	public int selectNoticeListCount(Map<String, Object> paramMap) {
		return sqlSession.selectOne("noticeMapper.selectNoticeListCount", paramMap);
	}

	public List<Board> noticeList(PageInfo pi, Map<String, Object> paramMap) {
		
		int offset = (pi.getCurrentPage() -1) * pi.getBoardLimit();
		int limit = pi.getBoardLimit();
		
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		return sqlSession.selectList("noticeMapper.noticeList", paramMap, rowBounds);
	}

	public Notice noticeDetail(int bNo) {
		return sqlSession.selectOne("noticeMapper.noticeDetail", bNo);
	}

}
