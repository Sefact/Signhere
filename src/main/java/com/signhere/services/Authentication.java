package com.signhere.services;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import com.signhere.beans.UserBean;
import com.signhere.mapper.FriendsInter;

@Service
public class Authentication implements FriendsInter {
	@Autowired
	SqlSessionTemplate sqlSession;
	
	@Override
	public ModelAndView insUser(UserBean ub) {
		ModelAndView mav;
		mav = null;
		System.out.println(ub.getUserId());
		
		sqlSession.insert("insertUser", ub);
		
		return mav;
	}
}
