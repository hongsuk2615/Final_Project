package com.ace.thrifty.usedProduct.model.dao;

import java.util.List;
import java.util.Map;

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

	public List<UsedProduct> selectUsedProduct(Map<String, Object> queryString) {
		
		
		return sqlSession.selectList("usedProductMapper.selectUsedProduct", queryString);
	}
	
	public UsedProduct selectUsedProductByBno(int bNo) {
		return sqlSession.selectOne("usedProductMapper.selectUsedProductByBno", bNo);
	}
}
