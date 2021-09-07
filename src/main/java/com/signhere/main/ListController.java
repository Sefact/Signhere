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
import org.springframework.web.servlet.ModelAndView;

import com.signhere.beans.DocumentBean;
import com.signhere.mapper.DocumentInter;
import com.signhere.services.Document;

@Controller
public class ListController implements DocumentInter {
	@Autowired
	private Document doc;
	private ModelAndView mav;
	
	@Autowired
	SqlSessionTemplate sqlSession;
	
  
	//내가 보낸 기안
	@PostMapping("/myDraft")
	public ModelAndView myDraft(@ModelAttribute DocumentBean db) {
		mav = new ModelAndView();
		// UserId를 참고로 내가 보낸기안들(Documnet 테이블 접근)을 가져오는 쿼리를 쓰고, 각 DocumentBean에 
		// 항목들 get해서 myDraft 페이지로 이동
		
		//page 이동
		mav.setViewName("document/myDraft");
		
		//DocumentBean을 List에 생성?
		List<DocumentBean> docList;
		
		//작성자ID(로그인한 사용자) 임의저장
		db.setDmWriteId("202103001");
		
		//DoucmentInter.xml, query 참조
		docList=sqlSession.selectList("myDraft", db);
				
		//현재 ID(DM테이블의 WRITER)는 interface.xml에 임의값 where절에 집어넣음.
	
		mav.addObject("docList",docList);

	
//		실수... db 통해서 쓴 sql System.out.println(db.get(0).getDmNum());
//		System.out.println(db.get(0).getDmTitle());		
				
//		 Map<String, Object> map = new HashMap<String, Object>();
//		 map.put("docList", docList);
//		 mav.addObject("map",map);
	
		return mav;
	}
	
	//내가 보낸 시행
	@PostMapping("/myEnforceMent")
	public ModelAndView myEnforceMent(DocumentBean db) {
		mav = new ModelAndView();
		
		mav.setViewName("document/myEnforceMent");
		
	
		List<DocumentBean> docList;
		
		//작성자ID(로그인한 사용자) 임의저장
		db.setDmWriteId("202103001");
		
		docList=sqlSession.selectList("myEnforceMent", db);
		
		mav.addObject("docList",docList);

		return mav;
	}
	
  	//결제대기함
	@PostMapping("/apToDoList")
	public ModelAndView apToDoList(DocumentBean db) {
		mav = new ModelAndView();		
		
		mav.setViewName("document/waitApproval");
		
		List <DocumentBean> docList;
		
		docList=sqlSession.selectList("waitApproval",db);
		
		
		//APPROVAL_ID=로그인 한 아이디 =>'202103003' / xml에서 where절에 입력.
		mav.addObject("docList",docList);
		

		
		return mav;
	}
	

  	//결제진행함
	@PostMapping("/apIngList")
	public ModelAndView apIngList(DocumentBean db) {
		mav = new ModelAndView();
		
		mav.setViewName("document/approvalProcced");
		List <DocumentBean> docList;		
		docList=sqlSession.selectList("approvalProcced",db);
		
		//APPROVAL_ID=로그인한아이디 =>'202103002' / xml에서 where절에 입력.		
		mav.addObject("docList",docList);
		
		
		return mav;
	}
	
	//결재완료함
	@PostMapping("/apCompleteList")
	public ModelAndView apCompleteList(DocumentBean db) {
		mav = new ModelAndView();
		
		mav.setViewName("document/completeApproval");
		
		List <DocumentBean> docList;
		
		docList=sqlSession.selectList("completeApproval",db);
		
		//APPROVAL_ID=로그인한아이디 =>'202103001'xml에서 where절에 입력.
		mav.addObject("docList",docList);	
		return mav;
		
	}
	
	//반려함
	@PostMapping("/apReturnList")
	public ModelAndView apReturnList(DocumentBean db) {
		mav = new ModelAndView();		
		mav.setViewName("document/companionApproval");
		
		List <DocumentBean> docList;
		
		docList=sqlSession.selectList("compaionApproval", db);
		
		//APPROVAL_ID=로그인한아이디 =>'202103001'xml에서 where절에 입력.
		mav.addObject("docList",docList);
		
		return mav;
	}
	
	//보류함
	@PostMapping("/deferList")
	public ModelAndView deferList(DocumentBean db) {
		mav = new ModelAndView();		
		mav.setViewName("document/deferList");
		
		List <DocumentBean> docList;
		docList=sqlSession.selectList("deferList",db);
		
		
		//APPROVAL_ID=로그인한아이디 =>'202103001'xml에서 where절에 입력.
		mav.addObject("docList",docList);
		
		return mav;
	}
	

  	//참조열람함
	@PostMapping("/apReferenceList")
	public ModelAndView apReferenceList(DocumentBean db) {
		mav = new ModelAndView();
		
		mav.setViewName("document/referenceApproval");
		
		List <DocumentBean> docList;
		docList=sqlSession.selectList("referenceApproval", db);
		
		//APPROVAL_ID=로그인한아이디 =>'202103002'xml에서 where절에 입력.
		mav.addObject("docList",docList);
		
		return mav;
	}
	

	//개인보관함	
	@PostMapping("/myList")
	public ModelAndView myList(DocumentBean db) {
		mav = new ModelAndView();
		
    	mav.setViewName("document/myList");
		
    	return mav;
	}
	

	//개인보관함으로 이동시키는 JOB
	@PostMapping("/goMyList")
	public ModelAndView goMyList(DocumentBean db) {
		mav = new ModelAndView();
		
		mav.setViewName("document/myList");
		
		return mav;
	}
	
	//개인보관함에 있는 문서 삭제 JOB
	@PostMapping("/delMyList")
	public ModelAndView delMyList(DocumentBean db) {
		mav = new ModelAndView();
		
		mav.setViewName("document/myList");
		
		return mav;
	}

	//문서검색 JOB
	@PostMapping("/searchText")
	public ModelAndView searchText(DocumentBean db) {
		System.out.println(db.getDmNum());
		System.out.println(db.getDmTitle());
		System.out.println(db.getApCode());
		System.out.println(db.getDmCode());
		System.out.println(db.getDmDate());
		
		mav = new ModelAndView();
		
		mav.setViewName("redirect:/");
		
		return mav;
	}
	
	//페이지이동 JOB
	@PostMapping("/moveAjaxPage")
	public List<DocumentBean> moveAjaxPage(DocumentBean db) {
		
		
		return null;
	}
	
	//공문수신함
	@PostMapping("/receiveList")
	public ModelAndView receiveList(DocumentBean db) {
		mav = new ModelAndView();
		
		mav.setViewName("document/receiveNotice");
		
		return mav;
	}
}