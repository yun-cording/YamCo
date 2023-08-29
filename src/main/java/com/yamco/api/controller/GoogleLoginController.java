package com.yamco.api.controller;

import java.io.BufferedWriter;
import java.io.OutputStreamWriter;
import java.net.HttpURLConnection;
import java.net.URL;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.yamco.api.model.service.Api_Service;
import com.yamco.user.model.service.Member_Service;
import com.yamco.user.model.vo.Member_VO;

@Controller
public class GoogleLoginController {
	
	@Autowired
	private Member_Service member_Service;
	
	// 구글에 요청을 보내고 리디렉션 url을 받는 주소
	@RequestMapping("/gglogin_go")
	public ModelAndView googleLogin(HttpSession session , String m_id , String m_nick , String m_image) {
		ModelAndView mv = new ModelAndView();
		System.out.println(m_id);// zdbstjdgnsz@gmail.com
		System.out.println(m_nick); // 102450680418159041554
		System.out.println(m_image); // https://lh3.googleusercontent.com/a/AAcHTte0xP5Y7zJSPhUNCh2prW4HVA-7YhcD6G3hyvlg6b7n=s96-c
		
		// 1차로 db에 m_id에 해당하는 값이 있는지 확인
		Member_VO mvo = member_Service.gloginchk(m_id);
		// db에 값이 저장되어 있는경우 즉, 이미 회원가입이 되어있는경우 바로 메인페이지로 이동
		if(mvo!= null) {
		mv.setViewName("/recipe/public_list");
		session.setAttribute("login", "ok");
		session.setAttribute("id", m_id);
		
		return mv;
		}else { // db에 값이 없는경우 신규 회원가입인경우 소셜 회원가입부분으로 이동
			mvo = new Member_VO();
			mvo.setM_id(m_id);
			mvo.setM_nick(m_nick);
			mvo.setM_image(m_image);
			int result = member_Service.glogin_join(mvo);
			
			session.setAttribute("login", "ok");
			session.setAttribute("id", m_id);
			
			mv.setViewName("/login/social_join");
			return mv;
		} 
	}
}