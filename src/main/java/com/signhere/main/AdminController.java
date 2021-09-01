package com.signhere.main;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.signhere.beans.UserBean;
import com.signhere.services.Management;

@Controller
public class AdminController {
	@Autowired
	private Management mag;
	private ModelAndView mav;
	
	//직원 관리 페이지로 이동 
	@GetMapping("/admin")
	public String admin() {
		return "admin";
	}
	
	//직원 관리 페이지에서 새로운 직원 추가
	@PostMapping("/addEmployee")
	public ModelAndView addEmployee(@ModelAttribute UserBean ub) {
		return mag.mAddEmployee(ub);
	}
	
	//새로운 직원 추가시 id 중복 체크 
	@PostMapping("/employeeDup")
	public String employeeDup(@RequestParam String userId) {
		return mag.mEmployeeDup(userId);
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
	
	@GetMapping("/apListAdmin")
	public ModelAndView apListAdmin() {
		return mag.mApListAdmin();
	}
	
	@PostMapping("/apListRemove")
	public ModelAndView	apListRemove(@RequestParam String dmCode) {
		//문서 삭제를 한꺼번에 여러개 가능 하게 할경우에 RequestBody(json)나 modelAttribute로 받아야함
		return mag.mApListRemove(dmCode);
	}
}