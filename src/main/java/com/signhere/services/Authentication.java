package com.signhere.services;

import java.io.UnsupportedEncodingException;
import java.security.InvalidAlgorithmParameterException;
import java.security.InvalidKeyException;
import java.security.NoSuchAlgorithmException;
import java.util.List;

import javax.crypto.BadPaddingException;
import javax.crypto.IllegalBlockSizeException;
import javax.crypto.NoSuchPaddingException;
import javax.servlet.http.HttpServletRequest;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.datasource.DataSourceTransactionManager;
import org.springframework.stereotype.Service;
import org.springframework.transaction.TransactionDefinition;
import org.springframework.transaction.TransactionStatus;
import org.springframework.transaction.support.DefaultTransactionDefinition;
import org.springframework.web.servlet.ModelAndView;

import com.signhere.beans.AccessBean;
import com.signhere.beans.CompanyBean;
import com.signhere.beans.DocumentBean;
import com.signhere.beans.UserBean;
import com.signhere.mapper.AuthentInter;
import com.signhere.mapper.FriendsInter;
import com.signhere.utils.Encryption;
import com.signhere.utils.Session;

@Service
public class Authentication implements AuthentInter {
	@Autowired
	SqlSessionTemplate sqlSession;
	@Autowired
	DataSourceTransactionManager tx;
	@Autowired 
	Encryption enc;
	@Autowired
	Session ssn;
	ModelAndView mav;
	private DefaultTransactionDefinition def;
	private TransactionStatus status;

	@Override
	public ModelAndView mLogin(HttpServletRequest req, AccessBean ab) {
		//세션 만료시 로그아웃 시켜주는거 1) 시간 초과 2) 브라우저 닫을때


		mav = new ModelAndView();

		String message = "네트워크 에러! 로그인 실패";
		mav.setViewName("login/home");

		//2.여기서 비밀번호, pwInitial, cmCode,cmName, 부서,직급, 관리자권한, 가져옴 (+이름?)
		List<AccessBean> tmplist;
		tmplist = sqlSession.selectList("getLogInInfo",ab);

		try {
			if(!(ssn.getAttribute("userId")==null)) {
				mav.setViewName("login/main");
				System.out.println("세션없지?");
			}else {
				//2.비밀번호체크
				if(enc.matches(ab.getUserPwd(), tmplist.get(0).getUserPwd())){
					//브라우저 정도 ab에 담음
					ab.setCmCode(tmplist.get(0).getCmCode());
					ab.setBrowser(this.getBrowserInfo(req, "others"));
					ab.setPwInitial(tmplist.get(0).getPwInitial());
					//여기선 tomcat run configuration 변경 하였지만 실제 서버에서 설정을 또 바꿔 줘야함  https://admm.tistory.com/80
					ab.setPrivateIp(req.getRemoteAddr());


					//AccessHistory테이블에 로그인 기록 저장
					if(this.convertToBoolean(sqlSession.insert("updateUserLog",ab))){
						//session에 저장 및 main.jsp이동
						try {
							//최초로그인(pwIntial(최초기본설정여부)판단 후  ID,cmCode,Admin => Session 저장.)
							if(tmplist.get(0).getPwInitial().equals("1")) {
								mav.setViewName("login/main");								
							} else {
								ssn.setAttribute("cmName",tmplist.get(0).getCmName());
								ssn.setAttribute("userName",tmplist.get(0).getUserName());
								ssn.setAttribute("dpName",tmplist.get(0).getDpName());
								ssn.setAttribute("grName",tmplist.get(0).getGrName());
								if(tmplist.get(0).getUserMail() != null) {
									ssn.setAttribute("userMail", tmplist.get(0).getUserMail());
								}
								mav.setViewName("login/newInfo");
							}
							ssn.setAttribute("pwInitial", tmplist.get(0).getPwInitial());
							ssn.setAttribute("userId", tmplist.get(0).getUserId());
							ssn.setAttribute("cmCode", tmplist.get(0).getCmCode());
							ssn.setAttribute("admin", tmplist.get(0).getAdmin());
							ssn.setAttribute("apCheck", tmplist.get(0).getDpCode());

						} catch (Exception e) {

							e.printStackTrace();
						}
					}
				}else {
					System.out.println("설마여기?");
					message = "아이디 비밀번호를 확인해주세요.";
					mav.setViewName("login/home");
				}
			}
		} catch (Exception e1) {

			e1.printStackTrace();
		}
		return mav;
	}

