package com.signhere.mapper;

import org.springframework.web.servlet.ModelAndView;

import com.signhere.beans.AccessBean;
import com.signhere.beans.UserBean;

public interface FriendsInter {
	public ModelAndView mLogin(AccessBean ab);
	public ModelAndView mLogin(UserBean ub);
	
}
