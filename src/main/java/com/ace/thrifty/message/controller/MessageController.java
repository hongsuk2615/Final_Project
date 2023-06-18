package com.ace.thrifty.message.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ace.thrifty.member.model.vo.Member;
import com.ace.thrifty.message.model.service.MessageService;
import com.ace.thrifty.message.model.vo.Message;
import com.google.gson.Gson;

@RequestMapping("/message")
@Controller
public class MessageController {
	
	@Autowired
	MessageService messageService;
	
	@GetMapping("/insert")
	@ResponseBody
	public int insertMessage(Message message, HttpSession session) {
		System.out.println(message);
		if (session.getAttribute("loginUser") == null) {
			return -1;
		} else {
			int sender = ((Member) session.getAttribute("loginUser")).getUserNo();
			message.setSender(sender);
			System.out.println(message);
			return messageService.insertMessage(message);
		}
	}
	
	@GetMapping("/selectUsers")
	@ResponseBody
	public String selectUsers(HttpSession session) {
		int userNo = ((Member)session.getAttribute("loginUser")).getUserNo();
		List<Member> users = messageService.selectUsers(userNo);
		return new Gson().toJson(users);
	}
	
	@GetMapping("/selectMessage")
	@ResponseBody
	public String selectMessage(HttpSession session, String userNo) {
		int loginUserNo = ((Member)session.getAttribute("loginUser")).getUserNo();
		Map<String, Integer> map = new HashMap<String, Integer>();
		map.put("loginUser", loginUserNo);
		map.put("opponent", Integer.parseInt(userNo));
		List<Message> list = messageService.selectMessage(map);
		return new Gson().toJson(list);
	}
	
	
}
