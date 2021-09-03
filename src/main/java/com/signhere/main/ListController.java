package com.signhere.main;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Service;
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
		//sqlSession.selectList("myDraft", db);
		// UserId를 참고로 내가 보낸기안들(Documnet 테이블 접근)을 가져오는 쿼리를 쓰고, 각 DocumentBean에 
		// 항목들 get해서 myDraft 페이지로 이동
		
		mav.setViewName("document/myDraft");
		
		List<DocumentBean> docList;
				
		
		docList=sqlSession.selectList("myDraft", db);
		
	
		mav.addObject("dmNum",docList.get(0).getDmNum());
		mav.addObject("dmTitle",docList.get(0).getDmTitle());
		mav.addObject("apCode",docList.get(0).getApCode());
		mav.addObject("dmCode",docList.get(0).getDmCode());
		mav.addObject("dmDate",docList.get(0).getDmDate());
		
	
//		실수... db 통해서 쓴 sql System.out.println(db.get(0).getDmNum());
//		System.out.println(db.get(0).getDmTitle());
//		System.out.println(db.get(0).getApCode());
//		System.out.println(db.get(0).getDmCode());
//		System.out.println(db.get(0).getDmDate());
//		
	
		
		
		return mav;
	}
	
	//내가 보낸 시행
	@PostMapping("/myEnforceMent")
	public ModelAndView myEnforceMent(DocumentBean db) {
		mav = new ModelAndView();
		
		mav.setViewName("document/myEnforceMent");
		return mav;
	}
	
  	//결제대기함
	@PostMapping("/apToDoList")
	public ModelAndView apToDoList(DocumentBean db) {
		mav = new ModelAndView();		
		
		mav.setViewName("document/waitApproval");
		
		return mav;
	}
	

  	//결제진행함
	@PostMapping("/apIngList")
	public ModelAndView apIngList(DocumentBean db) {
		mav = new ModelAndView();
		
		mav.setViewName("document/approvalProcced");
		return mav;
	}
	
	//반려함
	@PostMapping("/apReturnList")
	public ModelAndView apReturnList(DocumentBean db) {
		mav = new ModelAndView();
		
		mav.setViewName("document/companionApproval");
		return mav;
	}
	
	//보류함
	@PostMapping("/deferList")
	public ModelAndView deferList(DocumentBean db) {
		mav = new ModelAndView();
		
		mav.setViewName("document/deferList");
		return mav;
	}
	

  	//참조열람함
	@PostMapping("/apReferenceList")
	public ModelAndView apReferenceList(DocumentBean db) {
		mav = new ModelAndView();
		
		mav.setViewName("document/referenceApproval");
		return mav;
	}
	
	//결재완료함
	@PostMapping("/apCompleteList")
	public ModelAndView apCompleteList(DocumentBean db) {
		mav = new ModelAndView();
		
		mav.setViewName("document/completeApproval");
		return mav;
	}
		
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