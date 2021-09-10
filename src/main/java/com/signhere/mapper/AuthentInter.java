package com.signhere.mapper;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.servlet.ModelAndView;

import com.signhere.beans.AccessBean;

public interface AuthentInter {
	public ModelAndView mLogin(HttpServletRequest req, AccessBean ab);
}
