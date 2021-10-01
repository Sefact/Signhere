package com.signhere.services;

import java.io.UnsupportedEncodingException;
import java.security.InvalidAlgorithmParameterException;
import java.security.InvalidKeyException;
import java.security.NoSuchAlgorithmException;
import java.util.ArrayList;
import java.util.List;

import javax.crypto.BadPaddingException;
import javax.crypto.IllegalBlockSizeException;
import javax.crypto.NoSuchPaddingException;
import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.datasource.DataSourceTransactionManager;
import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Service;
import org.springframework.transaction.TransactionDefinition;
import org.springframework.transaction.TransactionStatus;
import org.springframework.transaction.support.DefaultTransactionDefinition;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.config.MvcNamespaceHandler;

import com.signhere.beans.AccessBean;
import com.signhere.beans.CompanyBean;
import com.signhere.beans.DocumentBean;
import com.signhere.beans.MailForm;
import com.signhere.beans.UserBean;
import com.signhere.main.ListController;
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

	@Autowired
	JavaMailSenderImpl javaMail;
	
	@Autowired
	ListController lc;

	@Override
	public ModelAndView mLogin(HttpServletRequest req, @ModelAttribute AccessBean ab) {
		//세션 만료시 로그아웃 시켜주는거 1) 시간 초과 2) 브라우저 닫을때
		

		mav = new ModelAndView();

		String message = "네트워크 에러! 로그인 실패";
		mav.setViewName("login/home");

		//2.여기서 userId를 통해 비밀번호, pwInitial, cmCode,cmName, 부서,직급, 관리자권한, 가져옴 (+이름?)
		List<AccessBean> tmplist;
		List<AccessBean> testList;
		tmplist = sqlSession.selectList("getLogInInfo",ab);
		testList = sqlSession.selectList("getLogInInfo",ab);

		try {
			if(!(ssn.getAttribute("userId")==null)) {
				mav.setViewName("login/main");
			}else {
				//2.비밀번호체크
				if(enc.matches(ab.getUserPwd(), tmplist.get(0).getUserPwd())){
					//브라우저 정도 ab에 담음
					ab.setCmCode(tmplist.get(0).getCmCode());
					ab.setBrowser(this.getBrowserInfo(req, "others"));
					ab.setPwInitial(tmplist.get(0).getPwInitial());
					System.out.println("로그인 성공");
					//여기선 tomcat run configuration 변경 하였지만 실제 서버에서 설정을 또 바꿔 줘야함  https://admm.tistory.com/80
					ab.setPrivateIp(req.getRemoteAddr());
							
	
					//AccessHistory테이블에 로그인 기록 저장
					if(this.convertToBoolean(sqlSession.insert("updateUserLog",ab))){
						//session에 저장 및 main.jsp이동
						try {

							ssn.setAttribute("cmName",tmplist.get(0).getCmName());
							ssn.setAttribute("userName",tmplist.get(0).getUserName());
							ssn.setAttribute("dpName",tmplist.get(0).getDpName());
							ssn.setAttribute("grName",tmplist.get(0).getGrName());
							ssn.setAttribute("userMail",tmplist.get(0).getUserMail());

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
									//여기서 이메일도 들어가있으면 미리 띄워 줘야함 > 만약 처음에 null이 아니여서 넣는다는 가정 
									System.out.println(ssn.getAttribute("userMail"));
								}
								mav.setViewName("login/newInfo");
							}
							ssn.setAttribute("pwInitial", tmplist.get(0).getPwInitial());
							ssn.setAttribute("userId", tmplist.get(0).getUserId());
							ssn.setAttribute("userName", tmplist.get(0).getUserName());
							ssn.setAttribute("cmCode", tmplist.get(0).getCmCode());
							ssn.setAttribute("admin", tmplist.get(0).getAdmin());
							ssn.setAttribute("userName",tmplist.get(0).getUserName());
							
							
							DocumentBean db = new DocumentBean();
							
							//차트 결재대기함 갯수
							mav.addObject("waitChart", this.waitApprovalChart(db));
							//차트 결재 진행함 갯수
							mav.addObject("ingChart", this.apIngChart(db));
							//하나는 머하지..
							
							
							
							//결제대기함을 메인에 띄워줌
							mav.addObject("docList", this.waitApprovalList(db));
							//결제진행함을 메인에 띄워줌
							mav.addObject("docList2", this.apIngList(db));
							
						

							ssn.setAttribute("pwInitial", tmplist.get(0).getPwInitial());

							// 1)ab userId를 세션 저장. 2)db dmWriteId를 세션 저장. 추후에 세션을 리스트에 담아 뿌리기


							ssn.setAttribute("apCheck", tmplist.get(0).getDpCode());

		

							ab.setUserId((String)ssn.getAttribute("userId"));
							
													
						
						} catch (Exception e) {
							e.printStackTrace();
						}
					}
				}else {
					System.out.println("로그인실패! 띠용~!");
					message = "아이디 비밀번호를 확인해주세요.";
					mav.setViewName("login/home");
				}
			}
		} catch (Exception e1) {

			e1.printStackTrace();
		}
		return mav;
	}
	//결제대기함의 문서수 차트에 담음
	public int waitApprovalChart(DocumentBean db) {	
		List <DocumentBean> docList;	
		try {
			db.setApId((String)ssn.getAttribute("userId"));	
		} catch (Exception e) {
			e.printStackTrace();
		}		
		docList=sqlSession.selectList("waitApproval",db);		
		int size = docList.size();
		
		return size;
	}
	//결제대기함의 문서들 최근꺼부터 5개만 메인에 표시
	public List<DocumentBean> waitApprovalList(DocumentBean db) {	
		List <DocumentBean> docList;	
		try {
			db.setApId((String)ssn.getAttribute("userId"));	
		} catch (Exception e) {
			e.printStackTrace();
		}		
		docList=sqlSession.selectList("waitApproval",db);		

		
		return docList;
	}
	
	//결제진행함의 문서수 차트에 담음
	public int apIngChart(DocumentBean db) {	
		List <DocumentBean> docList;	
		try {
			db.setApId((String)ssn.getAttribute("userId"));	
		} catch (Exception e) {
			e.printStackTrace();
		}		
		docList=sqlSession.selectList("approvalProcced",db);		
		int size = docList.size();
		
		return size;
	}
	
	
	
	//결제진행함의 문서들 최근꺼부터 5개만 메인에 표시
	public List<DocumentBean> apIngList(DocumentBean db) {	
		List <DocumentBean> docList;	
		try {
			db.setApId((String)ssn.getAttribute("userId"));	
		} catch (Exception e) {
			e.printStackTrace();
		}		
		docList=sqlSession.selectList("approvalProcced",db);		

		
		return docList;
	}
	
	
	
	
	
	

	public ModelAndView mLogOut(HttpServletRequest req, @ModelAttribute AccessBean ab) {
		mav = new ModelAndView();
		String message="";
		try {
			if(ssn.getAttribute("userId")!=null) {
				ab.setPwInitial((String)ssn.getAttribute("pwInitial"));
				ab.setUserId((String)ssn.getAttribute("userId"));
				ab.setCmCode((String)ssn.getAttribute("cmCode"));
				ab.setBrowser(this.getBrowserInfo(req, "others"));
				ab.setPrivateIp(req.getRemoteAddr());
				//ab.setPwinitial(ssn.getAttribute("pwIntial"));	
				ab.setUserId((String)ssn.getAttribute("userId"));
				ab.setPwInitial((String)ssn.getAttribute("pwInitial"));
				ab.setCmCode((String)ssn.getAttribute("cmCode"));
				sqlSession.insert("updateUserLogOut",ab);

				System.out.println("로그아웃");

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
		String failMessage="중복되는 정보가 있습니다. 다시 확인 해주세요.";


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
					mav.addObject("failMessage",failMessage);
					mav.setViewName("redirect:/");
				
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
			try {
				ssn.setAttribute("pwIntialCheck", "1");
			} catch (Exception e) {
				e.printStackTrace();
			}

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

	//프론트에서 form에 담아 보내자.	
	public ModelAndView mCallFindPwd(@ModelAttribute UserBean ub) {
		mav = new ModelAndView();		
		String message="";

		int info;	
		info=sqlSession.selectOne("findInfo",ub);

		// 1이면 이메일&아이디가 일치하는게 있다. 0이면 일치하는게 없다
		if(this.convertToBoolean(info)){

			//home.jsp에 넘겨줌.
			message="입력하신 이메일로 인증페이지를 전송했습니다.";

			mav.addObject("message",message);
			this.mFindPwdMailForm(ub);
			mav.setViewName("login/home");

		}else { 
			message="아이디 혹은 이메일과 일치하는 정보가 없습니다.";
			mav.setViewName("redirect:/");
		}

		return mav;

	}
	//메일을 정상적으로 받고 사용자에게 제공되는 비밀번호 바꾸는 페이지에서 컨펌을 누르면 비밀번호 체인지~
	public ModelAndView mConfirmPwd(UserBean ub)  {
		String message="비밀번호가 성공적으로 변겅되었습니다.";

		ModelAndView mav = new ModelAndView();

		//비빌번호 바꾸기 MM테이블에 접근에서 일치하는 아이디의 비밀번호를 사용자가 입력한번호로 바꿔준다

		ub.setUserPwd(enc.encode(ub.getUserPwd()));
		ub.setUserId(ub.getUserId());

		sqlSession.update("changePwd",ub);	
		mav.addObject("message",message);
		mav.setViewName("login/home");

		return mav;
	}

	public void mFindPwdMailForm(UserBean ub) {
		MailForm mf = new MailForm();

		//이따가  to에 ub.usermail 저장하기
		System.out.println(ub.getUserMail());
		mf.setTo(ub.getUserMail());
		mf.setFrom("telecaster0@naver.com");		
		mf.setSubject("사인히어 비밀번호 찾기");
		mf.setContents("<a href='http://localhost/confirmPwd'>비빌번호 변경 </a>");
		this.mFindPwdMailSend(mf, ub);

	}

	public void mFindPwdMailSend(MailForm mf,UserBean ub) {
		MimeMessage mail = javaMail.createMimeMessage();
		MimeMessageHelper helper = new MimeMessageHelper(mail,"UTF-8");	
		try {
			helper.setFrom(mf.getFrom());
			helper.setTo(mf.getTo());
			helper.setSubject(mf.getSubject());
			helper.setText(mf.getContents(),true);
			javaMail.send(mail);
		} catch (MessagingException e) {
			e.printStackTrace();	}

	}

	//내정보 들어갔을때 비번2차인증페이지에서 확인 버튼 눌렀을때.!
	public ModelAndView mMyInfoConfirm(UserBean ub) {
		mav = new ModelAndView();
		String pwdCheck;
		String failMessage="비밀번호가 일치하지 않습니다";
		

		//비번확인하고  직접적 내 정보를 수정하는 페이지로 고	
		pwdCheck = sqlSession.selectOne("checkPwd",ub);

		if(enc.matches(ub.getUserPwd(), pwdCheck)) {
			mav.setViewName("login/myInfo");

		}else {
			mav.setViewName("login/myInfoAccess");
			mav.addObject("failMessage",failMessage);
		

		}

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
		
		userList = sqlSession.selectList("selOrgDepartment", ub);
		
		return userList;
	}
	
	public List<UserBean> mOrgMemberChart(UserBean ub) {
		List<UserBean> userList = null;
		
		userList = sqlSession.selectList("selOrgMember", ub);
		
		return userList;
	}
	
	public List<UserBean> mOrgSearch(UserBean ub) {
		List<UserBean> userList = null;
		
		userList = sqlSession.selectList("searchOrgMember", ub);
		
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

	public ModelAndView mHome(@ModelAttribute UserBean ub) {
		DocumentBean db = new DocumentBean();
		ModelAndView mav =new ModelAndView();
		mav.setViewName("login/home");
		
		try {
			if(ssn.getAttribute("userId") != null) {
			
			mav.addObject("waitChart", this.waitApprovalChart(db));
			mav.addObject("docList", this.waitApprovalList(db));
			mav.addObject("docList2", this.apIngList(db));
			//auth.mUpdateMemberTable(ub);에서 저장한 Initial을 세션으로 저장한 뒤
			//로그인한 상태에서 main으로 가면 자꾸 newInfo로감.. 심지어 pwInitial은 1로 잘 나옴	
				
			//equals가 실제값으로 비교하는거. ==하면 참조변수끼리 비교.
			
			if(((String)ssn.getAttribute("pwInitial")).equals("1")) {
				
		
				mav.setViewName("login/main");
		//  애초에 pwinitial이 1이면 무조건 메인 페이지.   pwInitialCheck=null이라는건 비번 업뎃 안했다는 뜻. or pwinitial이 0
			
			}else if(((String)ssn.getAttribute("pwIntialCheck")==null) || ((String)ssn.getAttribute("pwIntial")).equals("0"))  {			
			
				mav.setViewName("login/newInfo");
			} 		
		}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return mav;
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