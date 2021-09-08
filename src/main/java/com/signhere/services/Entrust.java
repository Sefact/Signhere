package com.signhere.services;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
	
	public ModelAndView mSetEntrust(Criteria cri) {
		mav = new ModelAndView();
		
		mav.setViewName("document/setEntrust");
		
		Pagination pagination = new Pagination();
		pagination.setCri(cri);
		pagination.setTotalCount((Integer) sqlSession.selectOne("countEntrustList"));
		
		List<Map<String, Object>> entrustList = sqlSession.selectList("selEntrustList", cri);
		List<EntrustBean> tbEntrustList = sqlSession.selectList("selEntrust");
		
		mav.addObject("entrustList", entrustList);
		mav.addObject("pagination", pagination);
		mav.addObject("tableEntrust", tbEntrustList);
		
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
		
		sqlSession.insert("insEntrust", eb);
		
		List<EntrustBean> entrustList = sqlSession.selectList("selEntrust", eb);
		
		mav.addObject("entrustList", entrustList);
		mav.setViewName("jsonView");
		
		return mav;
	}
	
	public ModelAndView mDisCheckEntrust(EntrustBean eb) {
		mav = new ModelAndView();
		
		System.out.println(eb.getEtNum());
		
		String etNum = eb.getEtNum();
		
		if(etNum != null) {
			sqlSession.delete("delEntrust", eb);
		}
		
		mav.setViewName("redirect:/setEntrust");
		
		return mav;
	}
}
