package com.ace.thrifty.chat.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ace.thrifty.chat.model.vo.ChatMessage;
import com.ace.thrifty.chat.model.vo.ChatRoom;
import com.ace.thrifty.chat.model.vo.ChatRoomJoin;

@Repository
public class ChatDao {
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	public List<ChatRoom> selectChatRoomList(){
		return sqlSession.selectList("chattingMapper.selectChatRoomList");
	}
	
	public int openChatRoom(ChatRoom chatRoom) {
		return sqlSession.insert("chattingMapper.openChatRoom", chatRoom) > 0 ? chatRoom.getChatRoomNo() : 0;
	}
	
	public int joinCheck(ChatRoomJoin join) {
		return sqlSession.selectOne("chattingMapper.joinCheck", join);
	}
	
	public void joinChatRoom(ChatRoomJoin join) {
		sqlSession.insert("chattingMapper.joinChatRoom", join);
	}
	
	public List<ChatMessage> selectChatMessage(int chatRoomNo){
		return sqlSession.selectList("chattingMapper.selectChatMessage", chatRoomNo);
	}
	
	public int insertMessage(ChatMessage chatMessage) {
		return sqlSession.insert("chattingMapper.insertMessage", chatMessage);
	}
	
	public int exitChatRoom(ChatRoomJoin join) {
		return sqlSession.delete("chattingMapper.exitChatRoom", join);
	}
	
	// 채팅방 인원수
	public int countChatRoomMember(int chatRoomNo){
		return sqlSession.selectOne("chattingMapper.countChatRoomMember", chatRoomNo);
	}
	
	//채팅방 닫기
	public int closeChatRoom(int chatRoomNo) {
		return sqlSession.update("chattingMapper.closeChatRoom", chatRoomNo);
	}
}
