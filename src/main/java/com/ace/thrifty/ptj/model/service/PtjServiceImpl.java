package com.ace.thrifty.ptj.model.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ace.thrifty.ptj.model.dao.PtjDao;
import com.ace.thrifty.ptj.model.vo.Ptj;

@Service
public class PtjServiceImpl implements PtjService {
	
	@Autowired
	PtjDao ptjDao;
//	
//	@Override
//	public Ptj selectPtj() {
//		Ptj p = ptjDao.selectPtj();
//		return p;
//	}
	
	public Ptj selectPtjDetail(int boardNo) {
		
		return ptjDao.selectPtjDetail(boardNo);
		
	}
	
}
