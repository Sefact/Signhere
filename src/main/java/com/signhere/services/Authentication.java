package com.signhere.services;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import com.signhere.beans.AccessBean;
import com.signhere.beans.DocumentBean;
import com.signhere.beans.UserBean;
import com.signhere.mapper.FriendsInter;

@Service
public class Authentication implements FriendsInter {
	@Autowired
	SqlSessionTemplate sqlSession;
	ModelAndView mav;
	
	@Override
	public ModelAndView insUser(UserBean ub) {
		mav = new ModelAndView();
		System.out.println(ub.getUserId());
		
		sqlSession.insert("insertUser", ub);
		
		return mav;
	}
	
	public ModelAndView mLogin(AccessBean ab) {
		mav = new ModelAndView();
		
		mav.setViewName("login/main");
		//mav.setViewName("myInfo");
		
		return mav;
	}
	
	public ModelAndView mLogOut() {
		mav = new ModelAndView();
		
		mav.setViewName("home");
		
		return mav;
	}
	
	public ModelAndView mJoinRequest(UserBean ub) {
		mav = new ModelAndView();
		
		mav.setViewName("home");
		//mav.setViewName("redirect:/");
		
		return mav;
	}
	
	public ModelAndView mUpdateMemberTable(UserBean ub) {
		mav = new ModelAndView();
		
		mav.setViewName("main");
		//mav.setViewName("redirect:/");
		
		return mav;
	}
	
	public ModelAndView mCallFindPwd(UserBean ub) {
		mav = new ModelAndView();
		
		mav.setViewName("home");
		//mav.setViewName("redirect:/");
		
		return mav;
	}
	
	public ModelAndView mConfirmPwd(UserBean ub) {
		mav = new ModelAndView();
		
		mav.setViewName("home");
		//mav.setViewName("redirect:/");
		
		return mav;
	}
	
	public ModelAndView mMyInfoConfirm(UserBean ub) {
		mav = new ModelAndView();
		
		mav.setViewName("myInfo");
		//mav.setViewName("redirect:/");
		
		return mav;
	}
	
	public ModelAndView mMyInfoDup(UserBean ub) {
		mav = new ModelAndView();
		
		mav.setViewName("redirect:/");
		
		return mav;
	}
	
	public List<UserBean> mOrgChart(UserBean ub) {
		List<UserBean> userList;
		
		ub.setDpCode(ub.getCompany().get(0).getCmCode());
		
		userList = sqlSession.selectList("selOrgChart", ub);
		
		System.out.println(userList);
		
		return userList;
	}
	
	public List<DocumentBean> mAlarm(DocumentBean db) {
		List<DocumentBean> docList;
		
		docList = null;
		
		return docList;
	}
}
