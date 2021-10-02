package com.signhere.services;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Random;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.datasource.DataSourceTransactionManager;
import org.springframework.stereotype.Service;
import org.springframework.transaction.TransactionDefinition;
import org.springframework.transaction.TransactionStatus;
import org.springframework.transaction.support.DefaultTransactionDefinition;
import org.springframework.web.servlet.ModelAndView;

import com.signhere.beans.DepartmentBean;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.signhere.beans.CompanyBean;
import com.signhere.beans.DocumentBean;
import com.signhere.beans.GradeBean;
import com.signhere.beans.UserBean;
import com.signhere.utils.Encryption;
import com.signhere.utils.Session;

@Service
public class Management {
	@Autowired
	SqlSessionTemplate sqlSession;
	@Autowired
	DataSourceTransactionManager tx;
	@Autowired
	Session ssn;
	@Autowired
	Encryption enc;
	
	Pagination pgn;
	
	ModelAndView mav;
	private DefaultTransactionDefinition def;
	private TransactionStatus status;

	Management(){
		//mav 초기화 
		mav = new ModelAndView();
	}
	
	public ModelAndView mAdmin(Criteria cri) {
		mav = new ModelAndView();
		try {
			cri.setSenderId((String)ssn.getAttribute("cmCode"));
		} catch (Exception e) {
			e.printStackTrace();
		}	
		
		pgn = new Pagination();
		pgn.setCri(cri);
		pgn.setTotalCount((Integer) sqlSession.selectOne("countAllEmp",cri));
		
		List<Map<String,Object>> empList = sqlSession.selectList("getAllEmp",cri);
		List<Map<String,Object>> dpList = sqlSession.selectList("getAllDp",cri);
		List<Map<String,Object>> grList = sqlSession.selectList("getAllGr",cri);
		
		System.out.println(dpList);
		System.out.println(grList);
		
		mav.addObject("grList",grList);
		mav.addObject("dpList",dpList);
		mav.addObject("empList",empList);
		mav.addObject("pagination", pgn);
		mav.setViewName("admin/admin");
		
		
		return mav;
	}
	
	public UserBean mailDup(UserBean ub) {
	
		
		String dupCheck="";
		
		int dupId=sqlSession.selectOne("mailDupCheck",ub);
		
		if(dupId==0) {
			dupCheck="사용가능";
		}else {
			dupCheck="사용불가";
			
		}
		
		ub.setMessage(dupCheck);
		
		return ub;
	
	}
	
	

