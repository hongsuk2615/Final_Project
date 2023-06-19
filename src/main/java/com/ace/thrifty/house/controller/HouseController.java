package com.ace.thrifty.house.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.ace.thrifty.board.model.vo.Board;
import com.ace.thrifty.common.model.vo.Coordinate;
import com.ace.thrifty.house.model.service.HouseService;
import com.ace.thrifty.house.model.vo.House;
import com.ace.thrifty.house.model.vo.Room;
import com.ace.thrifty.house.model.vo.Tour;
import com.ace.thrifty.member.model.vo.Member;
import com.google.gson.Gson;

@Controller
@RequestMapping("/sharehouse")
public class HouseController {
	
	private final HouseService houseService;
	
	public HouseController(HouseService houseService) {
		this.houseService = houseService;
	}
	
	@ResponseBody
	@PostMapping("") // 헤더의 쉐어하우스 클릭 시 
	public String shareHouse(HttpSession s) {
		int userNo = -1;
		if(s.getAttribute("loginUser") != null) {
			userNo = ((Member)s.getAttribute("loginUser")).getUserNo();
		}
		return new Gson().toJson(houseService.selectHouseList(userNo));
	}
	
	@GetMapping("")
	public String shareHouseMain() {
		return "house/house";
	}
	
	@ResponseBody
	@GetMapping("/selectLocation") // 메인화면 지도 변경할 때 마다 방 가져오기
	public String selectLocation(Coordinate c, HttpSession s)  {
		int userNo = ((Member)s.getAttribute("loginUser")).getUserNo();
		return new Gson().toJson(houseService.selectLocation(c, userNo));
	}
	
	@GetMapping("/detail") // 쉐어하우스 메인화면의 방 하나 클릭 시
	public String houseDetail(Model m,
			@RequestParam(value="bNo", required=false) int boardNo) {
		List<Object> house = houseService.selectHouse(boardNo);
		m.addAttribute("house", house);
		return "house/houseDetail";
	}
	
	@GetMapping("/enrollForm") // 글 등록버튼 클릭 시 폼으로 이동
	public String houseEnrollForm() {
		return "house/houseEnroll";
	}
	
	@Transactional(rollbackFor = {Exception.class})
	@PostMapping("/enroll") // 글 모두 작성 후 신청하기버튼 클릭
	public String houseEnroll(Model model,
			MultipartHttpServletRequest mtfRequest,
			HttpSession s,
			Board b,
			House h,
			@RequestParam(value="recruitsNum", required=false) List<Integer> recruitsNum,
			@RequestParam(value="division", required=false) List<String> division,
			@RequestParam(value="gender", required=false) List<String> gender,
			@RequestParam(value="type", required=false) List<String> type,
			@RequestParam(value="area", required=false) List<Double> area,
			@RequestParam(value="deposit", required=false) List<Integer> deposit,
			@RequestParam(value="rent", required=false) List<Integer> rent,
			@RequestParam(value="cost", required=false) List<Integer> cost,
			@RequestParam(value="contrat", required=false) List<String> contrat
			) throws Exception {
		b.setUserNo((((Member)s.getAttribute("loginUser")).getUserNo()));
		b.setCategoryUNo(2);
		List<Room> rooms = new ArrayList();
		Map<String, List<MultipartFile>> roomImgs = new LinkedHashMap();
		for(int i = 0; i< division.size(); i++) {
			Room room = Room.builder()
					.division(division.get(i))
					.recruitsNum(recruitsNum.get(i))
					.gender(gender.get(i))
					.type(type.get(i))
					.area(area.get(i))
					.deposit(deposit.get(i))
					.rent(rent.get(i))
					.cost(cost.get(i))
					.contrat(contrat.get(i))
					.build();
			rooms.add(room);
		}
		for(int i = 0; i < 10; i++) {
			if(!mtfRequest.getFiles("roomImg"+i).isEmpty()) {
			roomImgs.put("roomImg"+i, mtfRequest.getFiles("roomImg"+i));
			}
		}
		String webPath = "/resources/upfiles/house/";
		String serverFolderPath = s.getServletContext().getRealPath(webPath);
		int result = houseService.insertHouse(b, h, rooms, roomImgs, webPath, serverFolderPath);
		model.addAttribute("bNo", b.getBoardNo());
		return result > 0 ?  "redirect:/sharehouse/detail" : "redirect:/";
	}
	
	
	@ResponseBody
	@GetMapping("/selectRoomImg") // detail에서 room이미지 가져오기
	public String selectRoomImg(@RequestParam(value="roomNo", required=false) int roomNo)  {
		
		return new Gson().toJson(houseService.selectRoomImg(roomNo));
	}
	
	@ResponseBody
	@GetMapping("/scrapHouse")
	public int scrapHouse(Model m, HttpSession s,
			@RequestParam(value="bNo", required=false) int boardNo) {
		int userNo = ((Member)s.getAttribute("loginUser")).getUserNo();
		return houseService.scrapHouse(userNo, boardNo);
	}
	
	@ResponseBody
	@GetMapping("/scrapCancel")
	public int scrapCancel(Model m, HttpSession s,
			@RequestParam(value="bNo", required=false) int boardNo) {
		int userNo = ((Member)s.getAttribute("loginUser")).getUserNo();
		return houseService.scrapCancel(userNo, boardNo);
	}
	
