package com.signhere.main;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.signhere.beans.DocumentBean;
import com.signhere.beans.UserBean;
import com.signhere.services.Document;

@Controller
public class DraftController {
	@Autowired
	private Document doc;
	private ModelAndView mav;

	@PostMapping("/writeDraft")
	@ResponseBody
	public List<UserBean> writeDraft(@RequestBody List<UserBean> ulist) {
		ulist = doc.mWriteDraft(ulist.get(0));
		
		return ulist;
	}
	
	@PostMapping("/confirmDraft")
	public ModelAndView confirmDraft(DocumentBean db) {
		mav = new ModelAndView();
		
		System.out.println("DraftController!!");
		
		mav = doc.mConfirmDraft(db);
		
		return mav;
	}
	
	@PostMapping("/modifyDraft")
	public List<DocumentBean> modifyDraft(@RequestBody List<DocumentBean> dlist) {
		List<DocumentBean> tempList;
		
		tempList = doc.mModifyDraft(dlist.get(0));
		
		return tempList;
	}

	@PostMapping("/draftPage")
	public ModelAndView draftPage(DocumentBean db) {
		mav = doc.mDraftPage(db);
		
		return mav;
	}
}