	public String mAddEmployee(UserBean ub) {
		
		try {
			ub.setCmCode((String)ssn.getAttribute("cmCode"));
			ub.setUserPwd(enc.encode(ub.getCmCode()+ub.getUserId()));
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		//암호화 추가 
		int result = sqlSession.insert("addNewEmp",ub);
		

		System.out.println(this.generatePw());
		

		
		System.out.println("비번난수"+this.generatePw());

		return result+"";
	}


	public CompanyBean mEmployerDup(CompanyBean cb) {
		String dupCheck="";
		
		int dupId=sqlSession.selectOne("cmCodeDupCheck",cb);
		
		if(dupId==0) {
			dupCheck="사용가능";
		}else {
			dupCheck="사용불가";
			
		}
		
		cb.setMessage(dupCheck);
		
		System.out.println(cb.getMessage());
		
		return cb;
	}
	
	
	public UserBean mEmployeeDup(UserBean ub) {
		//default = 중복, db에 dupCheck = 사용가능
		String dupCheck = "";
		
		
		int dupId = sqlSession.selectOne("userIdDupCheck",ub);
	
	
		if(dupId==0)
		{ dupCheck="사용가능";
		
		} 	else {
			dupCheck="사용불가";
			
		}
		ub.setMessage(dupCheck);
		return ub;
	}

	public String mDelEmployee(UserBean userList) {
		int counter =0;
		
		this.setTransactionConf(TransactionDefinition.PROPAGATION_REQUIRED, TransactionDefinition.ISOLATION_READ_COMMITTED, false);
		
		
		for(int i = 0; i < userList.getUserIdArr().length; i++) {
			userList.setUserId(userList.getUserIdArr()[i]);
			sqlSession.update("deleteEmp",userList);
			counter++;
		}
		if(counter == userList.getUserIdArr().length) {
			this.setTransactionResult(true);
		}
		 
		return counter+"";
	}

	public String mUpdateEmployee(UserBean ub) {
		String result = null;
		System.out.println(ub.getUserId());
		System.out.println(ub.getGrCode());
		System.out.println(ub.getDpCode());
		
		result = sqlSession.update("updateEmpInfo",ub)+"";
		
		return result;
	}

	public ModelAndView mApListAdmin(Criteria cri) {
		mav = new ModelAndView();
		try {
			cri.setSenderId((String)ssn.getAttribute("cmCode"));
		} catch (Exception e) {
			e.printStackTrace();
		}	
		
		pgn = new Pagination();
		pgn.setCri(cri);
		pgn.setTotalCount((Integer) sqlSession.selectOne("countAllApproval",cri));
		
		List<Map<String,Object>> getAllApListAdmin = sqlSession.selectList("getAllApListAdmin",cri);
		
		
		mav.setViewName("admin/aplistAdmin");
		mav.addObject("docList", getAllApListAdmin);
		mav.addObject("pagination", pgn);
		
		return mav;
	}

	public String mApListRemove(DocumentBean db) {
		// session에 id와 company Code가 있다는 가정하에 진행 
		try {
			db.setCmCode((String)ssn.getAttribute("cmCode"));
		} catch (Exception e) {
			e.printStackTrace();
		}

		String message = db.getDmNumArr().length + "개의 문서가 삭제 완료되었습니다.";

		this.setTransactionConf(TransactionDefinition.PROPAGATION_REQUIRED, TransactionDefinition.ISOLATION_READ_COMMITTED, false);


		String[] toSelectTables = {"selectALList","selectACList","selectCODList","selectDMCList","selectRFList","selectRDList","selectPLList","selectDMList"};
		String[] toDeleteTables = {"removeAlList","removeACList","removeCODList","removeDMCList","removeRFList","removeRDList","removePLList","removeDMList"};
		int[] resultArr = new int[8];
		int selResult = 0;


		for(int i = 0; i < db.getDmNumArr().length; i++) {
			db.setDmNum(db.getDmNumArr()[i]);
			for(int j = 0; j <toDeleteTables.length; j++) {
				System.out.println("ㅇㅇ:"+db.getDmNum());
				selResult = sqlSession.selectOne(toSelectTables[j],db);
				resultArr[j] = selResult - sqlSession.delete(toDeleteTables[j],db);
			}
			//1.AL테이블 삭제 복수의 row 무조건 기안자 존재 
			//2.AC테이블 무조건 기안자 존재 
			//3.COD테이블 있을수도 있고 없을수도 있음 
			//4.DMC테이블 있을수도 있고 없을수도 있음
			//5.RF테이블 있을수도 있고 없을수도 있음
			//6.RD테이블 있을수도있고 없을수도 있음 
			//7.PL테이블 있을수도있고 없을수도 있음
			//8.DM테이블 무조건 존재 
		}

		int counter=0;

		for(int i =0; i< resultArr.length; i++) {
			counter += resultArr[i];
		}

		if(counter != 0) {
			this.setTransactionResult(false);
			message="네트워크 오류! 삭제실패";

		}
		System.out.println(counter);
		this.setTransactionResult(true);

		return message;
	}

	//Transaction configuration 
	private void setTransactionConf(int propagation, int isolationLevel, boolean isRead) {
		def = new DefaultTransactionDefinition();
		def.setPropagationBehavior(propagation);
		def.setIsolationLevel(isolationLevel);
		def.setReadOnly(isRead);
		status = tx.getTransaction(def);
	}

	//Transaction Result
	private void setTransactionResult(boolean isCheck) {
		if(isCheck) {
			tx.commit(status);
		}else{
			tx.rollback(status);
		}
	}

	private boolean convertToBoolean(int result) {
		return result==1 ? true: false;  
	}
	
	private String generatePw() {
		char[] specialChar = {'!','@','#','$','%','^','&','*'};
		
		Random r = new Random();
		int randomLower = r.nextInt(2)+3;
		int randomUpper = r.nextInt(2)+3;
		int randomChar = r.nextInt(2)+1;
		int randomNum = r.nextInt(2)+3;
		int randomIndex=0;
		char tmpChar = ' ';
		char[] tmpPwArr = new char[randomLower+randomUpper+randomChar+randomNum];
		StringBuffer randomPw = new StringBuffer();
		
		for(int i = 0; i<randomLower; i++) {
			tmpPwArr[i] = (char)(r.nextInt(26)+'a');
		}
		for(int i = 0; i<randomUpper; i++) {
			tmpPwArr[i+randomLower] = (char)(r.nextInt(26)+'A');
		}
		for(int i=0; i<randomNum; i++) {
			tmpPwArr[i+randomLower+randomUpper] = (char)r.nextInt(9);
		}
		for(int i=0; i<randomChar; i++) {
			tmpPwArr[i+randomLower+randomUpper+randomNum] = specialChar[r.nextInt(7)];
		}
		
		for(int i=0; i<tmpPwArr.length; i++) {
			randomIndex = r.nextInt(tmpPwArr.length);
			tmpChar = tmpPwArr[i];
			tmpPwArr[i] = tmpPwArr[randomIndex];
			tmpPwArr[randomIndex] = tmpChar;
		}
		
		for(int i = 0; i<tmpPwArr.length; i++) {
			randomPw.append(tmpPwArr[i]);
		}
		
		return randomPw.toString();
	}

	public List<UserBean> searchEmp(UserBean ub) {
		try {
			ub.setCmCode((String)ssn.getAttribute("cmCode"));
		} catch (Exception e) {
			e.printStackTrace();
		}
		this.handleNullValues(ub);
		List<UserBean> empList;
		
		empList = sqlSession.selectList("searchEmp",ub);
		empList.get(0).setMessage(empList.size()+"");
		return empList;
	}

	private void handleNullValues(UserBean ub) {
		if(ub.getUserName().isEmpty()) {
			ub.setUserName("");
		}
		if(ub.getDpCode().isEmpty()) {
			ub.setDpCode("");
		}
		if(ub.getGrCode().isEmpty()) {
			ub.setGrCode("");
		}
	}

	public List<UserBean> userInfo(UserBean ub) {
		System.out.println(ub.getUserId());
		List<UserBean> userDetailList;
		userDetailList = sqlSession.selectList("getUserInfoDetail", ub);
		return userDetailList;
	}

	public String addNewDept(DepartmentBean db) {
		String result = "0";
		try {
			db.setCmCode((String)ssn.getAttribute("cmCode"));
		} catch (Exception e) {
			e.printStackTrace();
		}
		System.out.println(db.getDpName());
		if(sqlSession.insert("addNewDept",db)==1) {
			result = "1";
		}
		
		System.out.println(result);
		return result;
	}




}
