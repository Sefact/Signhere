package com.signhere.mapper;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.servlet.ModelAndView;

import com.signhere.beans.AccessBean;
import com.signhere.beans.DocumentBean;

public interface AuthentInter {
	public ModelAndView mLogin(HttpServletRequest req, AccessBean ab);
	public int waitApprovalChart(DocumentBean db);
}
