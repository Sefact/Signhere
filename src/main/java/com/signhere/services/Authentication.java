package com.signhere.services;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import com.signhere.beans.AccessBean;
import com.signhere.beans.UserBean;
import com.signhere.mapper.FriendsInter;

@Service
public class Authentication implements FriendsInter {
	@Autowired
	SqlSessionTemplate sqlSession;
	
	@Override
	public ModelAndView mLogin(AccessBean ab) {
		ModelAndView mav;
		mav = null;
		System.out.println(ab.getUserId());
		
		sqlSession.insert("insertUser", ab);
		
		return mav;
	}
	
	public ModelAndView mlogout() {
		ModelAndView mav;
		return null;
	}
	
	public ModelAndView mJoinRequest(UserBean ub) {
		ModelAndView mav;
		return null;
	}
	
	public ModelAndView mUpdateMemberTable(UserBean ub) {
		ModelAndView mav;
		return null;
	}
	
	public ModelAndView mFindPwd() {
		return null;
	}
	
	public ModelAndView mCallFindPwd(UserBean ub) {
		ModelAndView mav;
		return null;
	}

	
}
