package com.ace.thrifty.myPage.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.ace.thrifty.board.model.vo.Board;
import com.ace.thrifty.member.model.vo.Member;
import com.ace.thrifty.myPage.model.service.MyPageService;
import com.ace.thrifty.smallgroup.model.vo.SmallGroup;

@Controller
@RequestMapping("/mypage")
public class MyPageController {

	@Autowired
	private MyPageService myPageService;
	
	@GetMapping("/myPageMain")
	public String Main() {
		return "myPage/myPageMain";
				
	}
	
	
	@GetMapping("/myWrite")
	public String MyPageSelectList(
								Model model, 
								HttpSession session) {
		
		ArrayList<Board> list = myPageService.selectBoardByUserNo(((Member)session.getAttribute("loginUser")).getUserNo());
		
		model.addAttribute("list", list);
		
		
		
		return "myPage/myPageSelectWrite";
	}
	
	
	@GetMapping("/myUpdateForm")
	public String MyPageUpdateForm() {
		
		
		return "myPage/myPageUpdate";
	}
	
	
	@PostMapping("/myUpdate")
	public String MyPageUpdate(
			Model model,
			HttpSession session,
			Member m
			) {
		int userNo = ((Member)session.getAttribute("loginUser")).getUserNo();
		m.setUserNo(userNo);
		int result1 = myPageService.myPageUpdate(m);
		
		
		System.out.println(m);
		
		if(result1>0) {
			
			model.addAttribute("alertMsg","성공");
			
		    Member loginUser = myPageService.myPageUpdateSelectM(m);
		    
		    session.setAttribute("loginUser", loginUser);
		    
		    
		    
			
		}
		return "myPage/myPageMain";
		// 수정했을때 myPageMain 이거를 select를 다시해
		
		// 수정성공했을시 다시 select해서 loginUser에 넣어야한다 
		
		//지금 수정을 성공한상태 -> 근데 지금 정보를 다시 select해 loginUser에  넣어야함
		
		}
	
	@RequestMapping("insertProfile.do")
	public String insertProfile(HttpSession session,
								Member m,
								@RequestParam(value = "images", required = false ) List<MultipartFile> imgList) {
		int userNo = ((Member)session.getAttribute("loginUser")).getUserNo();
		m.setUserNo(userNo);
		
		String webPath = "/resources/upfiles/myPage/";
		String serverFolderPath = session.getServletContext().getRealPath(webPath);
		myPageService.insertProfile(m, webPath, serverFolderPath);
		
		
		
	}
	
	
	@GetMapping("zzimselect")
	public String zzimSelect(HttpSession session,
							Member m,
							Board b) {
		//찜 을 셀렉트 하기 
		//wishlist라는 테이블에서 boardNo, user.no
		//앞에다가 보여줄 화면 : 각자uppercateogry별로 찜 보여줌 boardNo로 가져와야
		// 일단 로그인 유저의 번호가 필요함 UserNo.
		int userNo = ((Member)session.getAttribute("loginUser")).getUserNo();
		m.setUserNo(userNo);
		//유저 넘버 뽑아서 멤버에 넣어둠
		
		
		
		
		
		
		
		
	}
}
