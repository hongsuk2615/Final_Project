package com.ace.thrifty.myPage.model.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import com.ace.thrifty.board.model.vo.Board;
import com.ace.thrifty.member.model.vo.Member;
import com.ace.thrifty.wishList.model.vo.WishList;

public interface MyPageService {
//	public String selectMyPage();
	
	public ArrayList<Board> selectBoardByUserNo(int userNo);

	
	public int myPageUpdate (Member m);
	
	public Member myPageUpdateSelectM (Member m);
	
	public int changeProfile (Member m, MultipartFile profileimg, String webPath, String serverFolderPath) throws Exception;
	
	public ArrayList<Board> zzimSelect (Member m , Board b);
	
	public int selfban(Member m);
	

}
