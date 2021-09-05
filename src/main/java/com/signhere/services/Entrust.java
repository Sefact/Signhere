package com.signhere.services;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import com.signhere.beans.EntrustBean;
import com.signhere.beans.UserBean;
import com.signhere.mapper.EntrustInter;

@Service
public class Entrust {
	@Autowired
	SqlSessionTemplate sqlSession;
	ModelAndView mav;
	EntrustInter ent;
	
	
	public ModelAndView mSetEntrust(EntrustBean eb) {
		mav = new ModelAndView();
		
		mav.setViewName("document/setEntrust");
		
		return mav;
	}
	
	public List<UserBean> mMandatary(UserBean ub) {
		List<UserBean> userList;
		
		ub.setAdmin(ub.getCompany().get(0).getCmCode());
		
		userList = sqlSession.selectList("selReceiver", ub);
		
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
