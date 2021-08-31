package com.signhere.main;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.ModelAndView;

import com.signhere.beans.DocumentBean;
import com.signhere.services.Document;

@Controller
public class ListController {
	@Autowired
	private Document doc;
	private ModelAndView mav;
	
	@Autowired
	SqlSession sqlSession;
	
	//내가 보낸 기안
	@PostMapping("/myDraft")
	public ModelAndView myDraft(DocumentBean db) {
		  
		sqlSession.selectList("myDraft", db);
		
//		UserId를 참고로 내가 보낸기안들(Documnet 테이블 접근)을 가져오는 쿼리를 쓰고, 각 DocumentBean에 
//		항목들 get해서 myDraft 페이지로 이동
		mav.setViewName("myDraft");
			return mav;
	}
	
	//내가 보낸 시행
	@PostMapping("/myEnforceMent")
	public ModelAndView myEnforceMent(DocumentBean db) {
		
		mav.setViewName("myEnforceMent");
		return mav;
	}
	
	//결제대기함
	
	@PostMapping("/apToDoList")
	public ModelAndView apToDoList(DocumentBean db) {
		
		
		mav.setViewName("apToDoList");
		return mav;
	}
	
	//결제진행함
	@PostMapping("/apIngList")
	public ModelAndView apIngList(DocumentBean db) {
		
		
		mav.setViewName("apIngList");
		return mav;
	}
	
	//반려함
	@PostMapping("/apReturnList")	
	public ModelAndView apReturnList(DocumentBean db) {
		
		mav.setViewName("apReturnList");
		return mav;
	}
	
	//보류함
	@PostMapping("/deferList")
	public ModelAndView deferList(DocumentBean db) {
		
		
		mav.setViewName("deferList");
		return mav;
	}
	
	//참조열람함
	@PostMapping("/apReferenceList")
	public ModelAndView apReferenceList(DocumentBean db) {
		
		mav.setViewName("apReferenceList");
		return mav;
	}
	
	//결재완료함
	@PostMapping("/apCompleteList")
	public ModelAndView apCompleteList(DocumentBean db) {
		
		mav.setViewName("apCompleteList");
		return mav;
	}
	
	//개인보관함페이지
	
	@PostMapping("/myList")
	public ModelAndView myList(DocumentBean db) {
		
		
		mav.setViewName("myList");
		return mav;
	}
	
	//개인보관함으로 이동시키는 JOB
	@PostMapping("/goMyList")
	public ModelAndView goMyList(DocumentBean db) {
		
		mav.setViewName("myList");
		return mav;
	}
	
	//개인보관함에 있는 문서 삭제 JOB
	@PostMapping("/delMyList")
	public ModelAndView delMyList(DocumentBean db) {
		
		mav.setViewName("myList");
		return mav;
	}

	//문서검색 JOB
	
	@PostMapping("/searchText")
	public List<DocumentBean> searchText(DocumentBean db) {
		
		
		return null;
	}
	
	//페이지이동 JOB
	@PostMapping("/moveAjaxPage")
	public List<DocumentBean> moveAjaxPage(DocumentBean db) {
		
		
		return null;
	}
	
	//공문수신함
	@PostMapping("/receiveList")
	public ModelAndView receiveList(DocumentBean db) {
		
		mav.setViewName("receiveList");
		return mav;
	}
	
	
}