	public ModelAndView mLogOut(HttpServletRequest req, AccessBean ab) {
		mav = new ModelAndView();
		String message="";
		
		
		
		try {
			if(ssn.getAttribute("userId")!=null) {
				ab.setPwInitial((String)ssn.getAttribute("pwInitial"));
				ab.setUserId((String)ssn.getAttribute("userId"));
				ab.setCmCode((String)ssn.getAttribute("cmCode"));
				ab.setBrowser(this.getBrowserInfo(req, "others"));
				ab.setPrivateIp(req.getRemoteAddr());
				sqlSession.insert("updateUserLogOut",ab);
			}else {
				message="이미 로그아웃 하셨습니다";
				mav.addObject("message",message);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			try {
				ssn.removeAttribute("userId");
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		mav.setViewName("login/home");

		return mav;
	}

	public ModelAndView mJoinRequest(UserBean ub) {
		mav = new ModelAndView();

		//1.비밀번호는 복호화 하면 안되기 때문에 enc.encode()로 인코딩
		ub.setUserPwd(enc.encode(ub.getUserPwd()));


		//2.아이디를 제외한 나머지는 enc.aesEncode()로 인코딩 이때 hint는 userId
		/*
		 *try {
			ub.setCmCode(enc.aesEncode(ub.getUserMail(), ub.getUserId()));
			ub.setCmCode(enc.aesEncode(ub.getCmCode(), ub.getUserId()));
			ub.setCmCode(enc.aesEncode(ub.getCmName(), ub.getUserId()));
			ub.setCmCode(enc.aesEncode(ub.getUserName(), ub.getUserId()));
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}  
		 * */
		//3. insert mm 테이블 + cm 테이블 + gr 테이블 + dp 테이블
		this.setTransactionConf(TransactionDefinition.PROPAGATION_REQUIRED, TransactionDefinition.ISOLATION_READ_COMMITTED, false);

		if(this.convertToBoolean(sqlSession.insert("insNewCompany",ub))) {
			if(this.convertToBoolean(sqlSession.insert("insTmpDp",ub))){
				if(this.convertToBoolean(sqlSession.insert("JoinRequest",ub))){
					this.setTransactionResult(true);
				}else {
					this.setTransactionResult(false);
				}
			}
		}
		//mav.setViewName("myInfo");

		mav.setViewName("login/home");
		//mav.setViewName("redirect:/");

		return mav;
	}

	public ModelAndView mUpdateMemberTable(UserBean ub) {
		mav = new ModelAndView();

		//바꿀 비밀번호 암호화
		ub.setUserPwd(enc.encode(ub.getUserPwd()));

		try {
			//세션을 통해 userId를 ub에 저장
			ub.setUserId((String)ssn.getAttribute("userId"));

		} catch (Exception e) {

			e.printStackTrace();
		}

		//수정한 값들, 메일과 비번이 null이면 ""으로 수정해주는 메소드
		this.handleNullValues(ub);

		if(this.convertToBoolean(sqlSession.update("updateNewInfo", ub))) {				
			mav.setViewName("login/main");		
		}else {

			mav.setViewName("redirect:/");				
		}
		return mav;
	}

	//null값들을 ""으로 수정해주는메소드
	private void handleNullValues(UserBean ub) {
		if(ub.getUserMail().isEmpty()) {
			ub.setUserMail("");
		}
		if(ub.getUserPwd().isEmpty()) {
			ub.setUserPwd("");
		}

	}

	public ModelAndView mCallFindPwd(UserBean ub) {
		mav = new ModelAndView();

		mav.setViewName("home");
		//mav.setViewName("redirect:/");

		return mav;
	}

	public ModelAndView mConfirmPwd(UserBean ub) {
		mav = new ModelAndView();

		mav.setViewName("home");
		//mav.setViewName("redirect:/");

		return mav;
	}

	public ModelAndView mMyInfoConfirm(UserBean ub) {
		mav = new ModelAndView();

		mav.setViewName("myInfo");
		//mav.setViewName("redirect:/");

		return mav;
	}

	public ModelAndView mMyInfoDup(UserBean ub) {
		mav = new ModelAndView();

		mav.setViewName("redirect:/");

		return mav;
	}

	/* Select Organization Chart */
	public List<UserBean> mOrgChart(UserBean ub) {
		List<UserBean> userList = null;

		return userList;
	}

	public List<DocumentBean> mAlarm(DocumentBean db) {
		List<DocumentBean> docList;

		docList = null;

		return docList;
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

	public String mHome() {
		String page= "login/home";

		try {

			if(ssn.getAttribute("userId") != null) {
				page = "login/main";
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return page;
	}

	protected String getBrowserInfo(HttpServletRequest req, String browser) {
		try {
			String browserInfo = req.getHeader("User-Agent"); // 사용자 User-Agent 값 얻기

			if (browserInfo != null) {
				if (browserInfo.indexOf("Trident") > -1) {
					browser = "MSIE";
				} else if (browserInfo.indexOf("Opera") > -1) {
					browser = "Opera";
				} else if (browserInfo.indexOf("iPhone") > -1
						&& browserInfo.indexOf("Mobile") > -1) {
					browser = "iPhone";
				} else if (browserInfo.indexOf("Android") > -1
						&& browserInfo.indexOf("Mobile") > -1){
					browser = "Android";
				}else if (browserInfo.indexOf("Edge") > -1) {
					browser = "Edge";
				}	
				else if (browserInfo.indexOf("Chrome") > -1) {
					browser = "Chrome";
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return browser;
	}
}