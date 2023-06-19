package com.ace.thrifty.chat.model.service;

import java.util.List;

import com.ace.thrifty.chat.model.vo.ChatMessage;
import com.ace.thrifty.chat.model.vo.ChatRoom;
import com.ace.thrifty.chat.model.vo.ChatRoomJoin;

public interface ChatService {
	
	List<ChatRoom> selectChatRoomList();
	
	int openChatRoom(ChatRoom cr);
	
	List<ChatMessage> joinChatRoom(ChatRoomJoin join);
	
	int insertMessage(ChatMessage cm);
	
	int exitChatRoom(ChatRoomJoin crj);

}
