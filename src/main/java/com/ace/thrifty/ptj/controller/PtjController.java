package com.ace.thrifty.ptj.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.ace.thrifty.board.model.service.BoardService;
import com.ace.thrifty.board.model.vo.Board;
import com.ace.thrifty.board.model.vo.Image;
import com.ace.thrifty.member.model.vo.Member;
import com.ace.thrifty.ptj.model.service.PtjService;
import com.ace.thrifty.ptj.model.vo.Ptj;

@Controller
public class PtjController {

	@Autowired
	private PtjService ptjService;
	
	@Autowired
	private BoardService boardService;

//		private static final Logger logger = LoggerFactory.getLogger(PtjController.class);

	@GetMapping("/ptj")
	public String ptjMain() {
		return "part_time_job/PTJMain";
	}

	@GetMapping("/ptj/ptjList")
	public String ptjList(Model model) {

		List<Ptj> pList = ptjService.selectPtjAll();
		model.addAttribute("pList", pList);
		System.out.println(pList);
		String webPath = "/resources/upfiles/ptj/";
		model.addAttribute("webPath" , webPath);
		return "part_time_job/PTJList";

	}

	/*
	 * @GetMapping("/ptj/ptjList") public String ptjSubCategory( String subCategory,
	 * Model model ) { if(subCategory != null) { List<Ptj> bList =
	 * ptjService.selectPtjSubCategory(subCategory); model.addAttribute("bList" ,
	 * bList); } else { List<Ptj> bList = ptjService.selectPtjAll();
	 * model.addAttribute("bList" , bList); }
	 * 
	 * 
	 * return "part_time_job/PTJList";
	 * 
	 * }
	 */

	@GetMapping("/ptj/ptjDetail/{boardNo}")
	public String selectPtjDetail(Model model, @PathVariable("boardNo") int boardNo) {
//			System.out.println(boardNo);

		Ptj p = ptjService.selectPtjDetail(boardNo);
		System.out.println(p);
		model.addAttribute("p", p);
		String webPath = "/resources/upfiles/ptj/";
		model.addAttribute("webPath" , webPath);
		return "part_time_job/PTJDetail";

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
							Board b ,
							Ptj p ,
							@RequestParam(value="img" , required = false) List<MultipartFile> image ) throws Exception {
		Member loginUser = (Member)session.getAttribute("loginUser");
		b.setCategoryUNo(5);
		b.setUserNo(loginUser.getUserNo());
		String webPath = "/resources/upfiles/ptj/";
		String serverFolderPath = session.getServletContext().getRealPath(webPath);
		ptjService.insertPtj(b, p, image, webPath, serverFolderPath);
		
		return "part_time_job/PTJList";
		
	}
	
	@PostMapping("/ptj/ptjList")
	public String deletePtj( @RequestParam(value="boardNo" , required = false) int boardNo) {
		ptjService.deletePtj(boardNo);
		return "part_time_job/PTJList";
	}

}