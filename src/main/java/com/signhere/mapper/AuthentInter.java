package com.signhere.mapper;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.servlet.ModelAndView;

import com.signhere.beans.AccessBean;
import com.signhere.beans.DocumentBean;

public interface AuthentInter {
	public ModelAndView mLogin(HttpServletRequest req, AccessBean ab);
	public void mainChart(DocumentBean db);
}
