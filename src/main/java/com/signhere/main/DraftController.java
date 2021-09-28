package com.signhere.main;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.signhere.beans.DocumentBean;
import com.signhere.beans.UserBean;
import com.signhere.beans.WriteBean;
import com.signhere.services.Document;
import com.signhere.utils.Session;

@Controller
public class DraftController {
	@Autowired
	private Document doc;
	private ModelAndView mav;
	
	@Autowired
	Session ssn;
	
	@PostMapping("/writeDraft")
	@ResponseBody
	public List<UserBean> writeDraft(@RequestBody List<UserBean> ulist) {
		ulist = doc.mWriteDraft(ulist.get(0));
		
		return ulist;
	}
	
	@PostMapping("/tempDraft")
	@ResponseBody
	public ModelAndView tempDraft(@RequestBody List<DocumentBean> db) {
		mav = new ModelAndView();
		
		mav = doc.mTempDraft(db.get(0));
		
		mav.setViewName("jsonView");
		
		return mav;
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
	
	@PostMapping("/tempRemove")
	@ResponseBody
	public List<DocumentBean> tempRemove(@RequestBody List<DocumentBean> dlist) {
		List<DocumentBean> tempList;
		
		System.out.println(dlist.get(0));
		
		tempList = doc.mTempRemove(dlist.get(0));
		
		return tempList;
	}

	@PostMapping("/draftPage")
	public ModelAndView draftPage(DocumentBean db) {
		mav = doc.mDraftPage(db);
		
		return mav;
	}
	
	@PostMapping("/uploadFile")
	@ResponseBody
	public Map<String, Object> uploadFile(MultipartFile[] uploadFiles) throws IOException {
		Map<String, Object> result = new HashMap<String, Object>();
		
		boolean uploadCheck = doc.uploadFile(uploadFiles);
		
		try {
			String savePath = (String) ssn.getAttribute("fileLoc");
			if(uploadCheck) {
				result.put("result", savePath);
			} else {
				result.put("result", "fail");
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return result;
	}
	
	@PostMapping("/deleteFile")
	@ResponseBody
	public ResponseEntity<String> deleteFile(String fileName) throws IOException {
		
		try {
			if(new File(fileName).delete()) {
				ssn.removeAttribute("fileLoc");
			} else {
				System.out.println("File Already Delete");
			}
		} catch(Exception e) {
			e.printStackTrace();
		}
		
		return new ResponseEntity<>("deleted", HttpStatus.OK);
	}
	
	@PostMapping("/deleteSign")
	@ResponseBody
	public ResponseEntity<String> deleteSign(String signName) throws IOException {
		
		try {
			signName = (String) ssn.getAttribute("signLoc");
			if(new File(signName).delete()) {
				ssn.removeAttribute("signLoc");
			} else {
				System.out.println("Sign Already Delete");
			}
		} catch(Exception e) {
			e.printStackTrace();
		}
		
		return new ResponseEntity<>("deleted", HttpStatus.OK);
	}
	
	@PostMapping("/saveSign")
	@ResponseBody
	public Map<String, Object> saveSign(@RequestParam(value="file", required=true) MultipartFile [] file) throws IOException {
		Map<String, Object> result = new HashMap<String, Object>();
		
		boolean uploadCheck = doc.uploadSign(file);
		
		try {
			if(uploadCheck) {
				result.put("result", "success");
			} else {
				result.put("result", "fail");
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return result;
	}
	
	@PostMapping("/requestDraft")
	@ResponseBody
	public List<WriteBean> requestDraft(@RequestBody List<WriteBean> wlist) {
		List<WriteBean> writeList;
		
		writeList = doc.mRequestDraft(wlist.get(0));
		
		return writeList;
	}
}