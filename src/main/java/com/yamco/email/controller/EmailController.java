package com.yamco.email.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.yamco.email.service.EmailService;
import com.yamco.user.model.service.Member_Service;
import com.yamco.user.model.vo.Member_VO;

@Controller
public class EmailController {
	@Autowired
	private EmailService mailService;
		
	@Autowired
	private Member_Service member_Service;
	
	@RequestMapping("/email_send.do")
	public ModelAndView sendMail(Member_VO mvo) {
		try {
			ModelAndView mv = new ModelAndView("redirect:/");
			Member_VO m_vo = member_Service.getEmailId(mvo);
		    mailService.sendEmail(m_vo, "lCT@YamYamrecipe.com");
			return mv;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}
}
