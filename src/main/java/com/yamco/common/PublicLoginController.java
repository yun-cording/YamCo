package com.yamco.common;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.ModelAndView;

import com.yamco.user.model.service.User_Service;

@Controller
public class PublicLoginController {
	/*
	 * @Autowired private User_Service user_Service;
	 * 
	 * @Autowired private BCryptPasswordEncoder passwordEncoder;
	 */
	
	// 자체 회원가입
//	@PostMapping("/member_join.do")
//	public ModelAndView memberJoin()
}
