package com.ace.thrifty.wishList.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ace.thrifty.member.model.vo.Member;
import com.ace.thrifty.wishList.model.service.WishListService;
import com.ace.thrifty.wishList.model.vo.WishList;

@RequestMapping("/wishList")
@Controller
public class WishListController {
	
	@Autowired
	WishListService wishListService;
	// 0 : 로그인안돼있음
		// 1 : 성공
		// 2 : 실패
		@GetMapping("/insert")
		@ResponseBody
		public int insertWishList(int bNo, HttpSession session) {
			if (session.getAttribute("loginUser") == null) {
				return -1;
			} else {
				int uNo = ((Member) session.getAttribute("loginUser")).getUserNo();
				WishList wL = new WishList(bNo, uNo);
				WishList checkWl = wishListService.selectWishList(wL);
				System.out.println(checkWl);
				if (checkWl != null) {
					return 2;
				} else {
					return wishListService.insertWishList(wL);
				}
			}
		}
}
