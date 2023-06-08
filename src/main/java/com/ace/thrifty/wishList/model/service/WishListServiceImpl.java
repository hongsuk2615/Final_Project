package com.ace.thrifty.wishList.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ace.thrifty.wishList.model.dao.WishListDao;
import com.ace.thrifty.wishList.model.vo.WishList;

@Service
public class WishListServiceImpl implements WishListService{

	@Autowired
	WishListDao wishListDao;
	
	@Override
	public int insertWishList(WishList wL) {
		return wishListDao.insertWishList(wL);
	}

	@Override
	public WishList selectWishList(WishList wL) {
		return wishListDao.selectWishList(wL);
	}
	
}
