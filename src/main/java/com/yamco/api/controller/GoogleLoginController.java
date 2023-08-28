package com.yamco.api.controller;

import java.io.BufferedWriter;
import java.io.OutputStreamWriter;
import java.net.HttpURLConnection;
import java.net.URL;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.yamco.api.model.service.Api_Service;

@Controller
public class GoogleLoginController {
	
	@Autowired
	private Api_Service board_Service;
	
	// 구글에 요청을 보내고 리디렉션 url을 받는 주소
	@RequestMapping("/gglogin_go")
	public ModelAndView googleLogin(HttpServletRequest request , String url , String name) {
		ModelAndView mv = new ModelAndView("/home");
		System.out.println(name);
		return mv;
	}
}