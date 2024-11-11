package com.dailyMarket.www.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.dailyMarket.www.service.ChattingService;
import com.dailyMarket.www.vo.AdminChatVO;
import com.dailyMarket.www.vo.ChatJoinVO;
import com.dailyMarket.www.vo.ChatMessageVO;
import com.dailyMarket.www.vo.ChatRoomVO;

@Controller
public class ChattingController {

	
	@Autowired
	private ChattingService chattingService;
	
	//채팅방 목록
	@RequestMapping(value = "/chat/roomList",method = RequestMethod.GET)
	public String getChattingRoom(Model model,HttpSession session)throws Exception{

		List<ChatRoomVO> chatRoomList = chattingService.selectChatRoomList();
		model.addAttribute("list",chatRoomList);
		
		int userNo = (int)session.getAttribute("userNo");
		
		List<AdminChatVO> adminChatList = chattingService.selectAdminChatList(userNo);
		model.addAttribute("adminList",adminChatList);
		
		return "chat/chatRoomList";
	}
	
	//채팅방 만들기
	@ResponseBody
	@RequestMapping(value = "/chat/openChatRoom",method = RequestMethod.POST)
	public int postOpenChatRoom(HttpSession session,ChatRoomVO room,@RequestParam("title")String title
									,@RequestParam("targetUserNo")int targetUserNo
									,@RequestParam("userType")String userType)throws Exception{
		int userNo = (int)session.getAttribute("userNo");
		room.setUserNo(userNo);
		room.setTitle(title);
		room.setUserType(userType);
		room.setTargetUserNo(targetUserNo);
		
		chattingService.insertChatRoom(room);
		
		return chattingService.selectChatRoomTotalCnt(userNo);
	}
	
	//채팅방 입장
	@RequestMapping(value="/chat/room", method=RequestMethod.GET)
	public String getJoinChatRoom(Model model,@RequestParam("roomNo")int roomNo,ChatJoinVO chatJoinVO,HttpSession session) throws Exception{
		int userNo = (int)session.getAttribute("userNo");
		chatJoinVO.setUserNo(userNo);
		chatJoinVO.setRoomNo(roomNo);	
		
		List<ChatMessageVO> list = chattingService.insertJoinChatRoom(chatJoinVO);
	
		model.addAttribute("list",list);
		model.addAttribute("roomNo",roomNo);
		
		List<ChatJoinVO> joinMsg= chattingService.selectChatJoinMsg(chatJoinVO);
		model.addAttribute("joinMsg",joinMsg);
		
		List<ChatJoinVO> exitMsg = chattingService.selectChatExitMsg(chatJoinVO);
		model.addAttribute("exitMsg",exitMsg);
		
		return "chat/chatRoom";
		
	}
	
	//메세지 보내기
	@ResponseBody
	@RequestMapping(value = "/chat/room",method =RequestMethod.POST )
	public String postChatSendMessage(ChatMessageVO chattingMessageVO,HttpSession session
			,@RequestParam("userNo")int userNo
			,@RequestParam("roomNo")int roomNo,@RequestParam("message")String message)throws Exception{
		
	
		
		chattingMessageVO.setUserNo(userNo);
		chattingMessageVO.setRoomNo(roomNo);
		chattingMessageVO.setMessage(message);
		
		chattingService.insertMessage(chattingMessageVO);
		
		return "Send Message Success";
	}
	
	//채팅방 나가기
	@ResponseBody
	@RequestMapping(value = "/chat/exit" ,method = RequestMethod.POST)
	public String exitChatRoom(ChatJoinVO chatJoinVO,HttpSession session,@RequestParam("roomNo")int roomNo) throws Exception {
		int userNo = (int)session .getAttribute("userNo");
		
		chatJoinVO.setUserNo(userNo);
		chatJoinVO.setRoomNo(roomNo);
		
		chattingService.updateChatRoomDel(chatJoinVO);
		
		return "ChattingRoom Exit";
		
	}
	
}
