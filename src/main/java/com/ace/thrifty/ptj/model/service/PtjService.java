package com.ace.thrifty.ptj.model.service;

import java.util.ArrayList;
import java.util.List;

import com.ace.thrifty.ptj.model.vo.Ptj;

public interface PtjService {

	public Ptj selectPtjDetail(int boardNo);
	
	public List<Ptj> selectPtj(String categorySNo);
	
	public List<Ptj> selectPtjAll();
	
}
