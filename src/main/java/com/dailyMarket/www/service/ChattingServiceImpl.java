package com.dailyMarket.www.service;

import java.util.List;

import org.apache.ibatis.javassist.bytecode.analysis.Util;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.dailyMarket.www.dao.ChattingDAO;
import com.dailyMarket.www.vo.AdminChatVO;
import com.dailyMarket.www.vo.ChatJoinVO;
import com.dailyMarket.www.vo.ChatMessageVO;
import com.dailyMarket.www.vo.ChatRoomVO;

@Service
public class ChattingServiceImpl implements ChattingService{
	
	@Autowired
	private ChattingDAO chattingDAO;
	
	//채팅방 목록 조회
	@Override
	public List<ChatRoomVO> selectChatRoomList() throws Exception {
		return chattingDAO.selectChatRoomList();
	}
	
	//채팅방 번호
	@Override
	public int selectChatRoomTotalCnt(int userNo) throws Exception {
		return chattingDAO.selectChatRoomTotalCnt(userNo);
	}

	//채팅방 개설
	@Override
	public int insertChatRoom(ChatRoomVO room) throws Exception {
		return chattingDAO.insertChatRoom(room);
	}

	//채팅방 입장 + 내용 얻어오기
	@Override
	public List<ChatMessageVO> insertJoinChatRoom(ChatJoinVO chatJoinVO)throws Exception{
		int result = chattingDAO.selectJoinChk(chatJoinVO);
		
		if(result==0) {
			chattingDAO.insertJoinChatRoom(chatJoinVO);
		}
		return chattingDAO.selectChatMessage(chatJoinVO.getRoomNo());
	}

    //채팅방 참여 메세지
	@Override
	public List<ChatJoinVO> selectChatJoinMsg(ChatJoinVO join) throws Exception {
		return chattingDAO.selectChatJoinMsg(join);
	}


	//채팅 메세지 삽입
	@Override
	public int insertMessage(ChatMessageVO chatMessageVO) throws Exception {
		chatMessageVO.setMessage(chatMessageVO.getMessage());
		return chattingDAO.insertMessage(chatMessageVO);
	}
 
	//채팅방 나가기
	@Override
	public void updateChatRoomDel(ChatJoinVO join) throws Exception {
		chattingDAO.updateChatRoomDel(join);
		
		int cnt = chattingDAO.selectChatRoomUserCnt(join.getRoomNo());
		
		//사용자가 모두 나갔을때 채팅방 삭제
		if(cnt==0) {
			chattingDAO.updateChatRoomClose(join.getRoomNo());
		}
	
	}

	//채팅방 퇴장 메세지
	@Override
	public List<ChatJoinVO> selectChatExitMsg(ChatJoinVO join) throws Exception {
		return chattingDAO.selectChatExitMsg(join);
	}

	//사장님과의 채팅
	@Override
	public List<AdminChatVO> selectAdminChatList(int userNo) throws Exception {
		return chattingDAO.selectAdminChatList(userNo);
	}

	





}
