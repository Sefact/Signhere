package com.signhere.main;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.servlet.ModelAndView;

import com.signhere.beans.ApprovalBean;
import com.signhere.beans.ApprovalCommentBean;
import com.signhere.beans.CompanionDeferBean;
import com.signhere.beans.DocumentBean;
import com.signhere.beans.ReadingReferenceBean;
import com.signhere.beans.UserBean;
import com.signhere.services.FileUtils;

@Controller
public class TextController {
	@Autowired
	private FileUtils fut;
	private ModelAndView mav;
	
	
	@PostMapping("preview")
	public List<DocumentBean> preview(@RequestBody List<DocumentBean> dlist) {
		
		dlist =fut.mPreview(dlist);
		
		return dlist;
	}
	
	@PostMapping("requestdraft")
	public ModelAndView requestdraft(DocumentBean db) {
		 mav = fut.mRequestDraft(db);
		
		return mav;
	}
	
	@PostMapping("approval")
	public ModelAndView approval(ApprovalBean ab, ApprovalCommentBean acb) {
		
		mav =fut.mApproval(ab, acb);
				
		return mav;
	}
	
	@PostMapping("compaonion")
	public ModelAndView compaonion(DocumentBean db, CompanionDeferBean cdb) {
		mav = fut.mCompanion(db, cdb);
		
		return mav;
	}

	@PostMapping("defer")
	public ModelAndView defer(DocumentBean db, CompanionDeferBean cdb) {	
		mav =fut.mDefer(db, cdb);
		
		return mav;
	}

	@PostMapping("draftCancel")
	public ModelAndView draftCancel(DocumentBean db) {
		mav = fut.mDraftCancel(db);
		
		return mav;
	}

	@PostMapping("viewDrafter")
	public List<UserBean> viewDrafter (@ModelAttribute UserBean ub) {
		
		return fut.mViewDraft(ub);
	}

	@PostMapping("readingAuthority")
	public ModelAndView readingAuthority(UserBean ub) {
		
		mav = fut.mReadingAuthority(ub);
		
		return mav;
	}

	@PostMapping("grantAuthority")
	public ModelAndView grantAuthority(ReadingReferenceBean rb) {
		
		mav = fut.mGrantAuthority(rb); 
				
		return mav;
	}
	
//9월1일 수정
	@PostMapping("documentBox")
	public List<DocumentBean> documentBox(@ModelAttribute DocumentBean dlist) {

		return fut.mDocumentBox(dlist);
	}
}
