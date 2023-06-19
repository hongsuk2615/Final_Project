package com.ace.thrifty.usedProduct.model.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import com.ace.thrifty.board.model.dao.BoardDao;
import com.ace.thrifty.board.model.vo.Board;
import com.ace.thrifty.board.model.vo.Image;
import com.ace.thrifty.common.Utils;
import com.ace.thrifty.common.model.vo.PageInfo;
import com.ace.thrifty.common.template.Pagination;
import com.ace.thrifty.usedProduct.model.dao.UsedProductDao;
import com.ace.thrifty.usedProduct.model.vo.UsedProduct;

@Service
public class UsedProductServiceImp implements UsedProductService {

	@Autowired
	BoardDao boardDao;

	@Autowired
	UsedProductDao usedProductDao;
	
	@Autowired
	private Pagination pagination;

	@Transactional(rollbackFor = { Exception.class })
	@Override
	public int insertUsedProduct(Board b, UsedProduct uP, List<MultipartFile> imgList, String webPath,
			String serverFolderPath) throws Exception {
		boardDao.insertBoard(b);
		int boardNo = b.getBoardNo();
		int result = 0;
		if (boardNo > 0) {
			uP.setBoardNo(boardNo);
			result = usedProductDao.insertUsedProduct(uP);
		}

		if (result > 0 && imgList != null) {
			List<Image> imageList = new ArrayList();

			for (int i = 0; i < imgList.size(); i++) {
				if (imgList.get(i).getSize() > 0) {
					String changeName = Utils.saveFile(imgList.get(i), serverFolderPath);

					Image img = new Image();
					img.setBoardNo(boardNo);
					img.setFileLevel(i);
					img.setOriginName(imgList.get(i).getOriginalFilename());
					img.setChangeName(changeName);

					imageList.add(img);
				}
			}

			if (!imageList.isEmpty()) {
				result = boardDao.insertImageList(imageList);
				if (!(result == imageList.size())) {
					throw new Exception("이미지 등록 예외발생");
				}
			}
		}
		return boardNo;
	}

	@Override
	public void selectUsedProduct(Map<String, Object> queryString) {
		int listCount = usedProductDao.selectUsedProductCount(queryString);
		int pageLimit = 10;
		int boardLimit = 8;
		PageInfo pi = pagination.getPageInfo(listCount, Integer.parseInt((String)(queryString.get("currPage"))), pageLimit, boardLimit);
		List<UsedProduct> list = usedProductDao.selectUsedProduct(pi, queryString);
		
		queryString.put("pi", pi);
		queryString.put("list", list);
	}

	@Override
	public UsedProduct selectUsedProductByBno(int bNo) {
		UsedProduct detail = usedProductDao.selectUsedProductByBno(bNo);
		if(detail != null) {
			boardDao.increaseReadCount(bNo);
			detail.getBoard().setReadCount(detail.getBoard().getReadCount()+1);
		}
		return detail;
	}

	@Override
	public int modifyUsedProduct(Board b, UsedProduct uP, List<MultipartFile> imgList, String webPath,
			String serverFolderPath, String removeImgList) throws Exception {
		int result = 0;
		result = boardDao.updateBoard(b);
		if (result > 0) {
			uP.setBoardNo(b.getBoardNo());
			result = usedProductDao.modifyUsedProduct(uP);
		}
		
		if(result > 0 && removeImgList.length() > 2 ) {
			result = boardDao.deleteImage(removeImgList);
		}

		if (result > 0 && imgList != null) {
			List<Image> imageList = new ArrayList();

			for (int i = 0; i < imgList.size(); i++) {
				if (imgList.get(i).getSize() > 0) {
					String changeName = Utils.saveFile(imgList.get(i), serverFolderPath);

					Image img = new Image();
					img.setBoardNo(b.getBoardNo());
					img.setFileLevel(i);
					img.setOriginName(imgList.get(i).getOriginalFilename());
					img.setChangeName(changeName);

					imageList.add(img);
				}
			}

			if (!imageList.isEmpty()) {
				result = boardDao.insertImageList(imageList);
				if (!(result == imageList.size())) {
					throw new Exception("이미지 등록 예외발생");
				}
			}
		}
		return result;
	}
	
	@Override 
	public List<UsedProduct> selectUpAll(){
		
		return usedProductDao.selectUpAll();
		
	}
	

	@Override
	public int soldOut(Board board) {
		return usedProductDao.soldOut(board);
	}

	@Override
	public int soldWaiting(Board board) {
		return usedProductDao.soldWaiting(board);
	}

}
