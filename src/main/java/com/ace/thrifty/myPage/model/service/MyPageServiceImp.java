package com.ace.thrifty.myPage.model.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.ace.thrifty.board.model.dao.BoardDao;
import com.ace.thrifty.board.model.vo.Board;
import com.ace.thrifty.board.model.vo.Image;
import com.ace.thrifty.common.Utils;
import com.ace.thrifty.common.model.vo.PageInfo;
import com.ace.thrifty.common.template.Pagination;
import com.ace.thrifty.member.model.vo.Member;
import com.ace.thrifty.myPage.model.dao.MyPageDao;
import com.ace.thrifty.wishList.model.vo.WishList;

@Service
public class MyPageServiceImp  implements MyPageService{

	@Autowired
	BoardDao boardDao;
	
	@Autowired
	MyPageDao myPageDao;
	
	@Autowired
	Pagination pagination;
	
//	public String selectMyPage() {
//		
//		return myPageDao.selectMyPage();
//	}
	
	@Override
	public ArrayList<Board> selectBoardByUserNo(int userNo, String currentPage, Map map){
		
		
		int listCount = boardDao.selectMyCount(userNo);
		int pageLimit = 10;
		int boardLimit = 10;
		
		PageInfo pi =  pagination.getPageInfo(listCount, Integer.parseInt(currentPage), pageLimit, boardLimit);
		map.put("pi", pi);
		return boardDao.selectBoardByUserNo(userNo, pi);
		
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
	
		System.out.println(profileimage);
		String changeName = Utils.saveFile(profileimage , serverFolderPath);
		
		
		m.setOriginName(profileimage.getOriginalFilename());
		m.setChangeName(changeName);
		
		return myPageDao.changeProfile(m);
		
		
	}
	
	@Override
	public ArrayList<Board> zzimSelect(Member m, Board b) {
		
		
		return myPageDao.zzimSelect(m, b);
		
	}
	
	@Override
	public int selfban(Member m) {
		
		return myPageDao.selfban(m);
	}
	
	
//	@Override
//	public String zzimSelect(Member m, Board b) {
//		return myPageDao.zzimSelect(m, b);
//	}
	
}
