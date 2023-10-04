package com.yamco.api.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RestController;

import com.yamco.api.model.service.Api_Service;
import com.yamco.user.model.service.Member_Service;
import com.yamco.user.model.vo.Member_VO;

@RestController
public class Ajax_Controller {
	@Autowired
	private Api_Service api_Service;
	@Autowired
	private Member_Service member_Service;
	@Autowired
	private BCryptPasswordEncoder passwordEncoder;
	
	@PostMapping(value = "/member_nick_chk.do" , produces = "text/plain; charset=utf-8")
	public String memberNickChkDo(String m_nick) {
		// 닉네임이 있는지 db가서 확인하기
		int res = api_Service.getNickChk(m_nick);
		return String.valueOf(res) ;
	}
	
	@PostMapping("/pwChk.do")
	public Boolean pwChkDo(String old_pw, HttpSession session) {
		String m_idx = (String)session.getAttribute("m_idx");
		Member_VO mvo = member_Service.getMemberOne(m_idx);
		boolean res = passwordEncoder.matches(old_pw, mvo.getM_pw());
		
		return res;
	}
}
