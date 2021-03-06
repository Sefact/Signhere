package com.signhere.main;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.signhere.beans.AccessBean;
import com.signhere.beans.DocumentBean;
import com.signhere.beans.UserBean;
import com.signhere.services.Authentication;
import com.signhere.utils.Session;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	@Autowired
	private Authentication auth;
	@Autowired
	private Session ssn;
	private ModelAndView mav;
	
	@RequestMapping(value = "/", method = {RequestMethod.GET, RequestMethod.POST})
	public ModelAndView home(@ModelAttribute UserBean ub) {
		
		return auth.mHome(ub);
	}
	
	@PostMapping("/login")
	public ModelAndView login(HttpServletRequest req,@ModelAttribute AccessBean ab) {
		mav = auth.mLogin(req,ab);
		
		return mav;
	}
	
	@GetMapping("/logOut")
	public ModelAndView logOut(HttpServletRequest req, @ModelAttribute AccessBean ab) {
		mav = auth.mLogOut(req, ab);
	
		
		return mav;
	}
	
	@RequestMapping(value = "/join", method = {RequestMethod.GET, RequestMethod.POST})
	public String join() {
		return "/login/join";

	}
	
	@RequestMapping(value = "/joinRequest", method = {RequestMethod.GET, RequestMethod.POST})
	public ModelAndView joinRequest(@ModelAttribute UserBean ub) {
		
		return auth.mJoinRequest(ub);
	}
	
	@PostMapping("/newInfo")
	public ModelAndView newInfo(HttpServletRequest req, @ModelAttribute AccessBean ab) {
		mav.setViewName("login/newInfo");
		
		return mav;
	}
	
	@PostMapping("/newInfoAccess")
	public ModelAndView newInfoAccess(@ModelAttribute UserBean ub) {
		mav = auth.mUpdateMemberTable(ub);
		
		return mav;
	}
	//???????????? ?????? ?????????
	@PostMapping("/findPwd")
	public String findPwd() {
		
		return "login/findPwd";
	}
	//???????????? ?????? ??????????????? ???????????? ???????????? ???????????? ???????????? ????????? ????????? ??? ????????? ???????????? ?????? ????????? ????????? ?????????
	@PostMapping("/callFindPwd")
	public ModelAndView callFindPwd(@ModelAttribute UserBean ub) {
		mav = auth.mCallFindPwd(ub);
		
		return mav;
	}
	
	// callFindPwd?????? ???????????? ????????? ???????????? ??? ???????????? ???????????? ?????? ?????????
	@GetMapping("/confirmPwd")
	public String confirmPwd(@ModelAttribute UserBean ub) {
		
		return "login/confirmPwd";
	}
	//confirmPwd??? ??????????????? ??????????????? ??????????????? method.
	@PostMapping("/callConfirmPwd")
	public ModelAndView callConfirmPwd(@ModelAttribute UserBean ub) {
		mav = auth.mConfirmPwd(ub);
		
		return mav;
	}
	
	//????????? ???????????? ?????? ????????? (???????????? 2????????? ?????????)
	@PostMapping("/myInfoAccess")
	public String myInfo() {
		return "login/myInfoAccess";
	
	}
	
	//???????????? 2?????????
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
	
	//????????? ?????? ?????? ?????????
	@PostMapping("/updateMemberTable")
	public ModelAndView updateMemberTable(@ModelAttribute UserBean ub) {
		mav = auth.mUpdateMemberTable(ub);
		
		return mav;
	}
	
	@PostMapping("/orgChart")
	@ResponseBody
	public List<UserBean> orgChart(@RequestBody List<UserBean> ulist) {
		List<UserBean> orgChart;
		
		orgChart = auth.mOrgChart(ulist.get(0));
		
		return orgChart;
	}
	
	@PostMapping("/orgMemberChart")
	@ResponseBody
	public List<UserBean> orgMemberChart(@RequestBody List<UserBean> ulist) {
		List<UserBean> orgChart;
		
		orgChart = auth.mOrgMemberChart(ulist.get(0));
		
		return orgChart;
	}
	
	@PostMapping("/orgSearch")
	@ResponseBody
	public List<UserBean> orgSearch(@RequestBody List<UserBean> ulist) {
		List<UserBean> orgChart;
		
		orgChart = auth.mOrgSearch(ulist.get(0));
		
		return orgChart;
	}
	
	@PostMapping("/alarm")
	public List<DocumentBean> alarm(@RequestBody List<DocumentBean> dlist) {
		List<DocumentBean> alarm;
		
		alarm = null;
		
		return alarm;
	}
}