package com.ace.thrifty.myPage.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.ace.thrifty.board.model.vo.Board;
import com.ace.thrifty.member.model.vo.Member;
import com.ace.thrifty.myPage.model.service.MyPageService;
import com.ace.thrifty.ptj.model.service.PtjService;
import com.ace.thrifty.ptj.model.vo.Ptj;
import com.ace.thrifty.smallgroup.model.service.SmallGroupService;
import com.ace.thrifty.smallgroup.model.vo.SmallGroup;
import com.ace.thrifty.usedProduct.model.service.UsedProductService;
import com.ace.thrifty.usedProduct.model.vo.UsedProduct;
import com.ace.thrifty.wishList.model.vo.WishList;
import com.google.gson.Gson;

@Controller
@RequestMapping("/mypage")
public class MyPageController {

	@Autowired
	private MyPageService myPageService;
	
	@Autowired
	private PtjService ptjService;
	
	@Autowired
	private SmallGroupService smallgroupService;
	
	@Autowired
	private UsedProductService usedProductService;
	
	
	@Autowired
	private BCryptPasswordEncoder bcryptPasswordEncoder;
	
	//메인
	@GetMapping("/myPageMain")
	public String Main() {
		return "myPage/myPageMain";
				
	}
	
	//내가 쓴글 조회  
	@GetMapping("/myWrite")
	public String MyPageSelectList(
								Model model, 
								HttpSession session,
								@RequestParam(value="currentPage" , defaultValue="1", required=false) String currentPage) {
	
		Map map = new HashMap<String, Object>();
		
		
		ArrayList<Board> list = myPageService.selectBoardByUserNo(((Member)session.getAttribute("loginUser")).getUserNo(),currentPage, map);
		
		model.addAttribute("list", list);
		model.addAttribute("pi", map.get("pi"));
		
		
		return "myPage/myPageSelectWrite";
	}
	
	//수정하기 폼 
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
		String encPwd = bcryptPasswordEncoder.encode(m.getUserPwd());
		m.setUserPwd(encPwd);
		
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
	
	@PostMapping("/insertProfile.do")
	public String changeProfile(HttpSession session,
								@RequestParam(value = "images", required = false ) MultipartFile profileimage) throws Exception{
		Member m = (Member)session.getAttribute("loginUser");
		
		
		
		String webPath = "/resources/upfiles/myPage/";
		String serverFolderPath = session.getServletContext().getRealPath(webPath);
		myPageService.changeProfile(m, profileimage, webPath, serverFolderPath);
		
		System.out.print(m);
		
		return "myPage/myPageMain";
	}
	
	
	@GetMapping("/zzimselect")
	public String zzimSelect(HttpSession session,
			Board b,
			Model model) {
		Member m = (Member)session.getAttribute("loginUser");
		
		
		
		//wishlist.userno = loginUser.userno 
		
		ArrayList<Board> list = myPageService.zzimSelect(m, b);
		
		System.out.println(list);
		
		model.addAttribute("list",list);
		
		return "myPage/myPagezzim";
		
		
		//찜 을 셀렉트 하기 
		//wishlist라는 테이블에서 boardNo, user.no
		//앞에다가 보여줄 화면 : 각자uppercateogry별로 찜 보여줌 boardNo로 가져와야
		// 일단 로그인 유저의 번호가 필요함 UserNo.
//		int userNo = ((Member)session.getAttribute("loginUser")).getUserNo();
//		m.setUserNo(userNo);
		//유저 넘버 뽑아서 멤버에 넣어둠
		
		
//		select M.USER_NO, B.BOARD_NO, TITLE, CHANGE_NAME, CATEGORY_U_NO from WISH_LIST W
//		JOIN BOARD B USING(BOARD_NO)
//		JOIN MEMBER M ON(B.USER_NO = M.USER_NO)
//		JOIN IMAGE I USING(BOARD_NO)
//		WHERE W.USER_NO= 1;
		
		
		
		
//		
	}
	
	@GetMapping("/selfban")
	public String selfban(HttpSession session, Member m) {
		int userNo = ((Member)session.getAttribute("loginUser")).getUserNo();
		m.setUserNo(userNo);
	
		int result1 = myPageService.selfban(m);
		
		
		return "redirect:/member/logout";
	}
	
	@ResponseBody
	@GetMapping("/adv")
	public String adv(){
	
		List<Ptj> pList = ptjService.advptjAll();  
		
		
	
		//list 조회 
		//random -> math.random ()
		//list 가져온것중에
		
		int aaa = (int)(Math.random() * pList.size() );
		pList.get(aaa);
		
		Ptj var = pList.get(aaa);
		
		
		System.out.println(var);
		
		
		
		String webPath = "/resources/upfiles/ptj/";
		
		
		return new Gson().toJson(var);
		
	}
	
	@ResponseBody
	@GetMapping("/advSg")
	public String advSg() {
		List<SmallGroup> sgList = smallgroupService.selectSgAll();  
		
		
		
		//list 조회 
		//random -> math.random ()
		//list 가져온것중에
		
		int bbb = (int)(Math.random() * sgList.size() );
		sgList.get(bbb);
		
		SmallGroup val = sgList.get(bbb);
		
		
		System.out.println(val);
		
		
		
		String webPath = "/resources/upfiles/ptj/";
		
		
		return new Gson().toJson(val);
		
	}
	
	
	
	
}
