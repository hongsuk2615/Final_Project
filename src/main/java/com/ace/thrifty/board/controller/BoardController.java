package com.ace.thrifty.board.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.ace.thrifty.board.model.service.BoardService;
import com.ace.thrifty.board.model.vo.Board;
import com.ace.thrifty.common.Utils;
import com.ace.thrifty.member.model.vo.Member;
import com.google.gson.Gson;

@Controller
@RequestMapping("/board")
public class BoardController {

	@Autowired
	BoardService boardService;

	@GetMapping("/delete")
	@ResponseBody
	public int deleteBoard(int bNo, HttpSession session) {
		Member loginUser = (Member) session.getAttribute("loginUser");
		if (loginUser == null) {
			return -1;
		} else {
			Board board = new Board();
			if (loginUser.getAuthority() == 0) {
				board.setBoardNo(bNo);
			} else {
				board.setBoardNo(bNo);
				board.setUserNo(loginUser.getUserNo());
			}
			return boardService.deleteBoard(board);
		}
	}
	
	@PostMapping("/enrollForm/{boardCat}/preview")
	@ResponseBody
	public String adminEnrollFormPrivew(HttpSession session, MultipartHttpServletRequest request, @PathVariable("boardCat") String boardCat)throws Exception {
		System.out.println(boardCat);
		MultipartFile previewImg = request.getFile("upload");
		String privewPath = "/resources/images/"+boardCat+"/";
		
		

		String ServerPriviewPath = session.getServletContext().getRealPath(privewPath);
		
		String changeName = Utils.saveFile(previewImg, ServerPriviewPath);

		String url = request.getContextPath()+privewPath+changeName;
		
		Map<String, Object> preview = new HashMap<>();
		
		preview.put("url", url);
		preview.put("uploaded", true);
		
		
		return new Gson().toJson(preview);
	}
}
