package com.ace.thrifty.myPage.model.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import com.ace.thrifty.board.model.vo.Board;
import com.ace.thrifty.member.model.vo.Member;

public interface MyPageService {
//	public String selectMyPage();
	
	public ArrayList<Board> selectBoardByUserNo(int userNo);

	
	public int myPageUpdate (Member m);
	
	public Member myPageUpdateSelectM (Member m);
	
	public String changeProfile(Member m, MultipartFile profileimg, String webPath, String serverFolderPath);

	public String zzimSelect(Member m, Board b);
}
