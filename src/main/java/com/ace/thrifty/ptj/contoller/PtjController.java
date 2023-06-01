package com.ace.thrifty.ptj.contoller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.ace.thrifty.board.model.vo.Board;
import com.ace.thrifty.ptj.model.service.PtjService;
import com.ace.thrifty.ptj.model.vo.Ptj;

@Controller
public class ptjController {

	@Autowired
	private PtjService ptjService;

//		private static final Logger logger = LoggerFactory.getLogger(PtjController.class);

	@RequestMapping("/ptj")
	public String ptjMain() {
		return "part_time_job/PTJMain";
	}

	@GetMapping("/ptj/ptjList")
	public String ptjList(@RequestParam(value="subCategoryNo" , required = false) String categorySNo , Model model) {
		if (categorySNo != null) {
			List<Ptj> bList = ptjService.selectPtj(categorySNo);
			System.out.println(bList);
			model.addAttribute("bList", bList);
		} else {
			List<Ptj> bList = ptjService.selectPtjAll();
			model.addAttribute("bList", bList);
		}
		
		System.out.println(categorySNo);
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

		model.addAttribute("p", p);

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

	@RequestMapping("/ptj/ptjEnrollForm")
	public String ptjEnrollForm() {
		return "part_time_job/PTJEnrollForm";
	}

}
