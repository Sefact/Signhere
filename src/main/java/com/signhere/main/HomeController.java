package com.signhere.main;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.signhere.beans.AccessBean;
import com.signhere.beans.CompanyBean;
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
	
	//메인 화면
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home() {
		return "home";
	}
	
	//로그인
	@PostMapping("/login")
	public ModelAndView login(@ModelAttribute AccessBean ab) {
		mav = auth.mLogin(ab);
		return mav;
	}
	
	//로그아웃
	public ModelAndView logOut() {
		mav = auth.mlogout();
		return mav;
	}
	
	//회원가입
	@PostMapping("/join")
	public String join(@ModelAttribute UserBean ub) {
		return join(ub);
	}
	
	//회원가입 페이지
	public ModelAndView joinRequest(@ModelAttribute UserBean ub) {
		mav = auth.mJoinRequest(ub);
		return mav;
	}
	
	//초기설정
	public ModelAndView newInfo(@ModelAttribute UserBean ub) {
		mav = auth.mLogin(ub);
		return mav;
	}
	
	//비밀번호 찾기
	@PostMapping("/findPwd")
	public String findPwd() {
		mav = auth.mFindPwd();
		return findPwd();
	}
	
	//비밀번호 찾기 요청
	public ModelAndView callFindPwd(@ModelAttribute UserBean ub) {
		mav = auth.mCallFindPwd(ub);
		return mav;
	}

	//내 정보창
	@PostMapping("/myInfo")
	public String myInfo() {
		//mMyInfo method를 실행하고 myInfoAccess를 결과값으로
		//받은 후 정보를 통해 myInfoAccess.jsp로 페이지 전환
		return myInfo();
	}
	
	//조직도
	public List<CompanyBean> orgChart(@ModelAttribute UserBean uList){
		return null;
	}
	
	
	//알람
	public List<> alarm(@ModelAttribute DocumentBean dmb){
		return null;
	}
}
