package com.yamco.common;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.yamco.api.model.service.Api_Service;
import com.yamco.user.model.service.Member_Service;
import com.yamco.user.model.vo.Member_VO;

@Controller
public class NicknameSetController {
	@Autowired
	private Member_Service member_Service;
	@Autowired
	private Api_Service api_Service;
	
	@RequestMapping("/setNick.do")
	public ModelAndView setNickDo(Member_VO m_vo, HttpSession session ) {
		ModelAndView mv = new ModelAndView();
		int res = member_Service.setNick(m_vo);
		Member_VO mvo = new Member_VO();
		mvo = api_Service.getIdChk(m_vo.getM_id());
		if(res>0) {
			mv.setViewName("main");
			session.setAttribute("loginChk", true);
			session.setAttribute("m_nick", mvo.getM_nick());
			session.setAttribute("m_idx", mvo.getM_idx());
			session.setAttribute("m_image", mvo.getM_image());
		}else {
			mv.setViewName("error500");
		}
		return mv;
	}
}
