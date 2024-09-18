package com.dailyMarket.www.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.dailyMarket.www.vo.ChattingRoomVO;

@Repository
public class ChattingDAOImpl implements ChattingDAO{

	@Autowired
	private SqlSession session;
	
	@Override
	public List<ChattingRoomVO> selectChattingList(int memberNo) throws Exception {
		return session.selectList("ChattingMapper.selectChattingList",memberNo);
	}

	
}
