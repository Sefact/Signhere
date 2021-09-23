package com.signhere.utils;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.server.ServerHttpRequest;
import org.springframework.http.server.ServerHttpResponse;
import org.springframework.web.socket.WebSocketHandler;
import org.springframework.web.socket.server.support.HttpSessionHandshakeInterceptor;

public class HandshakeInterceptor extends HttpSessionHandshakeInterceptor {
	@Autowired
	Session ssn;
	
	@Override
	public boolean beforeHandshake(ServerHttpRequest request, ServerHttpResponse response, WebSocketHandler wasHandler,
			Map<String, Object> attributes) throws Exception{
		
		System.out.println("before handshake");
		
		attributes.put("userId", ssn.getAttribute("userId"));
		
		
		return super.beforeHandshake(request, response, wasHandler, attributes);
	}
	
	@Override
	public void afterHandshake(ServerHttpRequest request,ServerHttpResponse response, WebSocketHandler wasHandler, Exception ex) {
		System.out.println("after handshake");
		
		super.afterHandshake(request, response, wasHandler, ex);
	}
}
