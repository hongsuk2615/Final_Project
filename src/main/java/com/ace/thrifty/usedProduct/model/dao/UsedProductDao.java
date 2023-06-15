package com.ace.thrifty.usedProduct.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ace.thrifty.common.model.vo.PageInfo;
import com.ace.thrifty.usedProduct.model.vo.UsedProduct;

@Repository
public class UsedProductDao {
	
	@Autowired
	SqlSession sqlSession;
	
	public int insertUsedProduct(UsedProduct uP) {
		return sqlSession.insert("usedProductMapper.insertUsedProduct", uP);
	}
	
	public int selectUsedProductCount(Map<String, Object> queryString) {
		return sqlSession.selectOne("usedProductMapper.selectUsedProductCount", queryString);
	}

	public List<UsedProduct> selectUsedProduct(PageInfo pi, Map<String, Object> queryString) {
		int offset = (pi.getCurrentPage() - 1 ) * pi.getBoardLimit();
		int limit = pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, limit);		
		return sqlSession.selectList("usedProductMapper.selectUsedProduct", queryString, rowBounds);
	}
	
	public UsedProduct selectUsedProductByBno(int bNo) {
		return sqlSession.selectOne("usedProductMapper.selectUsedProductByBno", bNo);
	}
	
	public int modifyUsedProduct(UsedProduct uP) {
		return sqlSession.update("usedProductMapper.modifyUsedProduct", uP);
	}
	
	public List<UsedProduct> selectUpAll(){
		return sqlSession.selectList("usedProductMapper.selectUpAll");
		
	}
	
}
