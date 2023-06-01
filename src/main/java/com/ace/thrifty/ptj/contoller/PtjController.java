package com.ace.thrifty.ptj.contoller;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.ace.thrifty.board.model.vo.Board;
import com.ace.thrifty.ptj.model.service.PtjService;
import com.ace.thrifty.ptj.model.vo.Ptj;

@Controller
public class PtjController {
		
		@Autowired
		private PtjService ptjService;
		
		private static final Logger logger = LoggerFactory.getLogger(PtjController.class);
	
		@RequestMapping("/ptj")
		public String ptjMain() {
			return "part_time_job/PTJMain";
		}
		
		@GetMapping("/ptj/ptjList")
		public String ptjList() {
			return "part_time_job/PTJList";
		}
		
//		@GetMapping("/ptj/ptjDetail/{boardNo}")
//		public String ptjDetail(@PathVariable("boardNo") int boardNo ,
//								@RequestParam(value="")) {
//			return "part_time_job/PTJDetail";
//		}
		
		@GetMapping("/ptj/ptjDetail/{boardNo}")
		public String selectPtjDetail(
					Model model,
					@PathVariable("boardNo") int boardNo
					) {
			System.out.println(boardNo);
			
			Ptj p = ptjService.selectPtjDetail(boardNo);
			
			model.addAttribute("p" , p);

			return "part_time_job/PTJDetail";			

		}
		
//		@GetMapping("/ptj/ptjInsert")
//		public int ptjEnrollForm(
//				Model model,
//				Board b ,
//				@RequestParam(value="enrollTitle" , defaultValue="insert" , required = false) String enrollTitle,
//				@RequestParam(value="enrollTitle" , defaultValue="insert" , required = false) String enrollContent,
//				ModelAndView mv ,
//				HttpSession session , HttpServletRequest req, HttpServletResponse resp
//				) {
//			mv.addObject(b.getTitle() , "enrollTitle");
//		}
		
		
}
