package com.ace.thrifty.usedProduct.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
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
import com.ace.thrifty.common.model.vo.PageInfo;
import com.ace.thrifty.member.model.vo.Member;
import com.ace.thrifty.usedProduct.model.service.UsedProductService;
import com.ace.thrifty.usedProduct.model.vo.UsedProduct;

@Controller
@RequestMapping("/usedProduct")
public class UsedProductController {

	@Autowired
	UsedProductService usedProductService;

	
	
	@GetMapping("")
	public String usedProduct(Model model, @RequestParam Map<String, Object> queryString) {
		System.out.println(queryString);
		if(!queryString.containsKey("currPage")) {
			queryString.put("currPage", "1");
		}
		usedProductService.selectUsedProduct(queryString);
		if(queryString.containsKey("scNo")) {
			model.addAttribute("scNo", queryString.get("scNo"));			
		}
		model.addAttribute("filter", queryString);
		model.addAttribute("list", queryString.get("list"));
		model.addAttribute("pi", queryString.get("pi"));
		return "usedProduct/usedProduct";
	}
	
	@GetMapping("/detail")
	public String usedProductDetail(int bNo, Model model) {
		UsedProduct uP = usedProductService.selectUsedProductByBno(bNo);
		if(uP != null) {
			model.addAttribute("usedProduct", uP);
			model.addAttribute("board", uP.getBoard());
			model.addAttribute("imageList", uP.getImageList());
			model.addAttribute("seller", uP.getSeller());
			return "usedProduct/usedProductDetail";
		}else {
			return "redirect:/thrifty/usedProduct";
		}
	}
	
	@GetMapping("/enroll")
	public String usedProductEnroll() {
		return "usedProduct/usedProductEnroll";
	}
	
	@PostMapping("/enroll")
	public String insertUsedProduct(HttpSession session, 
									Board b, 
									UsedProduct uP,
									@RequestParam(value = "images", required = false ) List<MultipartFile> imgList)  throws Exception {
		Member loginUser = (Member)session.getAttribute("loginUser");
		b.setCategoryUNo(4);
		b.setUserNo(loginUser.getUserNo());
		String webPath = "/resources/upfiles/usedProduct/";
		String serverFolderPath = session.getServletContext().getRealPath(webPath);
		usedProductService.insertUsedProduct(b,	uP, imgList, webPath, serverFolderPath);
		return "redirect:/usedProduct";
	}
	
	@GetMapping("/modify")
	public String usedProductModify(int bNo, Model model, HttpServletRequest request) {
		UsedProduct uP = usedProductService.selectUsedProductByBno(bNo);
		if(uP != null) {
			model.addAttribute("usedProduct", uP);
			model.addAttribute("board", uP.getBoard());
			model.addAttribute("imageList", uP.getImageList());
			return "usedProduct/usedProductModify";
		}else {
			String referer = request.getHeader("Referer");	
			return "redirect:" + referer;
		}
	}
}
