package com.ace.thrifty.board.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class UpperCategory {
	
	private int categoryUNo;
	private String categoryUName;
	private String categoryPath;

}
