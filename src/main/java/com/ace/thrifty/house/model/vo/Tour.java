package com.ace.thrifty.house.model.vo;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class Tour {
	
	private int roomNo;
	private int userNo;
	private String moveIn;
	private String enquiry;
}
