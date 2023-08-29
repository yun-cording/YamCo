package com.yamco.common;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.yamco.user.model.service.Member_Service;

@RestController
public class DoubleChkController{
	private Member_Service member_Service;
	@Autowired
	public DoubleChkController(Member_Service member_Service) {
		this.member_Service = member_Service;
	}
	@RequestMapping(value = "/go_memberIdChk.do" , produces = "text/plain; charset=utf-8")
	@ResponseBody
	public String getMemberIdChk(@RequestParam("m_id")String m_id) {
		int result = 1;
		if(m_id != null && m_id.length() > 0) {
			result = member_Service.getMemberIdChk(m_id);
		}
		return String.valueOf(result);
	}
}