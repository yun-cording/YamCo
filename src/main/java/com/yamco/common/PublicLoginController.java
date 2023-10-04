package com.yamco.common;

import java.util.Date;
import java.util.UUID;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.yamco.user.model.service.Member_Service;
import com.yamco.user.model.service.Member_ServiceImpl;
import com.yamco.user.model.vo.Member_Search_VO;
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
			if(gender.equals("남자,")) {
				mvo.setM_gender("M");				
			}else if(gender.equals("여자,")) {
				mvo.setM_gender("F");
			}
			mvo.setM_login_type("1");
			member_Service.getMemberJoin(mvo);
			String m_id = mvo.getM_id();
			mv.addObject("m_id", m_id);
			return mv;			
		} catch (Exception e) {
			e.printStackTrace();
			mv.setViewName("error404");
		}
		return null;
	}
	
	// 닉네임 설정
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
	@RequestMapping("/member_login.do")
	public ModelAndView getMemberLogin(HttpSession session, Member_VO mvo, @RequestParam("url") String url) {
		ModelAndView mv = new ModelAndView("/login/login");
		
		String alert = "";
		try {
			Member_VO m_vo = member_Service.getMemberLogin(mvo);
			if(m_vo != null) {	
				int fail_count = m_vo.getM_fail_count();
				
			if(!passwordEncoder.matches(mvo.getM_pw(), m_vo.getM_pw())) {
				m_vo.setM_fail_count(fail_count + 1);
				// mapper 갔다오기 (틀린횟수 업데이트)
				member_Service.getFailCountUp(m_vo);
				alert = "<script>alert('비밀번호가 일치하지 않습니다.(틀린횟수 : " + m_vo.getM_fail_count() + "번)');</script>";
				mv.addObject("alert", alert);
				if(fail_count >= 5) {
					alert = "<script>alert('로그인 실패 5번 이상이므로 비밀번호 찾기를 이용해주세요.');</script>;";
					mv.addObject("alert", alert);
				}
				return mv;
			}else {
				if(fail_count >= 5) {
					alert = "<script>alert('로그인 실패 5번 이상이므로 비밀번호 찾기를 이용해주세요.');</script>;";
					mv.addObject("alert", alert);
					return mv;
				}
				
				if(m_vo.getM_nick() != null) {
					session.setAttribute("m_idx", m_vo.getM_idx());
					session.setAttribute("m_nick", m_vo.getM_nick());
					session.setAttribute("loginChk", true);
					session.setAttribute("m_image", m_vo.getM_image());
					if(m_vo.getM_idx().equals("1")) {
						session.setAttribute("adminChk", true);
						mv.setViewName("redirect:/admin/go_admin_dashboard.do");
						return mv;
					}
					
				if(fail_count >= 0) {
					m_vo.setM_fail_count(0);
					member_Service.getFailCountUp(m_vo);
				}
					mv.setViewName("redirect:"+url);
				}else {
					mv.setViewName("/login/social_join");
					mv.addObject("m_id", m_vo.getM_id());
				}
				return mv;
			}
			}else if(m_vo.getM_out_date() != null) {
				alert = "<script>alert('탈퇴한 회원입니다.');</script>";
				mv.addObject("alert", alert);
				return mv;
		 }else{
			alert = "<script>alert('없는 아이디입니다.');</script>";
			mv.addObject("alert", alert);
			return mv;			
		}
		} catch (Exception e) {
			e.printStackTrace();
			mv.setViewName("error404");
		}
		return null;
	}
	// TODO 채림 자체회원 로그인 작업 끗	
	// 채림 비밀번호 찾기 작업 시작
	@RequestMapping("/member_findPw.do")
	public ModelAndView getFindPw(Member_VO mvo) {
		ModelAndView mv = new ModelAndView("redirect:/email_send.do");
		Member_VO m_vo = member_Service.getMemberLogin(mvo);
		UUID uuid = UUID.randomUUID();
		String t_name = uuid.toString();
		m_vo.setM_token(t_name);
		member_Service.setMakeToken(m_vo);
		mv.addObject("mvo", m_vo);
		
		String alert = "<script>alert('비밀번호 변경 링크 메일을 보냈습니다.<br>30분이 지나면 세션 만료로 비밀번호 변경이 어려우므로 그 안에 변경해주세요.');</script>";
		mv.addObject("alert", alert);
		
		return mv;
	}
	
	// 비밀번호 찾기 작업 시작
	@RequestMapping("/find_pw.go")
	public ModelAndView getFindPw2(Member_VO mvo) {
		ModelAndView mv = new ModelAndView("redirect:/email_send.do");
		Member_VO m_vo = member_Service.getMemberLogin(mvo);
		UUID uuid = UUID.randomUUID();
		String t_name = uuid.toString();
		m_vo.setM_token(t_name);
		member_Service.setMakeToken(m_vo);
		mv.addObject("mvo", m_vo);
		
		String alert = "<script>alert('비밀번호 변경 링크 메일을 보냈습니다.<br>30분이 지나면 세션 만료로 비밀번호 변경이 어려우므로 그 안에 변경해주세요.');</script>";
		mv.addObject("alert", alert);
		
		return mv;
	}
	
	// 채림 비밀번호 변경 작업 시작
	@RequestMapping("/member_change.do")
	public ModelAndView getChangePw(Member_VO mvo) {
		ModelAndView mv = new ModelAndView("login/login");
		try {
			Member_VO m_vo = member_Service.getMemberLogin(mvo);
			m_vo.setM_pw(passwordEncoder.encode(mvo.getM_pw()));
			m_vo.setM_fail_count(0);
			member_Service.getChangePw(m_vo);
			member_Service.getFailCountUp(m_vo);
			member_Service.getTokenDelete(m_vo);
			
			String alert = "<script>alert('비밀번호 변경이 완료되었습니다.<br>다시 로그인해주세요.');</script>";
			mv.addObject("alert", alert);
			
			return mv;
		} catch (Exception e) {
			e.printStackTrace();
			mv.setViewName("error404");
		}
		return null;
	}
	// TODO 채림 비밀번호 찾기 비밀번호 변경 작업 끗
}
