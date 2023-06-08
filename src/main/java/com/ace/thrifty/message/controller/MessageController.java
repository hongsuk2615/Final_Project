package com.ace.thrifty.message.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ace.thrifty.member.model.vo.Member;
import com.ace.thrifty.message.model.service.MessageService;
import com.ace.thrifty.message.model.vo.Message;

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
			return messageService.insertMessage(message);
		}
	}
}
