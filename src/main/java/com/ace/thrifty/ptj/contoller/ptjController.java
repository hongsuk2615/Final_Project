package com.ace.thrifty.ptj.contoller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ace.thrifty.ptj.model.service.PtjService;

@Controller
public class ptjController {
		
		@Autowired
		private PtjService ptjService;
		
//		private static final Logger logger = LoggerFactory.getLogger(PtjController.class);
	
//		@RequestMapping("/ptj")
//		public String ptjMain() {
//			return "part_time_job/PTJMain";
//		}
//		
//		@GetMapping("/list/{boardCode}")
//		public String PtjList(@PathVariable("boardCode"))
		
}
