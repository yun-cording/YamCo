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
	public ModelAndView getMemberLogin(HttpSession session, Member_VO mvo) {
		ModelAndView mv = new ModelAndView("login/login");
		String alert = "";
		try {
			Member_VO m_vo = member_Service.getMemberLogin(mvo);
			int fail_count = m_vo.getM_fail_count();
			if(m_vo.getM_status().equals("5")) {
				alert = "<script>alert('로그인 실패 5번 이상이므로 비밀번호 찾기를 이용해주세요.');</script>";
			}
			
			if(!passwordEncoder.matches(mvo.getM_pw(), m_vo.getM_pw())) {
				alert = "<script>alert('비밀번호가 일치하지 않습니다.');</script>";
				System.out.println("안 됨");				
				m_vo.setM_fail_count(fail_count + 1);
				// mapper 갔다오기 (틀린횟수 업데이트)
				member_Service.getFailCountUp(m_vo);
				System.out.println("틀린 횟수" + m_vo.getM_fail_count());
				mv.addObject("alert", alert);
				if(fail_count >= 5) {
					alert = "<script>alert('로그인 실패 5번 이상이므로 비밀번호 찾기를 이용해주세요.');</script>;";
					System.out.println("5번 틀림");
					mv.addObject("alert", alert);
				}
				return mv;
			}else {
				if(fail_count >= 5) {
					alert = "<script>alert('로그인 실패 5번 이상이므로 비밀번호 찾기를 이용해주세요.');</script>;";
					System.out.println("5번 틀림");
					mv.addObject("alert", alert);
					return mv;
				}
				session.setAttribute("m_idx", m_vo.getM_idx());
				session.setAttribute("m_nick", m_vo.getM_nick());
				session.setAttribute("loginChk", true);
				session.setAttribute("m_image", m_vo.getM_image());
				if(m_vo.getM_idx().equals("1")) {
					mv.setViewName("redirect:/go_admin_dashboard.do");
					return mv;
				}
				alert = "<script>alert('로그인 성공.');</script>";
				String history_go = "<script>history.go(-2);</script>";
				mv.addObject("alert", alert);
				mv.addObject("history_go", history_go);
				return mv;
			}
		} catch (Exception e) {
			e.printStackTrace();
			mv.setViewName("error404");
		}
		return null;
	}
	// TODO 채림 자체회원 로그인 작업 끗	
	// TODO 채림 비밀번호 찾기 비밀번호 변경 작업 시작
	@RequestMapping("/member_findPw.do")
	public ModelAndView getFindPw(Member_VO mvo) {
		ModelAndView mv = new ModelAndView("redirect:/email_send.do");
		Member_VO m_vo = member_Service.getMemberLogin(mvo);
		UUID uuid = UUID.randomUUID();
		String t_name = uuid.toString();
		m_vo.setM_token(t_name);
		member_Service.setMakeToken(m_vo);
		mv.addObject("mvo", m_vo);
		System.out.println(m_vo.getM_id() + "1");
		
		return mv;
	}
	
	@RequestMapping("/member_change.do")
	public ModelAndView getChangePw(Member_VO mvo) {
		ModelAndView mv = new ModelAndView("login/login");
		System.out.println("왜");
		try {
			Member_VO m_vo = member_Service.getMemberLogin(mvo);
			System.out.println("안");
			System.out.println("받은 id : " + m_vo.getM_id());
			m_vo.setM_pw(passwordEncoder.encode(mvo.getM_pw()));
			System.out.println("돼");
			m_vo.setM_fail_count(0);
			member_Service.getChangePw(m_vo);
			System.out.println("제");
			member_Service.getFailCountUp(m_vo);
			System.out.println("발");
			member_Service.getTokenDelete(m_vo);
			System.out.println("~!");
			return mv;
		} catch (Exception e) {
			e.printStackTrace();
			mv.setViewName("error404");
		}
		return null;
	}
	// TODO 채림 비밀번호 찾기 비밀번호 변경 작업 끗		
}
