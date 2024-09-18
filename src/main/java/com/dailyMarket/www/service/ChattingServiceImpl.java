package com.dailyMarket.www.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dailyMarket.www.dao.ChattingDAO;
import com.dailyMarket.www.vo.ChattingRoomVO;

@Service
public class ChattingServiceImpl implements ChattingService{
	
	@Autowired
	private ChattingDAO chattingDAO;
	
	@Override
	public List<ChattingRoomVO> selectChattingList(int memberNo ) throws Exception {
		return chattingDAO.selectChattingList(memberNo);
	}
	
	

}
