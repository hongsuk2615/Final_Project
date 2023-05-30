package com.ace.thrifty.co_purchase.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ace.thrifty.board.model.vo.Board;
import com.ace.thrifty.co_purchase.model.dao.Co_purchaseDao;

@Service
public class Co_purchaseServiceImpl implements Co_purchaseService{

	@Autowired
	Co_purchaseDao coDao;

	@Override
	public int insertBoard(Board b) {
		int result = coDao.insertBoard(b);
		return result;
	}
}
