package com.signhere.services;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import com.signhere.beans.UserBean;

@Service
public class Management {
	@Autowired
	SqlSessionTemplate sqlSession;
	
	ModelAndView mav;
	
	Management(){
		//mav 초기화 
		mav = null;
	}

	public ModelAndView mAddEmployee(UserBean ub) {
		//default = 실패, 성공시 message = 성공
		
		mav.addObject("message","네트워크 오류! 직원추가 실패");
		return mav;
	}

	public String mEmployeeDup(String userId) {
		//default = 중복, db에 dupCheck = 사용가능
		String dupCheck = "중복";
		if(dupCheck!=null) {
			
		}
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
		mav = new ModelAndView();
		// session에 id와 company Code가 있다는 가정하에 진행 
		
		
		mav.setViewName("admin/aplistAdmin");
		
		return mav;
	}

	public ModelAndView mApListRemove(String dmCode) {
		mav.addObject("message","네트워크 오류! 문서 삭제 실패");
		return mav;
	}
}
