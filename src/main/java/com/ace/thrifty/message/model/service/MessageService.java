package com.ace.thrifty.message.model.service;

import java.util.List;
import java.util.Map;

import com.ace.thrifty.member.model.vo.Member;
import com.ace.thrifty.message.model.vo.Message;

public interface MessageService {
	public int insertMessage(Message ms);
	public List<Member> selectUsers(int userNo);
	public List<Message> selectMessage(Map<String, Integer> map);
}
