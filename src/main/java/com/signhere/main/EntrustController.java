package com.signhere.main;

import java.util.List;
import java.util.UUID;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.signhere.beans.DocumentBean;
import com.signhere.beans.EntrustBean;
import com.signhere.beans.UserBean;
import com.signhere.services.Criteria;
import com.signhere.services.Entrust;
import com.signhere.utils.Session;

@Controller
public class EntrustController {
	@Autowired
	private Entrust ent;
	private ModelAndView mav;
	
	@Autowired
	SqlSessionTemplate sqlSession;
	
	@Autowired
	Session ssn;
	
	@RequestMapping("/setEntrust")
	public ModelAndView setEntrust(Criteria cri) {
		
		mav = ent.mSetEntrust(cri);
		
		this.tempCheck(cri);
		
		
		return mav;
	}

	@RequestMapping(value="/mandatary", method = {RequestMethod.GET, RequestMethod.POST})
	@ResponseBody
	public List<UserBean> mandatary(@RequestBody List<UserBean> ulist) {
		
		ulist = ent.mMandatary(ulist.get(0));
		
		return ulist;
	}
	
	@PostMapping("/saveEntrust")
	@ResponseBody
	public ModelAndView saveEntrust(@RequestBody List<EntrustBean> eb) {
		mav = new ModelAndView();
		
		mav = ent.mSaveEntrust(eb.get(0));
		
		return mav;
	}
	
	@PostMapping("/disCheckEntrust")
	@ResponseBody
	public ModelAndView disCheckEntrust(@RequestBody List<EntrustBean> eb) {
		mav = new ModelAndView();
		
		mav = ent.mDisCheckEntrust(eb.get(0));

		return mav;
	}
	
	public void tempCheck(Criteria cri) {
		try {
			cri.setSenderId((String) ssn.getAttribute("dmCheck"));
			if(ssn.getAttribute("dmCheck") != null) {
				if(this.convertToBoolean(sqlSession.delete("delTemporaryEnt", cri))) {
					ssn.removeAttribute("dmCheck");
				} else {
					System.out.println("Temporary is not Found");
				}
			} else {
				System.out.println("Document Code Session is not Found");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	private boolean convertToBoolean(int result) {
		return result==1 ? true: false;  
	}
}