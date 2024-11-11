package com.dailyMarket.www.utils;

import java.util.ArrayList;
import java.util.Collections;
import java.util.Date;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.socket.BinaryMessage;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.PongMessage;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.config.annotation.EnableWebSocket;
import org.springframework.web.socket.config.annotation.WebSocketHandlerRegistry;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import com.dailyMarket.www.service.ChattingService;
import com.dailyMarket.www.vo.ChatMessageVO;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.google.gson.Gson;

@Configuration
@EnableWebSocket
public class ChattingWebSocketHandler extends TextWebSocketHandler{


 @Autowired
 private ChattingService service;

 private Set<WebSocketSession> sessions = Collections.synchronizedSet(new HashSet<WebSocketSession>());
	 
	 
	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {
		sessions.add(session);
	}
	
	@Override
	protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
	
		ObjectMapper objectMapper = new ObjectMapper();
		
		ChatMessageVO chatMessage = objectMapper.readValue(message.getPayload(),ChatMessageVO.class);
	
		chatMessage.setCreateDate(new Date(System.currentTimeMillis()));
	
		int result = service.insertMessage(chatMessage);
		
		if(result>0) {
			
			for(WebSocketSession s : sessions) {
				
				int chatRoomNo = (Integer)s.getAttributes().get("roomNo");
				
				if(chatRoomNo==chatMessage.getRoomNo()) {
					s.sendMessage(new TextMessage(new Gson().toJson(chatMessage)));
				}
			}
		}
	
	}
	
	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
		sessions.remove(session);
	}
	
}
