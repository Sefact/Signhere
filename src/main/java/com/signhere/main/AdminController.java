package com.signhere.main;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.servlet.ModelAndView;

import com.signhere.services.Management;

@Controller
public class AdminController {
	@Autowired
	private Management mag;
	private ModelAndView mav;
}
