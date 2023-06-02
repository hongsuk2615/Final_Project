package com.ace.thrifty.usedProduct.model.service;

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
import com.ace.thrifty.usedProduct.model.dao.UsedProductDao;
import com.ace.thrifty.usedProduct.model.vo.UsedProduct;

@Service
public class UsedProductServiceImp implements UsedProductService{

	@Autowired
	BoardDao boardDao;
	
	@Autowired
	UsedProductDao usedProductDao;
	
	@Transactional(rollbackFor = {Exception.class})
	@Override
	public int insertUsedProduct(Board b, UsedProduct uP, List<MultipartFile> imgList, String webPath, String serverFolderPath) throws Exception {
		boardDao.insertBoard(b);
		int boardNo = b.getBoardNo();
		int result = 0;
		if( boardNo > 0 ) {
			uP.setBoardNo(boardNo);
			System.out.println(uP);
			result = usedProductDao.insertUsedProduct(uP);
		}
		
		if(result>0 && imgList != null) {
			List<Image> imageList = new ArrayList();
			
			for(int i = 0; i < imgList.size(); i++) {
				if(imgList.get(i).getSize() > 0) {
					String changeName = Utils.saveFile(imgList.get(i), serverFolderPath);
					
					Image img = new Image();
					img.setBoardNo(boardNo);
					img.setFileLevel(i);
					img.setOriginName(imgList.get(i).getOriginalFilename());
					img.setChangeName(changeName);
					
					imageList.add(img);
				}
			}
			
			if(!imageList.isEmpty()) {
				result = boardDao.insertImageList(imageList);
				if(!(result == imageList.size())) {
					throw new Exception("이미지 등록 예외발생");
				}
			}
		}
		return boardNo;
	}

}
