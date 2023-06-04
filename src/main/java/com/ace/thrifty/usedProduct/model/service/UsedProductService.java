package com.ace.thrifty.usedProduct.model.service;

import java.util.List;
import java.util.Map;

import org.springframework.web.multipart.MultipartFile;

import com.ace.thrifty.board.model.vo.Board;
import com.ace.thrifty.usedProduct.model.vo.UsedProduct;

public interface UsedProductService {
	public int insertUsedProduct(Board b, UsedProduct uP, List<MultipartFile> imgList, String webPath, String serverFolderPath) throws Exception;
	public List<UsedProduct> selectUsedProduct(Map<String, Object> queryString);
	public UsedProduct selectUsedProductByBno(int bNo);
}
