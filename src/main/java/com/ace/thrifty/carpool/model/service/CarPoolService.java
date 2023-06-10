package com.ace.thrifty.carpool.model.service;

import java.util.List;

import com.ace.thrifty.carpool.model.vo.CarPool;

public interface CarPoolService {
	
	public List<CarPool> driveList();
	
	public CarPool driveDetail(int boardNo);
	
}
