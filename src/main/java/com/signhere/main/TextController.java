package com.signhere.main;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.servlet.ModelAndView;

import com.signhere.services.FileUtils;

@Controller
public class TextController {
	@Autowired
	private FileUtils fut;
	private ModelAndView mav;
}
