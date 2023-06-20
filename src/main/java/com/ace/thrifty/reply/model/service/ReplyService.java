package com.ace.thrifty.reply.model.service;

import java.util.List;
import java.util.Map;

import com.ace.thrifty.reply.model.vo.Reply;

public interface ReplyService {

	int replyInsert(Map<String, Object> paramMap);

	List<Reply> BoardReplyList(int bNo);

	int replyDelete(int rNo);

}