	@ResponseBody
	@GetMapping("/searchHouse")
	public String searchHouse(HttpSession s,
			@RequestParam(value="keyword", required=false) String keyword) {
		int userNo = ((Member)s.getAttribute("loginUser")).getUserNo();
		keyword = '%' + keyword + '%';
		return new Gson().toJson(houseService.searchHouse(keyword, userNo));
	}
	
	@GetMapping("/updateHouse")
	public String updateHouse(Model m, HttpSession s,
			@RequestParam(value="bNo", required=false) int boardNo) {
		List<Object> house = houseService.selectHouse(boardNo);
		m.addAttribute("house", house);
		return "house/houseUpdate";
	}
	
	@ResponseBody
	@GetMapping("/tourApply")
	public String tourApply(HttpSession s,
			@RequestParam(value="roomNo", required=false) int roomNo,
			@RequestParam(value="moveIn", required=false) String moveIn,
			@RequestParam(value="enquiry", required=false) String enquiry) {
		int userNo = ((Member) s.getAttribute("loginUser")).getUserNo();
		Tour tour = Tour.builder().userNo(userNo).roomNo(roomNo).moveIn(moveIn).enquiry(enquiry).build();
		return new Gson().toJson(houseService.tourApply(tour));
	}
	
	@ResponseBody
	@GetMapping("/changeRecruitment")
	public String changeRecruitment(HttpSession s,
			Room r) {
			return new Gson().toJson(houseService.changeRecruitment(r));
	}
	
	@Transactional(rollbackFor = {Exception.class})
	@PostMapping("/update") // 글 모두 작성 후 신청하기버튼 클릭
	public String houseUpdate(Model model,
			MultipartHttpServletRequest mtfRequest,
			HttpSession s,
			Board b,
			House h,
			@RequestParam(value="recruitsNum", required=false) List<Integer> recruitsNum,
			@RequestParam(value="division", required=false) List<String> division,
			@RequestParam(value="gender", required=false) List<String> gender,
			@RequestParam(value="type", required=false) List<String> type,
			@RequestParam(value="area", required=false) List<Double> area,
			@RequestParam(value="deposit", required=false) List<Integer> deposit,
			@RequestParam(value="rent", required=false) List<Integer> rent,
			@RequestParam(value="cost", required=false) List<Integer> cost,
			@RequestParam(value="contrat", required=false) List<String> contrat,
			@RequestParam(value="roomNo", required=false) List<Integer> roomNo,
			@RequestParam(value="deleteRoomList", required=false) String deleteRoomList,
			@RequestParam(value="deleteImgList", required=false) String deleteImgList
			) throws Exception {
		
		b.setUserNo((((Member)s.getAttribute("loginUser")).getUserNo()));
		b.setCategoryUNo(2);
		b.setContent("");
		
		h.setBoardNo(b.getBoardNo());
		
		deleteImgList = "("+deleteImgList+")";
		deleteRoomList = "("+deleteRoomList+")";
		
		List<Room> rooms = new ArrayList();
		Map<String, List<MultipartFile>> roomImgs = new LinkedHashMap();
		for(int i = 0; i< division.size(); i++) {
			Room room = Room.builder()
					.boardNo(b.getBoardNo())
					.roomNo(roomNo.get(i))
					.division(division.get(i))
					.recruitsNum(recruitsNum.get(i))
					.gender(gender.get(i))
					.type(type.get(i))
					.area(area.get(i))
					.deposit(deposit.get(i))
					.rent(rent.get(i))
					.cost(cost.get(i))
					.contrat(contrat.get(i))
					.build();
			rooms.add(room);
		}
		for(int i = 0; i < 10; i++) {
			if(!mtfRequest.getFiles("roomImg"+i).isEmpty()) {
			roomImgs.put("roomImg"+i, mtfRequest.getFiles("roomImg"+i));
			}
		}
		String webPath = "/resources/upfiles/house/";
		String serverFolderPath = s.getServletContext().getRealPath(webPath);
		int result = houseService.updateHouse(b, h, rooms, roomImgs, webPath, serverFolderPath, deleteImgList, deleteRoomList);
		model.addAttribute("bNo", b.getBoardNo());
		return result > 0 ?  "redirect:/sharehouse/detail" : "redirect:/";
	}
	
	@ResponseBody
	@GetMapping("/checkApply")
	public String checkApply(@RequestParam(value="bNo", required=false) int bNo) {
		return new Gson().toJson(houseService.checkApply(bNo));
	}
	
	@ResponseBody
	@GetMapping("/selectApply")
	public String selectApply(@RequestParam(value="rNo", required=false) int rNo, @RequestParam(value="uNo", required=false) int uNo) {
		return new Gson().toJson(houseService.selectApply(rNo, uNo));
	}

	
	@ResponseBody
	@GetMapping("/checkStatus")
	public String checkStatus(@RequestParam(value="rNo", required=false) int rNo, @RequestParam(value="uNo", required=false) int uNo) {
		Map<String, Integer> map = new HashMap();
		map.put("rNo", rNo);
		map.put("uNo", uNo);
		return new Gson().toJson(houseService.checkStatus(map));
	}


}
