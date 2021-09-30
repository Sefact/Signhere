package com.signhere.mapper;

import java.util.List;

import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.servlet.ModelAndView;
import com.signhere.beans.DocumentBean;
import com.signhere.services.Criteria;

public interface DocumentInter {
	public ModelAndView myDraft(Criteria cri); 
	public ModelAndView myEnforceMent(Criteria cri); 
	public ModelAndView apToDoList(Criteria cri);
	public ModelAndView apIngList(Criteria cri);
	public ModelAndView apCompleteList(Criteria cri);
	public ModelAndView apReturnList(Criteria cri);
	public ModelAndView deferList(Criteria cri);
	public ModelAndView apReferenceList(Criteria cri);
	public ModelAndView receiveList(Criteria cri);
	public ModelAndView myList(Criteria cri);
	public List<DocumentBean> searchText(@RequestBody DocumentBean db, Criteria cri);
}
