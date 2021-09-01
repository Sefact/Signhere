package com.signhere.main;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.servlet.ModelAndView;

import com.signhere.services.Entrust;

@Controller
public class EntrustController {
	@Autowired
	private Entrust ent;
	private ModelAndView mav;
}
