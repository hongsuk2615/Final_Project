package com.ace.thrifty.wishList.model.service;

import com.ace.thrifty.wishList.model.vo.WishList;

public interface WishListService {
	
	public int insertWishList(WishList wL);
	public WishList selectWishList(WishList wL);
	public int deleteWishList(WishList wL);
}
