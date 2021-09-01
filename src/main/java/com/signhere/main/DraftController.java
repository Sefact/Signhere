package com.signhere.main;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.servlet.ModelAndView;

import com.signhere.services.Document;

@Controller
public class DraftController {
	@Autowired
	private Document doc;
	private ModelAndView mav;
}
