package com.signhere.main;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.signhere.beans.EntrustBean;
import com.signhere.beans.UserBean;
import com.signhere.services.Entrust;

@Controller
public class EntrustController {
	@Autowired
	private Entrust ent;
	private ModelAndView mav;
	
	@PostMapping("/setEntrust")
	public ModelAndView setEntrust(EntrustBean eb) {
		mav = ent.mSetEntrust(eb);
		
		return mav;
	}

	@RequestMapping(value="/mandatary", method = {RequestMethod.GET, RequestMethod.POST})
	@ResponseBody
	public List<UserBean> mandatary(@RequestBody List<UserBean> ulist) {
		
		ulist = ent.mMandatary(ulist.get(0));
		
		return ulist;
	}
	
	@PostMapping("/saveEntrust")
	public ModelAndView saveEntrust(EntrustBean eb) {
		mav = ent.mSaveEntrust(eb);
		
		return mav;
	}
	
	@PostMapping("/disCheckEntrust")
	public ModelAndView disCheckEntrust(EntrustBean eb) {
		mav = ent.mDisCheckEntrust(eb);
		
		return mav;
	}
}