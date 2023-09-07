package com.yamco.admin.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.yamco.admin.model.service.AdminService;
import com.yamco.admin.model.vo.Admin_Dash_VO;
import com.yamco.admin.model.vo.Member_count_summary_VO;
import com.yamco.user.model.service.Member_Service;
import com.yamco.user.model.vo.Member_Search_VO;
import com.yamco.user.model.vo.Member_VO;

@Controller
public class Admin_Controller {
	@Autowired
	private Member_Service member_Service;
	@Autowired
	private AdminService adminService;
	@Autowired
	private BCryptPasswordEncoder passwordEncoder;

	@RequestMapping("go_admin_report.do")
	public ModelAndView go_admin_report() {
		return new ModelAndView("admin/admin_report");
	}

	@RequestMapping("go_admin_dashboard.do")
	public ModelAndView go_admin_dashboard(HttpSession session) {
		ModelAndView mv = new ModelAndView("admin/admin_dashboard");
		Admin_Dash_VO dash_VO = adminService.getDashTop();
		mv.addObject("dash_VO", dash_VO);
		return mv;
	}

	@RequestMapping("go_admin_memberchk.do")
	public ModelAndView go_admin_memberchk() {
		ModelAndView mv = new ModelAndView("admin/admin_memberchk");
		Member_count_summary_VO countSummary = adminService.getMemberCountSummary();
		mv.addObject("countSummary", countSummary);

		return mv;
	}

	@RequestMapping("/go_admin_memberchk_admin.do")
	public ModelAndView go_admin_memberchk_admin() {
		ModelAndView mv = new ModelAndView("admin/admin_memberchk_admin");
		Member_count_summary_VO countSummary = adminService.getMemberCountSummary();
		mv.addObject("countSummary", countSummary);
		return mv;
	}

	@RequestMapping("/go_admin_memberchk_search.do")
	public ModelAndView get_admin_memberchk_search(Member_Search_VO msvo) {
		ModelAndView mv = new ModelAndView("admin/admin_memberchk");
		List<Member_VO> result = member_Service.getMemberList(msvo);
		mv.addObject("search_result", result);
		
		Member_count_summary_VO countSummary = adminService.getMemberCountSummary();
		mv.addObject("countSummary", countSummary);

		return mv;
	}

	@RequestMapping("/go_admin_memberchk_admin_search.do")
	public ModelAndView get_admin_memberchk_admin_search(Member_Search_VO msvo) {
		ModelAndView mv = new ModelAndView("admin/admin_memberchk_admin");
		List<Member_VO> result = member_Service.getAdminList(msvo);
		mv.addObject("search_result", result);
		
		Member_count_summary_VO countSummary = adminService.getMemberCountSummary();
		mv.addObject("countSummary", countSummary);

		return mv;
	}

	@RequestMapping("/go_admin_memberchk_update.do")
	public ModelAndView get_admin_memberchk_open_lock(Member_VO mvo) {
		ModelAndView mv = new ModelAndView("admin/admin_memberchk");
		String m_status = mvo.getM_status();
		if(m_status != null && m_status.equalsIgnoreCase("3")) {
			member_Service.leaveMember(mvo);
		} else {
		member_Service.getUpdate(mvo);
		}
		Member_count_summary_VO countSummary = adminService.getMemberCountSummary();
		mv.addObject("countSummary", countSummary);

		return mv;
	}
	
	//관리자 회원가입	
	@RequestMapping("/admin_join.do")
	public ModelAndView getMemberJoin(Member_VO mvo) {
		ModelAndView mv = new ModelAndView("admin/admin_memberchk_admin");
		try {
			mvo.setM_pw(passwordEncoder.encode(mvo.getM_pw()));
			mvo.setM_status("2");
			mvo.setM_login_type("1");
			member_Service.getMemberJoin(mvo);
			return mv;
		} catch (Exception e) {
			e.printStackTrace();
			mv.setViewName("error404");
		}
		return null;
	}

	//관리자 탈퇴
	@RequestMapping("/go_admin_memberchk_drop_out.do")
	public ModelAndView get_admin_memberchk_drop_out(Member_VO mvo) {
		ModelAndView mv = new ModelAndView("admin/admin_memberchk_admin");
		String m_status = mvo.getM_status();
		member_Service.leaveAdmin(mvo);
		
		Member_count_summary_VO countSummary = adminService.getMemberCountSummary();
		mv.addObject("countSummary", countSummary);

		return mv;
	}

	@RequestMapping("go_admin_notice.do")
	public ModelAndView go_admin_notice() {
		return new ModelAndView("admin/admin_notice");
	}

	@RequestMapping("go_admin_faq.do")
	public ModelAndView go_admin_faq() {
		return new ModelAndView("admin/admin_faq");
	}

	@RequestMapping("go_admin_contentchk.do")
	public ModelAndView go_admin_contentchk() {
		return new ModelAndView("admin/admin_contentchk");
	}

	@RequestMapping("go_tableExam.do")
	public ModelAndView go_tableExam() {
		return new ModelAndView("admin/table");
	}

	@RequestMapping("/go_admin_ppl.do")
	public ModelAndView admin_test_sw() {
		return new ModelAndView("admin/admin_ppl");
	}

	@RequestMapping("/go_admin_register.do")
	public ModelAndView go_admin_register() {
		return new ModelAndView("admin//admin_register");
	}
}