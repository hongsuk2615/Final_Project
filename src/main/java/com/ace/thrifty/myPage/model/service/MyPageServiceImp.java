package com.ace.thrifty.myPage.model.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.ace.thrifty.board.model.dao.BoardDao;
import com.ace.thrifty.board.model.vo.Board;
import com.ace.thrifty.board.model.vo.Image;
import com.ace.thrifty.common.Utils;
import com.ace.thrifty.member.model.vo.Member;
import com.ace.thrifty.myPage.model.dao.MyPageDao;

@Service
public class MyPageServiceImp  implements MyPageService{

	@Autowired
	BoardDao boardDao;
	
	@Autowired
	MyPageDao myPageDao;
	
	
	
//	public String selectMyPage() {
//		
//		return myPageDao.selectMyPage();
//	}
	
	@Override
	public ArrayList<Board> selectBoardByUserNo(int userNo){
		return boardDao.selectBoardByUserNo(userNo);
	}
	
	@Override
	public int myPageUpdate(Member m) {
		return myPageDao.myPageUpdate(m);
	}
	
	
	@Override
	public Member myPageUpdateSelectM(Member m) {
		return myPageDao.myPageUpdateSelectM(m);
	}
	
	@Override
	public int insertProfile(Member m,List<MultipartFile> imgList, String webPath,
			String serverFolderPath) throws Exception {
		int result = 0;
		List<Image>imageList = new ArrayList();
		
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
	
	
	@Override
	public String zzimSelect(Member m, Board b) {
		return myPageDao.zzimSelect(m, b);
	}
	
}
