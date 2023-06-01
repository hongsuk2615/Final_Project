package com.ace.thrifty.usedProduct.model.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class UsedProductDao {
	
	@Autowired
	SqlSession sqlSession;
}
