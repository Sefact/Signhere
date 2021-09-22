package com.signhere.mapper;

import java.util.List;

import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.servlet.ModelAndView;
import com.signhere.beans.DocumentBean;

public interface DocumentInter {
 
	public ModelAndView myDraft(DocumentBean db); 
	public ModelAndView myEnforceMent(DocumentBean db); 
	public ModelAndView apToDoList(DocumentBean db);
	public ModelAndView apIngList(DocumentBean db);
	public ModelAndView apCompleteList(DocumentBean db);
	public ModelAndView apReturnList(DocumentBean db);
	public ModelAndView deferList(DocumentBean db);
	public ModelAndView apReferenceList(DocumentBean db);
	public ModelAndView receiveList(DocumentBean db);
	public ModelAndView myList(DocumentBean db);
	public List<DocumentBean> searchText(@RequestBody DocumentBean db);

	
}
