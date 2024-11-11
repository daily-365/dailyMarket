package com.dailyMarket.www.service;

import java.util.List;

import com.dailyMarket.www.vo.AdminChatVO;
import com.dailyMarket.www.vo.ChatJoinVO;
import com.dailyMarket.www.vo.ChatMessageVO;
import com.dailyMarket.www.vo.ChatRoomVO;


public interface ChattingService  {

		//체팅방 목록 조회
		public List<ChatRoomVO>selectChatRoomList()throws Exception;
		
		//채팅방 번호 
		public int selectChatRoomTotalCnt(int userNo)throws Exception;
		
		//채팅방 개설
		public int insertChatRoom(ChatRoomVO chatRoomVO)throws Exception;
		
		//채팅방 참여하기
		public List<ChatMessageVO> insertJoinChatRoom(ChatJoinVO join)throws Exception;
		
		//채팅 메세지 삽입
		public int insertMessage(ChatMessageVO chatMessageVO)throws Exception;
		
		//채팅방 나가기
		public void updateChatRoomDel(ChatJoinVO join)throws Exception;
		
		//채팅방 참여 메세지
		public List<ChatJoinVO> selectChatJoinMsg(ChatJoinVO join)throws Exception;
		
		//채팅방 퇴장 메세지
		public List<ChatJoinVO> selectChatExitMsg(ChatJoinVO join)throws Exception;
		
		//사장님과의 채팅
		public List<AdminChatVO>selectAdminChatList(int userNo)throws Exception;
		
}