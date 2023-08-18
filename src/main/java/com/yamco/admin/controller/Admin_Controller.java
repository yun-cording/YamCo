package com.yamco.admin.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class Admin_Controller {
	
	@GetMapping("/go_home.do")
	public ModelAndView go_home() {
		ModelAndView mv = new ModelAndView("/home"); 
		return mv ;
	}

}
