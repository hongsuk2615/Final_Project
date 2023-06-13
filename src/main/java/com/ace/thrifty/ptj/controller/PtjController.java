package com.ace.thrifty.ptj.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.ace.thrifty.board.model.service.BoardService;
import com.ace.thrifty.board.model.vo.Board;
import com.ace.thrifty.board.model.vo.Image;
import com.ace.thrifty.board.model.vo.SubCategory;
import com.ace.thrifty.common.Utils;
import com.ace.thrifty.member.model.vo.Member;
import com.ace.thrifty.ptj.model.service.PtjService;
import com.ace.thrifty.ptj.model.vo.Ptj;

@Controller
public class PtjController {

	@Autowired
	private PtjService ptjService;

//		private static final Logger logger = LoggerFactory.getLogger(PtjController.class);

	@GetMapping("/ptj")
	public String ptjMain(Model model) {
		List<Ptj> p = ptjService.selectPtj();
		model.addAttribute("p" , p);
		String webPath = "/resources/upfiles/ptj/";
		model.addAttribute("webPath" , webPath);
		/* System.out.println(p); */
		return "part_time_job/PTJMain";
	}

	
	 @GetMapping("/ptj/ptjList") 
	 public String ptjList(Model model , @RequestParam Map<String, Object> queryString) {
		 if(!queryString.containsKey("currPage")) {
				queryString.put("currPage", "1");
		 }
		 ptjService.selectPtjAll(queryString);
		 if(queryString.containsKey("lNo")) {
			model.addAttribute("lNo", queryString.get("lNo"));			
		 }
		 model.addAttribute("filter", queryString.get("filter"));
		 model.addAttribute("list", queryString.get("list"));
		 model.addAttribute("pi", queryString.get("pi"));
		 return "part_time_job/PTJList"; 
	 
	 }
	

	@GetMapping("/ptj/ptjDetail")
	public String selectPtjDetail(Model model, int bNo) {
//			System.out.println(boardNo);

		Ptj p = ptjService.selectPtjDetail(bNo);
		if(p != null) {
			/* System.out.println(p); */
			model.addAttribute("p", p);
			String webPath = "/resources/upfiles/ptj/";
			model.addAttribute("webPath" , webPath);
			return "part_time_job/PTJDetail";	
		} else {
			return "redirect:/thrifty/ptj/ptjList";
		}

	}

//		@GetMapping("/ptj/ptjEnrollForm")
//		public int ptjEnrollForm(
//				Model model,
//				@RequestParam(value="enrollTitle" , defaultValue="insert" , required = false) String enrollTitle,
//				@RequestParam(value="enrollTitle" , defaultValue="insert" , required = false) String enrollContent,
//				ModelAndView mv ,
//				HttpSession session , HttpServletRequest req, HttpServletResponse resp
//				) {
//		mv.addObject(b.getTitle() , "enrollTitle");
//		}

	@GetMapping("/ptj/ptjEnrollForm")
	public String ptjEnrollForm() {
		return "part_time_job/PTJEnrollForm";
	}
	
	@PostMapping("/ptj/ptjList/enroll")
	public String insertPtj(HttpSession session,
							Board b,
							Ptj p,
							@RequestParam(value="img" , required = false) MultipartFile image) throws Exception {
		
		Member loginUser = (Member)session.getAttribute("loginUser");
		b.setCategoryUNo(5);
		b.setUserNo(loginUser.getUserNo());
		String webPath = "/resources/upfiles/ptj/";
		String serverFolderPath = session.getServletContext().getRealPath(webPath);
		ptjService.insertPtj(b, p, image, webPath, serverFolderPath);
		
		return "redirect:/ptj/ptjList";
		
	}
	
//	@GetMapping("/ptj/ptjList")
//	public String ptjListPaging(Model model , @RequestParam Map<String, Object> paramMap) {
//		
//		Map<String, Object> map = new HashMap<>();
//		map.put("pList", )
//		List<Ptj> pList = ptjService.selectPtjAll(); 
//		model.addAttribute("pList", pList); 
//		String webPath = "/resources/upfiles/ptj/";
//		model.addAttribute("webPath" , webPath);
//		ptjService.ptjBoardPaging(map, paramMap);
//		map.put("pList", pList);
//		
//		model.addAttribute("contents", "ptj");
//		model.addAttribute("map", map);
//		
//		return "part_time_job/PTJList";
//	}
	
	/*
	 * @GetMapping("/ptj/ptjDelete")
	 * 
	 * @ResponseBody public int deleteBoard(int bNo, HttpSession session) { Member
	 * loginUser = (Member) session.getAttribute("loginUser");
	 * System.out.println(loginUser); if (loginUser == null) { return -1; } else {
	 * Board board = new Board(); if (loginUser.getAuthority() == 0) {
	 * board.setBoardNo(bNo); } else { board.setBoardNo(bNo);
	 * board.setUserNo(loginUser.getUserNo()); } return
	 * boardService.deleteBoard(board); } }
	 */
	
	@GetMapping("/ptj/ptjUpdate")
	public String updatePtj(@RequestParam(value="bNo" , required = false)int boardNo ,
							Model model) {
		Ptj p = ptjService.updateFormPtj(boardNo);
		model.addAttribute("p" , p);
		return "part_time_job/PTJUpdateForm";		
	}
	
	@PostMapping("/ptj/ptjUpdate")
	public String update(HttpSession session,
						 Ptj p ,
						 Board b,
						 @RequestParam(value="img" , required = false) MultipartFile image ) throws Exception {
		Member loginUser = (Member)session.getAttribute("loginUser");
		/*
		 * System.out.println(p); System.out.println(b);
		 */
		b.setCategoryUNo(5);
		b.setUserNo(loginUser.getUserNo());
		String webPath = "/resources/upfiles/ptj/";
		String serverFolderPath = session.getServletContext().getRealPath(webPath);
		Image img = new Image();
		if(!image.isEmpty()) {
			String changeName = Utils.saveFile(image, serverFolderPath);
			img.setOriginName(image.getOriginalFilename());
			img.setChangeName(changeName);
			img.setFileLevel(0);
			img.setBoardNo(p.getBoardNo());
		}
		ptjService.updatePtj(p, b, img, webPath, serverFolderPath);
		return "redirect:/ptj/ptjList";
	}
	
	@ResponseBody
	@GetMapping("/ptj/workEnd")
	public int workEnd(int bNo, HttpSession session) {
		Member loginUser = (Member) session.getAttribute("loginUser");
		if (loginUser == null) {
			return -1;
		} else {
			Board b = new Board();
			if (loginUser.getAuthority() == 0) {
				b.setBoardNo(bNo);
			} else {
				b.setUserNo(loginUser.getUserNo());
				b.setBoardNo(bNo);
			}
			return ptjService.workEnd(b);
		}
	}
}