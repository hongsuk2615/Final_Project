package com.ace.thrifty.message.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

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

}
