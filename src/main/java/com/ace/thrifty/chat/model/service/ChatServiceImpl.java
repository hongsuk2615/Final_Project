package com.ace.thrifty.chat.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.ace.thrifty.chat.model.dao.ChatDao;
import com.ace.thrifty.chat.model.vo.ChatMessage;
import com.ace.thrifty.chat.model.vo.ChatRoom;
import com.ace.thrifty.chat.model.vo.ChatRoomJoin;

@Service
public class ChatServiceImpl implements ChatService{
	
	@Autowired
	private ChatDao dao;

	@Override
	public List<ChatRoom> selectChatRoomList() {
		
		return dao.selectChatRoomList();
	}
	
	@Override
	public int openChatRoom(ChatRoom chatRoom) {
		return dao.openChatRoom(chatRoom);
	}
	
	@Override
	public List<ChatMessage> joinChatRoom(ChatRoomJoin join){
		
		// 현재 회원이 해당 채팅방에 참여하고 있는 지 확인
		int result = dao.joinCheck(join);
		
		if(result == 0) { // 미참여 시 추가
			dao.joinChatRoom(join);
		}
		// 채팅메세지 목록 조회
		return dao.selectChatMessage(join.getChatRoomNo());
	}
	
	@Override
	public int insertMessage(ChatMessage chatMessage) {
		return dao.insertMessage(chatMessage);
	}
	
	@Transactional(rollbackFor = Exception.class)
	@Override
	public int exitChatRoom(ChatRoomJoin join) {
		
		//채팅방 나가기
		int result = dao.exitChatRoom(join);
		
		//채팅방 나가기 성공 시
		if(result > 0) {
			// 현재 방에 남아있는 인원을 확인하고,
			int cnt = dao.countChatRoomMember(join.getChatRoomNo());
			// 0명일 경우 방을 닫기
			if(cnt == 0) {
				result = dao.closeChatRoom(join.getChatRoomNo());
			}
		}		
		
		return result;
	}
	
	
}
