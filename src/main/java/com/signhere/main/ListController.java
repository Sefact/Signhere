package com.signhere.main;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.ModelAndView;

import com.signhere.beans.DocumentBean;
import com.signhere.services.Document;

@Controller
public class ListController {
	@Autowired
	private Document doc;
	private ModelAndView mav;
	
	@Autowired
	SqlSession sqlSession;
	
	@PostMapping("/myDraft")
	public ModelAndView myDraft(DocumentBean db) {
		  
		sqlSession.selectList("myDraft", db);
	
		mav.setViewName("myDraft");
			return mav;
	}
	
	@PostMapping("/myEnforceMent")
	public ModelAndView myEnforceMent(DocumentBean db) {
		
		mav.setViewName("myEnforceMent");
		return mav;
	}
	
	@PostMapping("/apToDoList")
	public ModelAndView apToDoList(DocumentBean db) {
		
		
		mav.setViewName("apToDoList");
		return mav;
	}
	
	@PostMapping("/apIngList")
	public ModelAndView apIngList(DocumentBean db) {
		
		
		mav.setViewName("apIngList");
		return mav;
	}
	
	@PostMapping("/apReturnList")	
	public ModelAndView apReturnList(DocumentBean db) {
		
		mav.setViewName("apReturnList");
		return mav;
	}
	
	@PostMapping("/deferList")
	public ModelAndView deferList(DocumentBean db) {
		
		
		mav.setViewName("deferList");
		return mav;
	}
	
	@PostMapping("/apReferenceList")
	public ModelAndView apReferenceList(DocumentBean db) {
		
		mav.setViewName("apReferenceList");
		return mav;
	}
	
	@PostMapping("/apCompleteList")
	public ModelAndView apCompleteList(DocumentBean db) {
		
		mav.setViewName("apCompleteList");
		return mav;
	}
	
	@PostMapping("/myList")
	public ModelAndView myList(DocumentBean db) {	
		mav.setViewName("myList");
		return mav;
	}
	
	@PostMapping("/goMyList")
	public ModelAndView goMyList(DocumentBean db) {
		
		mav.setViewName("myList");
		return mav;
	}
	
	@PostMapping("/delMyList")
	public ModelAndView delMyList(DocumentBean db) {
		
		mav.setViewName("myList");
		return mav;
	}

	@PostMapping("/searchText")
	public List<DocumentBean> searchText(DocumentBean db) {
		
		
		return null;
	}
	
	@PostMapping("/moveAjaxPage")
	public List<DocumentBean> moveAjaxPage(DocumentBean db) {
		
		
		return null;
	}
	
	@PostMapping("/receiveList")
	public ModelAndView receiveList(DocumentBean db) {
		
		mav.setViewName("receiveList");
		return mav;
	}
}	