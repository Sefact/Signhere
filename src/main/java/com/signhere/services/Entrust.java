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
import com.signhere.utils.Session;

@Service
public class Entrust {
	@Autowired
	SqlSessionTemplate sqlSession;
	@Autowired
	Session ssn;
	ModelAndView mav;
	EntrustInter ent;
	
	public ModelAndView mSetEntrust(Criteria cri) {
		mav = new ModelAndView();
		
		try {
			cri.setSenderId((String)ssn.getAttribute("userId"));
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		Pagination pagination = new Pagination();
		pagination.setCri(cri);
		pagination.setTotalCount((Integer) sqlSession.selectOne("countEntrustList", cri));
		
		List<Map<String, Object>> entrustList = sqlSession.selectList("selEntrustList", cri);
		
		mav.setViewName("document/setEntrust");
		mav.addObject("entrustList", entrustList);
		mav.addObject("pagination", pagination);
		
		return mav;
	}
	
	public List<UserBean> mMandatary(UserBean ub) {
		List<UserBean> userList;
		
		ub.setAdmin(ub.getCompany().get(0).getCmCode());
		
		try {
			ub.setUserId((String) ssn.getAttribute("userId"));
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		userList = sqlSession.selectList("selReceiver", ub);
		
		return userList;
	}
	
	public ModelAndView mSaveEntrust(EntrustBean eb) {
		mav = new ModelAndView();
		
		try {
			eb.setEtSenderId((String) ssn.getAttribute("userId"));
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		sqlSession.insert("insEntrust", eb);
		
		List<EntrustBean> entrustList = sqlSession.selectList("selEntrust", eb);
		
		mav.addObject("entrustList", entrustList);
		mav.setViewName("jsonView");
		
		return mav;
	}
	
	public ModelAndView mDisCheckEntrust(EntrustBean eb) {
		mav = new ModelAndView();
		List<EntrustBean> entrustList = null;

		String etNum = eb.getEtNum();
		try {
			eb.setEtSenderId((String)ssn.getAttribute("userId"));
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		if(etNum != null) {
			sqlSession.delete("delEntrust", eb);
			entrustList = sqlSession.selectList("selEntrust", eb);
		}
		
		mav.addObject("entrustList", entrustList);
		mav.setViewName("jsonView");
		
		return mav;
	}
}
