package com.signhere.services;

import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import com.signhere.beans.ApprovalBean;
import com.signhere.beans.DocumentBean;
import com.signhere.beans.UserBean;
import com.signhere.utils.Session;

@Service
public class Document {
	@Autowired
	SqlSessionTemplate sqlSession;
	ModelAndView mav;
	@Autowired
	Session ssn;


	public List<DocumentBean> mSearchText(DocumentBean db){

		//여기서 sessino에 들어간 cmCode 저장
		try {
			db.setCmCode((String)ssn.getAttribute("cmCode"));
		} catch (Exception e) {
			e.printStackTrace();
		}
		this.handleNullValues(db);
		this.changeDateFormat(db);

		List<DocumentBean> docList;

		System.out.println("dmCode:" + db.getCmCode());
		System.out.println("dmNum:" + db.getDmNum());
		System.out.println("dmwriter:" + db.getDmWriter());
		System.out.println("dmCode:" + db.getDmCode());
		System.out.println("apcode:" + db.getApCode());
		System.out.println("dmtitle:" + db.getDmTitle());
		System.out.println("dmdate:" + db.getDmDate());
		System.out.println("dmdate2:" + db.getDmDate2());
		
		docList = sqlSession.selectList("searchCompletedDocs", db);
		
		return docList;
	}

	

	public List<UserBean> mWriteDraft(UserBean ub) {
		List<UserBean> userList = null;
		
		String apCheck = ub.getApCheck();	
		try {
			ub.setUserId((String) ssn.getAttribute("userId"));
			ub.setDpCode((String) ssn.getAttribute("apCheck"));
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		/* A=ApprovalLine | D=DepartmentLine | R=ReferenceLine */
		if(apCheck.equals("A")) {
			userList = sqlSession.selectList("selOrgChart", ub);
		} else if(apCheck.equals("D")) {
			userList = sqlSession.selectList("selDepartmentChart", ub);
		} else if(apCheck.equals("R")) {
			userList = sqlSession.selectList("selReferenceChart", ub);
		} else {
			System.out.println("Error");
		}

		return userList;
	}

	public ModelAndView mConfirmDraft(DocumentBean db) {
		mav = new ModelAndView();
		
		List<DocumentBean> tempList = null;
		List<UserBean> aplDetailList = null;
		
		try {
			db.setDmWriteId((String) ssn.getAttribute("userId"));
			db.setCmCode((String) ssn.getAttribute("cmCode"));

			sqlSession.insert("insTemporary", db);
			tempList = sqlSession.selectList("selTemporary", db);
			
			ssn.setAttribute("tempList", tempList);
			ssn.setAttribute("docBean", db);
			
			handleNullApl(db,db.getAplBean().size());
			
			HashMap map = new HashMap();
			map.put("cmCode", db.getCmCode());
			for(int i = 1; i< db.getAplBean().size(); i++) {
				map.put("userId"+i, db.getAplBean().get(i).getAplId());
			}
			
			
			aplDetailList = sqlSession.selectList("getAplDetailInfo", map);
			
			ssn.setAttribute("aplList", aplDetailList);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		System.out.println(aplDetailList.toString());

		return mav;
	}

	public List<DocumentBean> mModifyDraft(DocumentBean db) {
		List<DocumentBean> docList;

		docList = null;

		return docList;
	}

	public ModelAndView mDraftPage(DocumentBean db) {
		mav = new ModelAndView();

		mav.setViewName("redirect:/");

		return mav;
	}

	private String getToday() {
		LocalDate today = LocalDate.now();
		return today.plusDays(1).toString();
	}

	private void handleNullValues(DocumentBean db) {
		if(db.getDmNum().isEmpty()) {
			db.setDmNum("");
		}
		if(db.getDmTitle().isEmpty()) {
			db.setDmTitle("");
		}
		if(db.getDmCode().isEmpty()) {
			db.setDmCode("");
		}
		if(db.getDmDate().isEmpty()) {
			db.setDmDate("0001-01-01");
		}
		if(db.getDmDate2().isEmpty()) {
			db.setDmDate2(this.getToday());
		}
	}
	
	private void changeDateFormat(DocumentBean db) {
		try {
			db.setDmDate(db.getDmDate().replaceAll("-", ""));
			db.setDmDate2(db.getDmDate2().replaceAll("-", ""));
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	
	private void handleNullApl(DocumentBean db, int aplNumbers) {
		//2명 > 2번 
		//1명 > 3번 
		int counter = 4-aplNumbers;
		ApprovalBean tmpAp = new ApprovalBean();
		tmpAp.setAplId("");
		for(int i = 0; i<counter; i++) {
			db.getAplBean().add(aplNumbers, tmpAp);
		}
	}
}