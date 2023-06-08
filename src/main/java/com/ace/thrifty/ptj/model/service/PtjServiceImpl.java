package com.ace.thrifty.ptj.model.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import com.ace.thrifty.board.model.dao.BoardDao;
import com.ace.thrifty.board.model.vo.Board;
import com.ace.thrifty.board.model.vo.Image;
import com.ace.thrifty.common.Utils;
import com.ace.thrifty.ptj.model.dao.PtjDao;
import com.ace.thrifty.ptj.model.vo.Ptj;

@Service
public class PtjServiceImpl implements PtjService {
	
	@Autowired
	PtjDao ptjDao;
	
	@Autowired
	BoardDao boardDao;
//	
//	@Override
//	public Ptj selectPtj() {
//		Ptj p = ptjDao.selectPtj();
//		return p;
//	}
	
	public Ptj selectPtjDetail(int boardNo) {
		
		return ptjDao.selectPtjDetail(boardNo);
		
	}
	
	public List<Ptj> selectPtj(String categorySNo) {
		
		return ptjDao.selectPtj(categorySNo);
	}
	
	public List<Ptj> selectPtjAll() {
		
		return ptjDao.selectPtjAll();
		
	}
	
	@Transactional(rollbackFor = {Exception.class})
	@Override
	public int insertPtj(Board b , Ptj p , List<MultipartFile> image, String webPath, String serverFolderPath) throws Exception {
		boardDao.insertBoard(b);
		int boardNo = b.getBoardNo();
		int result = 0;
		if(boardNo > 0 && image != null) {
			p.setBoardNo(boardNo);
			result = ptjDao.insertPtj(p);
		}
		System.out.println(boardNo);
		
		if(result > 0 && image != null) {
			List<Image> imageList = new ArrayList();
			
			for(int i = 0; i < image.size(); i++) {
				if(image.get(i).getSize() > 0 ) {
					String changeName = Utils.saveFile(image.get(i) , serverFolderPath);
					
					Image img = new Image();
					img.setBoardNo(boardNo);
					img.setFileLevel(0);
					img.setOriginName(image.get(i).getOriginalFilename());
					img.setChangeName(changeName);
					
					imageList.add(img);
				}
			}			
			
//			System.out.println(imageList);
			
			if(!imageList.isEmpty()) {
				result = boardDao.insertImageList(imageList);
				if(!(result == imageList.size())) {
					throw new Exception("이미지 등록 예외발생");
				}
			}
			
		}
		return boardNo;
	}
	
	public int deletePtj(int boardNo) {
		
		return ptjDao.deletePtj(boardNo);
		
	}
	
	public Ptj updateFormPtj(int boardNo) {
		return ptjDao.updateFormPtj(boardNo);
	}
	
	public int updatePtj(Ptj p) {
		return ptjDao.updatePtj(p);
		
	}
	
}
