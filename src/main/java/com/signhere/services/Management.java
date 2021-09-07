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

	public String mEmployeeDup(String userId) {
		//default = 중복, db에 dupCheck = 사용가능
		String dupCheck = "중복";
		return dupCheck;
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

	public List<DocumentBean> mApListRemove(DocumentBean docList) {
		// session에 id와 company Code가 있다는 가정하에 진행 
		docList.setCmCode("1234567890");
		System.out.println(docList);
		
		this.setTransactionConf(TransactionDefinition.PROPAGATION_REQUIRED, TransactionDefinition.ISOLATION_READ_COMMITTED, false);
		
		int resultCount=0;

		for(int i = 0; i < docList.getDmNumArr().length; i++) {
			docList.setDmCode(docList.getDmNumArr()[i]);
			
			//resultCount += sqlSession.delete("removeApList",docList.getDmNum());
		}
		if (resultCount == docList.getDmNumArr().length) {
			this.setTransactionResult(true);
		}else {
			this.setTransactionResult(false);
		}


		return null;
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
}
