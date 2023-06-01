package com.ace.thrifty.usedProduct.model.service;

import com.ace.thrifty.board.model.vo.Board;
import com.ace.thrifty.usedProduct.model.vo.UsedProduct;

public interface UsedProductService {
	public int insertUsedProduct(Board b, UsedProduct uP);
}
