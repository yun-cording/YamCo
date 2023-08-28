package com.yamco.common;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
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
	// 멤버 전체 보기
	@RequestMapping("/go_memberList.do")
	public ModelAndView memberList(@RequestParam("m_id")String m_id) {
		ModelAndView mv = new ModelAndView("redirect:/");
		Member_VO mvo = (Member_VO) member_Service.getMemberList();
		int result = 1;
		String m_id2 = mvo.getM_id(); 
		if(m_id.equals(m_id2)) {
			result = 
		}
		mv.addObject("result", result);
		return mv;
	}
	
	// 자체 회원가입 insert
	@PostMapping("/member_join.do")
	public ModelAndView getMemberJoin(Member_VO mvo, @RequestParam("gender")String gender) {
		ModelAndView mv = new ModelAndView("login/login");
		try {
			mvo.setM_pw(passwordEncoder.encode(mvo.getM_pw()));
			 System.out.println(gender);
			if(gender.equals("남자,")) {
				mvo.setM_gender("M");				
			}else if(gender.equals("여자,")) {
				mvo.setM_gender("F");
			}
			member_Service.getMemberJoin(mvo);
			return mv;			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}
	// TODO 채림 자체회원가입 작업 끗
}
