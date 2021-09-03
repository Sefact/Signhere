package com.signhere.main;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.signhere.beans.AccessBean;
import com.signhere.beans.DocumentBean;
import com.signhere.beans.UserBean;
import com.signhere.services.Authentication;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	@Autowired
	private Authentication auth;
	private ModelAndView mav;
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home() {

		
		return "login/home";
	}
	
	@PostMapping("/login")
	public ModelAndView login(@ModelAttribute AccessBean ab) {
		//mav = auth.insUser(ub);
		mav = auth.mLogin(ab);
		return mav;
	}
	
	@PostMapping("/logOut")
	public ModelAndView logOut(@ModelAttribute UserBean ub) {
		mav = auth.mLogOut();
		
		return mav;
	}
	
	@PostMapping("/join")
	public String join() {
		return "join";
	}
	
	@PostMapping("/joinRequest")
	public ModelAndView joinRequest(@ModelAttribute UserBean ub) {
		mav = auth.mJoinRequest(ub);
		
		return mav;
	}
	
	@PostMapping("/newInfo")
	public ModelAndView newInfo(@ModelAttribute UserBean ub) {
		mav = auth.mLogin(null);
		
		return mav;
	}
	
	@PostMapping("/newInfoAccess")
	public ModelAndView newInfoAccess(@ModelAttribute UserBean ub) {
		mav = auth.mUpdateMemberTable(ub);
		
		return mav;
	}
	
	@PostMapping("/findPwd")
	public String findPwd() {
		return "findPwd";
	}
	
	@PostMapping("/callFindPwd")
	public ModelAndView callFindPwd(@ModelAttribute UserBean ub) {
		mav = auth.mCallFindPwd(ub);
		
		return mav;
	}
	
	@PostMapping("/confirmPwd")
	public String confirmPwd(@ModelAttribute String userId) {
		return "confirmPwd";
	}
	
	@PostMapping("/myInfo")
	public String myInfo() {
		return "myInfoAccess";
	}
	
	@PostMapping("/myInfoConfirm")
	public ModelAndView myInfoConfirm(@ModelAttribute UserBean ub) {
		mav = auth.mMyInfoConfirm(ub);
		
		return mav;
	}
	
	@PostMapping("/myInfoDup")
	public ModelAndView myInfoDup(@ModelAttribute UserBean ub) {
		mav = auth.mMyInfoDup(ub);
		
		return mav;
	}
	
	@PostMapping("/updateMemberTable")
	public ModelAndView updateMemberTable(@ModelAttribute UserBean ub) {
		mav = auth.mUpdateMemberTable(ub);
		
		return mav;
	}
	
	@PostMapping("/orgChart")
	public List<UserBean> orgChart(@RequestBody List<UserBean> ulist) {
		List<UserBean> orgChart;
		
		orgChart = null;
		
		return orgChart;
	}
	
	@PostMapping("/alarm")
	public List<DocumentBean> alarm(@RequestBody List<DocumentBean> dlist) {
		List<DocumentBean> alarm;
		
		alarm = null;
		
		return alarm;
	}
}