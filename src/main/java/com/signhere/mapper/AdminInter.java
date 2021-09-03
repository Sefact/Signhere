package com.signhere.mapper;

import org.springframework.web.servlet.ModelAndView;

import com.signhere.beans.UserBean;

public interface AdminInter {
	public ModelAndView mAddEmployee(UserBean ub);
	public String mEmployeeDup(String userId);
	public ModelAndView mDelEmployee(String userId);
	public ModelAndView mUpdateEmployee(UserBean ub);
	public ModelAndView mApListAdmin();
	public ModelAndView mApListRemove(String dmCode);
}
