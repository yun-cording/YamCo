package com.yamco.api.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RestController;

import com.yamco.api.model.service.Api_Service;

@RestController
public class Ajax_Controller {
	@Autowired
	private Api_Service api_Service;
	
	@PostMapping(value = "/member_nick_chk.do" , produces = "text/plain; charset=utf-8")
	public String memberNickChkDo(String m_nick) {
		// 닉네임이 있는지 db가서 확인하기
		int res = api_Service.getNickChk(m_nick);
		System.out.println(res);
		return String.valueOf(res) ;
	}
}
