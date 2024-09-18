package com.dailyMarket.www.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.dailyMarket.www.service.ChattingService;
import com.dailyMarket.www.vo.ChattingRoomVO;

@Controller
public class ChattingController {

	
	@Autowired
	private ChattingService chattingService;
	
	@RequestMapping(value = "/chatting")
	public String getChattingList(HttpSession session,Model model,ChattingRoomVO chattingRommVO)throws Exception{
		int memberNo = (int)session.getAttribute("userNo");
		
		List<ChattingRoomVO> list = chattingService.selectChattingList(memberNo);
		model.addAttribute("list",list);
		
		return "chatting/chatting";
	}
	
}
