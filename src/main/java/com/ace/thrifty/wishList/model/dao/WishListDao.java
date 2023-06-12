package com.ace.thrifty.wishList.model.dao;

import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ace.thrifty.wishList.model.vo.WishList;

@Repository
public class WishListDao {

	@Autowired
	SqlSession sqlSession;
	
	public int insertWishList(WishList wL) {
		return sqlSession.insert("wishListMapper.insertWishList", wL);
	}
	
	public WishList selectWishList(WishList wL) {
		return sqlSession.selectOne("wishListMapper.selectWishList", wL);
	}
	
	public int deleteWishList(WishList wL) {
		return sqlSession.delete("wishListMapper.deleteWishList" , wL);
	}
}
