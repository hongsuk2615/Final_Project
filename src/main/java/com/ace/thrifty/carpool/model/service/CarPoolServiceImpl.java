package com.ace.thrifty.carpool.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ace.thrifty.carpool.model.dao.CarPoolDao;
import com.ace.thrifty.carpool.model.vo.CarPool;

@Service
public class CarPoolServiceImpl implements CarPoolService {
	
	@Autowired
	CarPoolDao carPoolDao;
	
	@Override
	public List<CarPool> driveList() {
		return carPoolDao.driveList();
	}
	
	@Override
	public CarPool driveDetail(int boardNo) {
		return carPoolDao.driveDetail(boardNo);
	}
}
