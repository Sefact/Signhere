package com.signhere.mapper;

import java.util.List;

import org.springframework.web.servlet.ModelAndView;

import com.signhere.beans.DocumentBean;


public interface DocumentInter {
	public ModelAndView myDraft(DocumentBean db); 
	public ModelAndView myEnforceMent(DocumentBean db); 
	//ssm
	public ModelAndView receiveList(DocumentBean db);
}


