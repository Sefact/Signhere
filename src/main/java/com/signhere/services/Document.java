package com.signhere.services;

import java.util.Calendar;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import com.signhere.beans.DocumentBean;
import com.signhere.beans.UserBean;

@Service
public class Document {
	@Autowired
	SqlSessionTemplate sqlSession;
	ModelAndView mav;
	
	
	public ModelAndView mSearchText(DocumentBean db){
		System.out.println("mSearchText.java");
		mav = new ModelAndView();
		/*
		 * a= 내가보낸결재
		 * b= 내가보낸 시행문
		 * c= 결재대기함
		 * d=결재진행함
		 * e=완료문서함
		 * f=반려문서함
		 * g=보류문서함
		 * h=참조열람문서함
		 * i=공문수신함
		 * j=개인보관함
		 * k=결재문서관리
		 * */
		
		//여기서 sessino에 들어간 cmCode 저장
		db.setSearchCode('k');
		db.setCmCode("1234567890");
		List<DocumentBean> tmplist;
		
		switch(db.getSearchCode()) {
		case 'a':
			break;
		case 'b':
			break;
		case 'c':
			break;
		case 'd':
			break;
		case 'e':
			break;
		case 'f':
			break;
		case 'g':
			break;
		case 'h':
			break;
		case 'i':
			break;
		case 'j':
			break;
		case 'k':
			tmplist = this.selectAllCompletedDocs(db);
			System.out.println(tmplist.get(0));
			mav.addObject("searchedList","임의값");
			mav.setViewName("aplistAdmin");
			break;
		default:
			break;
		}
		
		return mav;
	}
	
	public List<DocumentBean> selectAllCompletedDocs(DocumentBean db){
		System.out.println("selectAllCompleteDocs");
		if(db.getDmNum().isEmpty()) {
			db.setDmNum("");
		}
		if(db.getDmTitle().isEmpty()) {
			db.setDmTitle("");
		}
		if(db.getDmCode().isEmpty()) {
			db.setDmCode("");
		}
		if(db.getApCode().isEmpty()) {
			db.setApCode("");
		}
		if(db.getDmDate().isEmpty()) {
			db.setDmDate("20210101");
		}
		if(db.getDmDate2().isEmpty()) {
			db.setDmDate2(this.getToday());
		}
		
		
		List<DocumentBean> list;
		list = sqlSession.selectList("selectAllCompletedDocs", db);
		
		
		
		return list;
	}
	
	public List<UserBean> mWriteDraft(UserBean ub) {
		List<UserBean> userList;
		
		userList = null;
		
		return userList;
	}
	
	public ModelAndView mConfirmDraft(DocumentBean db) {
		mav = new ModelAndView();
		
		mav.setViewName("writeDraft");
		
		return mav;
	}
	
	public List<DocumentBean> mModifyDraft(DocumentBean db) {
		List<DocumentBean> docList;
		
		docList = null;
		
		return docList;
	}
	
	public ModelAndView mDraftPage(DocumentBean db) {
		mav = new ModelAndView();
		
		mav.setViewName("redirect:/");
		
		return mav;
	}
	
	private String getToday() {
		Calendar cal = Calendar.getInstance();
		String year = cal.get(Calendar.YEAR)+"";
		String month = (cal.get(Calendar.MONTH)+1)+"";
		if(month.length()<2) {
			month = "0"+month;
		}
		String date = cal.get(Calendar.DATE)+"";
		if(date.length()<2) {
			date = "0"+date;
		}
		
		String today = year+month+date;
		
		return today;
	}
}