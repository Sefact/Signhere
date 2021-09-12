package com.signhere.main;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.fasterxml.jackson.databind.util.JSONPObject;
import com.signhere.beans.DocumentBean;
import com.signhere.beans.UserBean;
import com.signhere.services.Management;

@Controller
public class AdminController {
	@Autowired
	private Management mag;
	private ModelAndView mav;
	
	@Autowired
	SqlSessionTemplate sqlSession;
	
	//직원 관리 페이지로 이동 
	@PostMapping("/admin")
	public ModelAndView admin() {
		return mag.mAdmin();
	}
	
	//직원 관리 페이지에서 새로운 직원 추가
	@PostMapping("/addEmployee")
	@ResponseBody
	public String addEmployee(@RequestBody UserBean ub) {
		return mag.mAddEmployee(ub);
	}
	
	//새로운 직원 추가시 id 중복 체크 
	//최초 회원가입시에도 사용.(Authentication.class join 메소드
	@PostMapping("/employeeDup")
	@ResponseBody
	public UserBean employeeDup(@RequestBody UserBean ub) {
		
		
		return mag.mEmployeeDup(ub);
	}
	
	//기존 직원 삭제 메소드 
	@PostMapping("/delEmployee")
	public ModelAndView delEmployee(@RequestParam String userId) {
		return mag.mDelEmployee(userId);
	}
	
	@PostMapping("/updateEmployee")
	public ModelAndView updateEmployee(@ModelAttribute UserBean ub) {
		return mag.mUpdateEmployee(ub);
	}
	
	@PostMapping("/apListAdmin")
	public ModelAndView apListAdmin() {
		return mag.mApListAdmin();
	}
	
	
	@PostMapping("/apListRemove")
	@ResponseBody
	public String apListRemove(@RequestBody DocumentBean docList) {
		//문서 삭제를 한꺼번에 여러개 가능 하게 할경우에 RequestBody(json)나 modelAttribute로 받아야함
		System.out.println("controller");
		String result = mag.mApListRemove(docList);
		return result;
	}
}