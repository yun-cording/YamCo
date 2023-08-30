package com.yamco.common;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.yamco.user.model.service.Member_Service;
import com.yamco.user.model.vo.Member_VO;

@Controller
public class PublicLoginController {
	@Autowired
	private Member_Service member_Service;
	@Autowired
	private BCryptPasswordEncoder passwordEncoder;
	
	// TODO 채림 자체회원가입 작업 시작
	// 자체 회원가입 insert
	@PostMapping("/member_join.do")
	public ModelAndView getMemberJoin(Member_VO mvo, @RequestParam("gender")String gender) {
		ModelAndView mv = new ModelAndView("login/social_join");
		try {
			mvo.setM_pw(passwordEncoder.encode(mvo.getM_pw()));
			 System.out.println(gender);
			if(gender.equals("남자,")) {
				mvo.setM_gender("M");				
			}else if(gender.equals("여자,")) {
				mvo.setM_gender("F");
			}
			mvo.setM_login_type("1");
			member_Service.getMemberJoin(mvo);
			String m_id = mvo.getM_id();
			mv.addObject("m_id", m_id);
			// System.out.println("m_id 쏴 : " +m_id);
			return mv;			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}
	
	@PostMapping("/member_nick.do")
	public ModelAndView setNick(Member_VO mvo, @RequestParam("m_id")String m_id) {
		ModelAndView mv = new ModelAndView("login/login");
		try {
			int res = member_Service.getMemberIdChk(m_id);
			// System.out.println("받았냐 : " + m_id);
			if(res > 0) {
				member_Service.setNick(mvo);
			return mv;
			}
		} catch (Exception e) {
			mv.setViewName("error404");
		}
		return mv;
	}
	// TODO 채림 자체회원가입 작업 끗
	// TODO 채림 자체회원 로그인 작업 시작
	@PostMapping("/member_login.do")
	public ModelAndView getMemberLogin(
			@RequestParam("m_id")String m_id,
			@RequestParam("m_pw")String m_pw,
			HttpSession session) {
		return null;
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	// TODO 채림 자체회원 로그인 작업 끗
}
