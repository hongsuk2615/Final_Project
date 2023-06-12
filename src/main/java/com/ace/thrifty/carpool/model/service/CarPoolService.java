package com.ace.thrifty.carpool.model.service;

import java.util.List;
import java.util.Map;

import com.ace.thrifty.carpool.model.vo.CarPool;

public interface CarPoolService {
	
	public void driveList(Map<String, Object> queryString);
	
	public CarPool driveDetail(int boardNo);
	
}
