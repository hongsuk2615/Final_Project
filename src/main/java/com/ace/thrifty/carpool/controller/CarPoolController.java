package com.ace.thrifty.carpool.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.ace.thrifty.board.model.vo.Board;
import com.ace.thrifty.carpool.model.service.CarPoolService;
import com.ace.thrifty.carpool.model.vo.CarPool;
import com.ace.thrifty.member.model.vo.Member;

@Controller
@RequestMapping("/carPool")
public class CarPoolController {
	
	@Autowired
	public CarPoolService carPoolService;
	
	@GetMapping("")
	public String carPoolMain() {
		return "car_pool/carPoolMain";
	}
	
	@RequestMapping("/drive")
	public String selectDriveList(Model model , @RequestParam Map<String, Object> queryString) {
		if(!queryString.containsKey("currPage")) {
			queryString.put("currPage", "1");
		}
		carPoolService.selectDriveList(queryString);
		if(queryString.containsKey("scNo")) {
			model.addAttribute("scNo", queryString.get("scNo"));			
		}
		model.addAttribute("filter", queryString);
		model.addAttribute("list", queryString.get("list"));
		System.out.println(queryString);
		model.addAttribute("pi", queryString.get("pi"));
		return "car_pool/carPoolDriveList";
	}
	
	@GetMapping("/detail")
	public String driveDetail(Model model , int bNo) {
		CarPool carpool = carPoolService.driveDetail(bNo);
		if(carpool != null) {
			model.addAttribute("carpool" , carpool);
			model.addAttribute("imageList", carpool.getImageList());
			return "car_pool/carPoolDetail";	
		} else {
			return"car_pool/carPoolDetail";
		}
	}
	
	@GetMapping("/enroll")
	public String carPoolEnroll() {
		return "car_pool/carPoolEnrollForm";
	}
	
	@PostMapping("/enroll")
	public String insertCarPool(HttpSession session ,
								CarPool c ,
								Board b ,
								@RequestParam(value="images" , required = false) List<MultipartFile> imgList) throws Exception{
		Member loginUser = (Member)session.getAttribute("loginUser");
		b.setCategoryUNo(3); 
		b.setUserNo(loginUser.getUserNo()); 
		String webPath = "/resources/upfiles/carPool/"; 
		String serverFolderPath = session.getServletContext().getRealPath(webPath);
		carPoolService.insertCarPool(c, b, imgList, webPath, serverFolderPath);
		return "redirect:/carPool/drive";
	}
	
	@ResponseBody
	@GetMapping("/deadLine")
	public int deadLine(int bNo , HttpSession session) {
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
			return carPoolService.deadLine(b);
		}
	}
	
	@GetMapping("/update")
	public String carPoolUpdateForm(int bNo ,
									Model model) {
		CarPool carpool = carPoolService.carPoolUpdateForm(bNo);
		if(carpool != null) {
			model.addAttribute("carpool" , carpool);
			model.addAttribute("board", carpool.getBoard());
			model.addAttribute("imageList", carpool.getImageList());
		}
		return "car_pool/carPoolUpdateForm";
	}
	
	@PostMapping("/update")
	public String carPoolUpdate(HttpSession session ,
								Board b,
								CarPool cP,
								@RequestParam(value = "images", required = false ) List<MultipartFile> imgList,
								String removeImgList) throws Exception {
		Member loginUser = (Member)session.getAttribute("loginUser");
		b.setCategoryUNo(3);
		b.setUserNo(loginUser.getUserNo());
		removeImgList = "(" +removeImgList+")";
		String webPath = "/resources/upfiles/carPool/";
		String serverFolderPath = session.getServletContext().getRealPath(webPath);
		carPoolService.carPoolBoardUpdate(b, cP, imgList, webPath, serverFolderPath, removeImgList);
		return "redirect:/carPool/drive";
	}
}
