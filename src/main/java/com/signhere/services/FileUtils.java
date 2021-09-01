package com.signhere.services;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import com.signhere.beans.ApprovalBean;
import com.signhere.beans.ApprovalCommentBean;
import com.signhere.beans.CompanionDeferBean;
import com.signhere.beans.DocumentBean;
import com.signhere.beans.ReadingReferenceBean;
import com.signhere.beans.UserBean;

@Service
public class FileUtils {
	@Autowired
	SqlSessionTemplate sqlSession;
	ModelAndView mav;
	
	public List<DocumentBean>  mPreview(List<DocumentBean> dlist) {
		List<DocumentBean> docList;
		
		docList = null;
		
		return docList;
	}
	
	
	public ModelAndView mRequestDraft(DocumentBean db) {
		mav = new ModelAndView();
		
		mav.setViewName("");
		return mav;
	}
	
	public ModelAndView mApproval(ApprovalBean ab, ApprovalCommentBean acb) {
		mav = new ModelAndView();
		
		mav.setViewName("");
		return mav;
	}
	
	public ModelAndView mCompanion(DocumentBean db, CompanionDeferBean cdb) {
		mav = new ModelAndView();
		
		mav.setViewName("");
		return mav;
	}
	
	public ModelAndView mDefer(DocumentBean db, CompanionDeferBean cdb) {
		mav = new ModelAndView();
		
		mav.setViewName("");
		return mav;
	}
	
	public ModelAndView mDraftCancel(DocumentBean db) {
		mav = new ModelAndView();
		
		mav.setViewName("");
		return mav;
	}
	
	public List<UserBean> mViewDraft(UserBean ub) {
		List<UserBean> userList;
		
		userList = null;
		
		return userList;
	}
	
	public ModelAndView mReadingAuthority(UserBean ub) {
		mav = new ModelAndView();
		
		mav.setViewName("");
		return mav;
	}
	
	public ModelAndView mGrantAuthority(ReadingReferenceBean rb) {
		mav = new ModelAndView();
		
		mav.setViewName("");
		return mav;
	}
	
	public List<DocumentBean> mDocumentBox(DocumentBean dlist) {
		List<DocumentBean> docList;
		
		docList = null;
		return docList;
	}
	
}
