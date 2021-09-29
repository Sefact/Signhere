package com.signhere.main;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Service;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.signhere.beans.DocumentBean;
import com.signhere.mapper.DocumentInter;
import com.signhere.services.Criteria;
import com.signhere.services.Document;
import com.signhere.services.Management;
import com.signhere.utils.Session;

@Controller
public class ListController implements DocumentInter {
	@Autowired
	private Document doc;
	private ModelAndView mav;
	
	@Autowired
	SqlSessionTemplate sqlSession;
	
	@Autowired
	Session ssn;
	
	private int chechkNum = 11;
  
	//내가 보낸 기안
	@RequestMapping("/myDraft")
	public ModelAndView myDraft(Criteria cri) {
		mav = new ModelAndView();
		
		mav = doc.myDraft(cri);
		
		// Temporary Check 있을 시 비워주고 없는 경우 콘솔에 에러메시지 출력
		this.tempCheck(cri);
		
	
		return mav;
	}
	
	//내가 보낸 시행
	@RequestMapping("/myEnforceMent")
	public ModelAndView myEnforceMent(Criteria cri) {
		mav = new ModelAndView();
		
		mav = doc.myEnforcement(cri);

		return mav;
	}
	
  	//결제대기함
	@RequestMapping("/apToDoList")
	public ModelAndView apToDoList(Criteria cri) {
		
		mav = doc.apToDoList(cri);
		
		this.tempCheck(cri);
		
		return mav;
	}
	

  	//결제진행함
	@RequestMapping("/apIngList")
	public ModelAndView apIngList(Criteria cri) {
		mav = new ModelAndView();
		
		mav = doc.apIngList(cri);
		this.tempCheck(cri);
		return mav;
	}
	
	//결재완료함
	@RequestMapping("/apCompleteList")
	public ModelAndView apCompleteList(Criteria cri) {
		
		mav = new ModelAndView();
		
		mav = doc.apCompleteList(cri);
		
		this.tempCheck(cri);
		
		return mav;	
	}
	
	//반려함
	@RequestMapping("/apReturnList")
	public ModelAndView apReturnList(Criteria cri) {
		mav = new ModelAndView();		
		
		mav = doc.apReturnList(cri);
		
		this.tempCheck(cri);
		
		return mav;
	}
	
	//보류함
	@RequestMapping("/deferList")
	public ModelAndView deferList(Criteria cri) {
		mav = new ModelAndView();		
		
		mav = doc.deferList(cri);
		
		this.tempCheck(cri);
		
		return mav;
	}
	

  	//참조열람함
	@RequestMapping("/apReferenceList")
	public ModelAndView apReferenceList(Criteria cri) {
		mav = new ModelAndView();
		
		mav = doc.referenceList(cri);
		
		this.tempCheck(cri);
		
		return mav;
	}
	

	//개인보관함	
	@RequestMapping("/myList")
	public ModelAndView myList(Criteria cri) {
		mav = new ModelAndView();
		
    	mav = doc.myList(cri);
    	
    	this.tempCheck(cri);   
    	
    	return mav;
	}
	

	//개인보관함으로 이동시키는 JOB
	@RequestMapping("/goMyList")
	public ModelAndView goMyList(Criteria cri) {
		mav = new ModelAndView();
		
		mav.setViewName("document/myList");
		
		this.tempCheck(cri);
		
		return mav;
	}
	
	//개인보관함에 있는 문서 삭제 JOB
	@RequestMapping("/delMyList")
	public ModelAndView delMyList(DocumentBean db) {
		mav = new ModelAndView();
		
		mav.setViewName("document/myList");
		
		return mav;
	}

	//문서검색 JOB
	@RequestMapping("/searchText")
	@ResponseBody
	public List<DocumentBean> searchText(@RequestBody DocumentBean db,Criteria cri) {
		return doc.mSearchText(db);
	}
	
	//페이지이동 JOB
	@RequestMapping("/moveAjaxPage")
	public List<DocumentBean> moveAjaxPage(DocumentBean db) {
		
		
		return null;
	}
	
	//공문수신함
	@RequestMapping("/receiveList")
	public ModelAndView receiveList(Criteria cri) {
		mav = new ModelAndView();
		
		mav = doc.receiveList(cri);
		
		
		this.tempCheck(cri);
		/*
		List <DocumentBean> docList;
		
		docList=sqlSession.selectList("receiveNotice", cri);
		
		mav.addObject("docList",docList);
		*/
		return mav;
	}
	
	public void tempCheck(Criteria cri) {
		try {
			cri.setSenderId((String) ssn.getAttribute("dmCheck"));
			if(ssn.getAttribute("dmCheck") != null) {
				if(this.convertToBoolean(sqlSession.delete("delTemporary", cri))) {
					ssn.removeAttribute("dmCheck");
				} else {
					System.out.println("Temporary is not Found");
				}
			} else {
				System.out.println("Document Code Session is not Found");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	private boolean convertToBoolean(int result) {
		return result==1 ? true: false;  
	}
}