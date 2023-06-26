package com.ace.thrifty.usedProduct.model.service;

import java.util.List;
import java.util.Map;

import org.springframework.web.multipart.MultipartFile;

import com.ace.thrifty.board.model.vo.Board;
import com.ace.thrifty.usedProduct.model.vo.UsedProduct;

public interface UsedProductService {
	public int insertUsedProduct(Board b, UsedProduct uP, List<MultipartFile> imgList, String webPath, String serverFolderPath) throws Exception;
	public int modifyUsedProduct(Board b, UsedProduct uP, List<MultipartFile> imgList, String webPath, String serverFolderPath, String removeImgList) throws Exception;
	public void selectUsedProduct(Map<String, Object> queryString);
	public UsedProduct selectUsedProductByBno(int bNo);
	public List<UsedProduct> selectUpAll();
	public int soldOut(Board board);
	public int soldWaiting(Board board);
}
