package com.signhere.main;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.signhere.beans.ApprovalBean;
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
	@ResponseBody
	public ModelAndView confirmDraft(@RequestBody List<DocumentBean> db) {
		mav = new ModelAndView();
		
		mav = doc.mConfirmDraft(db.get(0));
		
		mav.setViewName("jsonView");
		
		return mav;
	}
	
	@RequestMapping("/draftMove")
	public String draftMove() {
		
		return "draft/draft";
	}
	
	@PostMapping("/modifyDraft")
	@ResponseBody
	public List<DocumentBean> modifyDraft(@RequestBody List<DocumentBean> dlist) {
		List<DocumentBean> tempList;
		
		System.out.println(dlist.get(0));
		
		tempList = doc.mModifyDraft(dlist.get(0));
		
		return tempList;
	}

	@PostMapping("/draftPage")
	public ModelAndView draftPage(DocumentBean db) {
		mav = doc.mDraftPage(db);
		
		return mav;
	}
}