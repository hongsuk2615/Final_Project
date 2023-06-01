package com.ace.thrifty.usedProduct.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ace.thrifty.board.model.dao.BoardDao;
import com.ace.thrifty.board.model.vo.Board;
import com.ace.thrifty.usedProduct.model.dao.UsedProductDao;
import com.ace.thrifty.usedProduct.model.vo.UsedProduct;

@Service
public class UsedProductServiceImp implements UsedProductService{

	@Autowired
	BoardDao boardDao;
	
	@Autowired
	UsedProductDao usedProductDao;
	
	@Override
	public int insertUsedProduct(Board b, UsedProduct uP) {
		boardDao.insertBoard(b);
		int boardNo = b.getBoardNo();
		if( boardNo > 0 ) {
			uP.setBoardNo(boardNo);
			return usedProductDao.insertUsedProduct(uP);
		}
		return 0;
	}

}
