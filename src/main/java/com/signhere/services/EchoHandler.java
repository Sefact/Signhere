package com.signhere.services;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import com.signhere.utils.Session;

@Controller
public class EchoHandler extends TextWebSocketHandler {
	@Autowired
	Session ssn;
	
	//로그인 전체 session
	List<WebSocketSession> sessions = new ArrayList<WebSocketSession>();
	
	Map<String, WebSocketSession> userSessionMap = new HashMap<String, WebSocketSession>();
	
	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception{
		System.out.println("실제 websocket handler class임.");
		
		sessions.add(session);
		
		Map<String, Object> map = session.getAttributes();
		String id = (String)map.get("userId");
		System.out.println(id);
		
		userSessionMap.put("userId", session);
	}
	
	@Override
	protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception{
		
	}
	
	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception{
		userSessionMap.remove(session.getId());
		sessions.remove(session);
	}


}
