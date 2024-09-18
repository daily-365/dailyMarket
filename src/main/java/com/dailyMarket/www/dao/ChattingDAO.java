package com.dailyMarket.www.dao;

import java.util.List;

import com.dailyMarket.www.vo.ChattingRoomVO;

public interface ChattingDAO {

	public List<ChattingRoomVO> selectChattingList(int memberNo)throws Exception;
}
