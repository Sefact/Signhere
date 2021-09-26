package com.signhere.main;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.servlet.ModelAndView;

import com.signhere.beans.AccessBean;
import com.signhere.beans.ApprovalBean;
import com.signhere.beans.ApprovalCommentBean;
import com.signhere.beans.CompanionDeferBean;
import com.signhere.beans.DocumentBean;
import com.signhere.beans.ReadingReferenceBean;
import com.signhere.beans.UserBean;
import com.signhere.services.Document;
import com.signhere.services.FileUtils;
import com.signhere.utils.Session;

@Controller
public class TextController {
	
	
	
	@Autowired
	private FileUtils fut;
	private ModelAndView mav;
	private Session ssn;
	
	private Document doc;
	SqlSessionTemplate sqlSession;
	
	@PostMapping("/preview")
	public List<DocumentBean> preview(@RequestBody List<DocumentBean> dlist) {
		List<DocumentBean> docList;
		
		docList = fut.mPreview(dlist.get(0));
		
		return docList;
	}
	
	@PostMapping("/requestdraft")
	public ModelAndView requestdraft(DocumentBean db) {
		mav = fut.mRequestDraft(db);
		
		return mav;
	}
	
	@PostMapping("/approval")
	public ModelAndView approval(ApprovalBean ab, ApprovalCommentBean acb) {
		mav = fut.mApproval(ab, acb);
		
		return mav;
	}
	
	@PostMapping("/companion")
	public ModelAndView companion(DocumentBean db, CompanionDeferBean cdb) {
		mav = fut.mCompanion(db, cdb);
		
		return mav;
	}
	
	@PostMapping("/defer")
	public ModelAndView defer(ApprovalBean ab, CompanionDeferBean cdb) {
		mav = fut.mDefer(ab, cdb);
		
		return mav;
	}
	
	@PostMapping("/draftCancel")
	public ModelAndView draftCancel(DocumentBean db) {
		mav = fut.mDraftCancel(db);
		
		return mav;
	}
	
	@PostMapping("/viewDrafter")
	public List<UserBean> viewDrafter(@RequestBody List<UserBean> ulist) {
		List<UserBean> userList;
		
		userList = fut.mViewDraft(ulist.get(0));
		
		return userList;
	}
	
	@PostMapping("/readingAuthority")
	public ModelAndView readingAuthority(UserBean ub) {
		mav = fut.mReadingAuthority(ub);
		
		return mav;
	}
	
	@PostMapping("/grantAuthority")
	public ModelAndView grantAuthority(ReadingReferenceBean rb) {
		mav = fut.mGrantAuthority(rb);
		
		return mav;
	}
	

	

	
}
