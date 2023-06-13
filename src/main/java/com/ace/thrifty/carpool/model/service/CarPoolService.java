package com.ace.thrifty.carpool.model.service;

import java.util.List;
import java.util.Map;

import org.springframework.web.multipart.MultipartFile;

import com.ace.thrifty.board.model.vo.Board;
import com.ace.thrifty.carpool.model.vo.CarPool;

public interface CarPoolService {
	public void driveList(Map<String, Object> queryString);
	public CarPool driveDetail(int bNo);
	public int insertCarPool(CarPool c, Board b, List<MultipartFile> imgList, String webPath, String serverFolderPath) throws Exception;
	public int deadLine(Board b);
	public CarPool carPoolUpdateForm(int boardNo);
}
