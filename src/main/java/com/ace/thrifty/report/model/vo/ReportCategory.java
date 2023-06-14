package com.ace.thrifty.report.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.RequiredArgsConstructor;

@Data
@AllArgsConstructor
@RequiredArgsConstructor
public class ReportCategory {
	private int reportCategoryNo;
	private String reportCategoyName;
}
