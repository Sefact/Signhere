package com.signhere.services;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.datasource.DataSourceTransactionManager;
import org.springframework.stereotype.Service;
import org.springframework.transaction.TransactionDefinition;
import org.springframework.transaction.TransactionStatus;
import org.springframework.transaction.support.DefaultTransactionDefinition;
import org.springframework.web.servlet.ModelAndView;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.signhere.beans.DocumentBean;
import com.signhere.beans.UserBean;

@Service
public class Management {
	@Autowired
	SqlSessionTemplate sqlSession;
	@Autowired
	DataSourceTransactionManager tx;

	ModelAndView mav;
	private DefaultTransactionDefinition def;
	private TransactionStatus status;

	Management(){
		//mav 초기화 
		mav = new ModelAndView();
	}

	public ModelAndView mAddEmployee(UserBean ub) {

		//default = 실패, 성공시 message = 성공 
		mav.addObject("message","네트워크 오류! 직원추가 실패");
		return mav;
	}

	public UserBean mEmployeeDup(UserBean ub) {
		//default = 중복, db에 dupCheck = 사용가능
		String dupCheck = "";
		
		
		int dupId = sqlSession.selectOne("userIdDupCheck",ub);
		System.out.println(dupId);
	
		if(dupId==0)
		{ dupCheck="사용가능";
		
		} 	else {
			dupCheck="중복";
			
		}
		ub.setMessage(dupCheck);
		System.out.println(ub.getMessage());
		return ub;
	}

	public ModelAndView mDelEmployee(String userId) {

		//default = 실패, 성공시 message = 성공 
		mav.addObject("네트워크 오류! message","직원삭제 실패");

		return mav;
	}

	public ModelAndView mUpdateEmployee(UserBean ub) {
		//default = 실패, 성공시 message = 성공
		mav.addObject("message","네트워크 오류!  직원 수정 실패");
		return mav;
	}

	public ModelAndView mApListAdmin() {
		// session에 id와 company Code가 있다는 가정하에 진행 
		DocumentBean db = new DocumentBean();
		db.setCmCode("1234567890");
		db.setApCode("C");
		List<DocumentBean> searchedList;
		Map<String,Object> map = new HashMap<>();

		searchedList = sqlSession.selectList("getAllApListAdmin",db);

		if(searchedList != null) {
			mav.addObject("docList",searchedList);
			//mav.addObject("docList",searchedList);
		}else {
			mav.addObject("docList","문서가 존재하지않습니다.");
		}

		mav.setViewName("admin/aplistAdmin");


		return mav;
	}

	public String mApListRemove(DocumentBean db) {
		// session에 id와 company Code가 있다는 가정하에 진행 
		db.setCmCode("1234567890");

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
			message="네으퉈으 오류! 삭제실패";

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
}
