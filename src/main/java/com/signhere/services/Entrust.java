package com.signhere.services;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import com.signhere.beans.EntrustBean;
import com.signhere.beans.UserBean;

@Service
public class Entrust {
	@Autowired
	SqlSessionTemplate sqlSession;
	ModelAndView mav;
	
	public ModelAndView mSetEntrust(EntrustBean eb) {
		mav = new ModelAndView();
		
		mav.setViewName("setEntrust");
		
		return mav;
	}
	
	public List<UserBean> mMandatary(UserBean ub) {
		List<UserBean> userList;
		
		userList = null;
		
		return userList;
	}
	
	public ModelAndView mSaveEntrust(EntrustBean eb) {
		mav = new ModelAndView();
		
		mav.setViewName("redirect:/");
		
		return mav;
	}
	
	public ModelAndView mDisCheckEntrust(EntrustBean eb) {
		mav = new ModelAndView();
		
		mav.setViewName("redirect:/");
		
		return mav;
	}
}