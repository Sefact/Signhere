package com.signhere.services;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import com.signhere.beans.DocumentBean;
import com.signhere.beans.UserBean;

@Service
public class Document {
	@Autowired
	SqlSessionTemplate sqlSession;
	ModelAndView mav;
	
	public List<UserBean> mWriteDraft(UserBean ub) {
		List<UserBean> userList;
		
		userList = null;
		
		return userList;
	}
	
	public ModelAndView mConfirmDraft(DocumentBean db) {
		mav = new ModelAndView();
		
		mav.setViewName("writeDraft");
		
		return mav;
	}
	
	public List<DocumentBean> mModifyDraft(DocumentBean db) {
		List<DocumentBean> docList;
		
		docList = null;
		
		return docList;
	}
	
	public ModelAndView mDraftPage(DocumentBean db) {
		mav = new ModelAndView();
		
		mav.setViewName("redirect:/");
		
		return mav;
	}
}