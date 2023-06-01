package com.ace.thrifty.usedProduct.model.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ace.thrifty.usedProduct.model.vo.UsedProduct;

@Repository
public class UsedProductDao {
	
	@Autowired
	SqlSession sqlSession;
	
	public int insertUsedProduct(UsedProduct uP) {
		return sqlSession.insert("usedProductMapper.insertUsedProduct", uP);
	}
}
