package com.ace.thrifty.message.model.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ace.thrifty.member.model.vo.Member;
import com.ace.thrifty.message.model.dao.MessageDao;
import com.ace.thrifty.message.model.vo.Message;

@Service
public class MessageServiceImpl implements MessageService{

	@Autowired
	MessageDao messageDao;
	
	@Override
	public int insertMessage(Message ms) {
		return messageDao.insertMessage(ms);
	}

	@Override
	public List<Member> selectUsers(int userNo) {
		// TODO Auto-generated method stub
		return messageDao.selectUsers(userNo);
	}

	@Override
	public List<Message> selectMessage(Map<String, Integer> map) {
		return messageDao.selectMessage(map);
	}

}
