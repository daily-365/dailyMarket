package com.dailyMarket.www.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.dailyMarket.www.vo.AdminChatVO;
import com.dailyMarket.www.vo.ChatJoinVO;
import com.dailyMarket.www.vo.ChatMessageVO;
import com.dailyMarket.www.vo.ChatRoomVO;


@Repository
public class ChattingDAOImpl implements ChattingDAO{

	@Autowired
	private SqlSession sqlSession;

	//채팅방 목록 조회
	@Override
	public List<ChatRoomVO> selectChatRoomList() throws Exception {
		return sqlSession.selectList("chattingMapper.selectChatRoomList");
	}

	//채팅방 번호
	@Override
	public int selectChatRoomTotalCnt(int userNo) throws Exception {
		return sqlSession.selectOne("chattingMapper.selectChatRoomTotalCnt",userNo);
	}

	//채빙방 개설
	@Override
	public int insertChatRoom(ChatRoomVO room) throws Exception {
		
		int result = sqlSession.insert("chattingMapper.insertChatRoom",room);
		
		if(result>0) return room.getRoomNo();
				return 0;
	}

	//채팅방 참여 여부 
	@Override
	public int selectJoinChk(ChatJoinVO join) throws Exception {
		return sqlSession.selectOne("chattingMapper.selectJoinChk",join);
	}
	
	//채팅방 참여 메세지
	@Override
	public List<ChatJoinVO> selectChatJoinMsg(ChatJoinVO join) throws Exception {
		return sqlSession.selectList("chattingMapper.selectChatJoinMsg",join);
	}

	//채팅방 참여하기
	@Override
	public void insertJoinChatRoom(ChatJoinVO join) throws Exception {
		sqlSession.insert("chattingMapper.insertJoinChatRoom",join);
		
	}

	//채팅방 목록조회
	@Override
	public List<ChatMessageVO> selectChatMessage(int roomNo) throws Exception {
		return sqlSession.selectList("chattingMapper.selectChatMessage",roomNo);
	}

	//채팅 메세지 삽입
	@Override
	public int insertMessage(ChatMessageVO chatMessageVO) throws Exception {
		return sqlSession.insert("chattingMapper.insertMessage",chatMessageVO);
	}

	//채팅방 나가기
	@Override
	public void updateChatRoomDel(ChatJoinVO join) throws Exception {
		sqlSession.selectOne("chattingMapper.updateChatRoomDel",join);
	}

	//채팅방 퇴장 메세지
	@Override
	public List<ChatJoinVO> selectChatExitMsg(ChatJoinVO join) throws Exception {
		return sqlSession.selectList("chattingMapper.selectChatExitMsg",join);
	}

	//채팅방 인원 수 확인
	@Override
	public int selectChatRoomUserCnt(int roomNo) throws Exception {
		return sqlSession.selectOne("chattingMapper.selectChatRoomUserCnt",roomNo);
	}


	//채팅방 닫기
	@Override
	public void updateChatRoomClose(int roomNo) throws Exception {
		sqlSession.update("chattingMapper.updateChatRoomClose",roomNo);
	}

	//사장님과의 채팅
	@Override
	public List<AdminChatVO> selectAdminChatList(int userNo) throws Exception {
		return sqlSession.selectList("chattingMapper.selectAdminChatList",userNo);
	}

	


	
	
}
