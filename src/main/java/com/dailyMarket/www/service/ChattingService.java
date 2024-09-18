package com.dailyMarket.www.service;

import java.util.List;


import com.dailyMarket.www.vo.ChattingRoomVO;

public interface ChattingService  {

	public List<ChattingRoomVO>selectChattingList(int memberNo)throws Exception;
}
