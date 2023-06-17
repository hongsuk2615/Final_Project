package com.ace.thrifty.faq.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ace.thrifty.board.model.vo.Board;

@Repository
public class FaqDao {

	@Autowired
	SqlSession sqlSession;

	public List<Map<String, String>> faqBoardList(int catUNo) {
		return sqlSession.selectList("faqMapper.faqBoardList", catUNo);
	}


}
