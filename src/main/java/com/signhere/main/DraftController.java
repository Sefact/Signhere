package com.signhere.main;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.util.List;

import org.apache.commons.codec.binary.Base64;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RequestPart;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.signhere.beans.ApprovalBean;
import com.signhere.beans.ApprovalCommentBean;
import com.signhere.beans.DocumentBean;
import com.signhere.beans.ReadingReferenceBean;
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
	
	@PostMapping("/requestDraft")
	public String requestDraft(@RequestParam(name="file")MultipartFile file,
	@RequestParam(name="acReason")String comment){
		
		System.out.println(comment);
		System.out.println(file.toString());
		
		return null;
	}
	
	@PostMapping("/saveSignature")
	public String saveSignature(@RequestBody String signature) throws FileNotFoundException, IOException {
		System.out.println(signature);
		String base64Image = signature.split(",")[1];
		
		byte[] encodedBytes = Base64.decodeBase64(base64Image);
		System.out.println(encodedBytes);
		
		// "C:\Users\Dongmin Geum\git\Signhere\src\main\webapp\resources
		
		String path = "C:"+ File.separator + "Users" + File.separator + "Dongmin Geum" +File.separator+"git"+File.separator+"Signhere"+File.separator +
				"src"+File.separator+"main"+File.separator+"webapp"+File.separator+"resources"+File.separator+"upLoaded"+File.separator+"";
		
		FileOutputStream fos = new FileOutputStream(path+File.separator+"signature.png");
		
		fos.write(encodedBytes);
		fos.close();
		
		System.out.println(base64Image);
		
		return base64Image;
	}
	
	@PostMapping(value="/upLoadDocFiles", consumes = MediaType.MULTIPART_FORM_DATA_VALUE)
	@ResponseBody
	public String upLoadDocFiles(@RequestParam("fileList") MultipartFile fileList,
			@RequestParam("apComment") String apComment, @RequestParam("signature") String signature) {
		
		MultipartFile item = fileList;
		
		System.out.println("파일"+ item.getName());
		System.out.println(apComment);
		System.out.println(signature);
		
		
		return "1";
	}
	
}