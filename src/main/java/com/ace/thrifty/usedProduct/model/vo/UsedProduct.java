package com.ace.thrifty.usedProduct.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class UsedProduct {
	private int boardNo;
	private int price;
	private String tradeMethod;
	private String isSoldOut;
	private int locationNo;
}
