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
	public int changeProfile(Member m, MultipartFile profileimage, String webPath,
			String serverFolderPath) throws Exception {
	
		
		String changeName = Utils.saveFile(profileimage , serverFolderPath);
		
		
		m.setOriginName(profileimage.getOriginalFilename());
		m.setChangeName(changeName);
		return myPageDao.changeProfile(m);
		
	}
	
	
//	@Override
//	public String zzimSelect(Member m, Board b) {
//		return myPageDao.zzimSelect(m, b);
//	}
	
}
