package com.ace.thrifty.carpool.model.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ace.thrifty.carpool.model.dao.CarPoolDao;
import com.ace.thrifty.carpool.model.vo.CarPool;
import com.ace.thrifty.common.model.vo.PageInfo;
import com.ace.thrifty.common.template.Pagination;
import com.ace.thrifty.ptj.model.vo.Ptj;

@Service
public class CarPoolServiceImpl implements CarPoolService {
	
	@Autowired
	CarPoolDao carPoolDao;
	
	@Autowired
	private Pagination pagination;
	
	@Override
	public void driveList(Map<String, Object> queryString) {
		int listCount = carPoolDao.selectDriveListCount(queryString);
		int pageLimit = 10;
		int boardLimit = 9;
		PageInfo pi = pagination.getPageInfo(listCount, Integer.parseInt((String)(queryString.get("currPage"))), pageLimit, boardLimit);
		List<CarPool> list = carPoolDao.selectDriveList(pi, queryString);
		
		queryString.put("pi", pi);
		queryString.put("list", list);
	}
	
	@Override
	public CarPool driveDetail(int boardNo) {
		return carPoolDao.driveDetail(boardNo);
	}
}
