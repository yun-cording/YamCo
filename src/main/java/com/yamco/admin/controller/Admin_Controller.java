package com.yamco.admin.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.yamco.user.model.service.Member_Service;
import com.yamco.user.model.vo.Member_Search_VO;
import com.yamco.user.model.vo.Member_VO;

@Controller
public class Admin_Controller {
	@Autowired
	private Member_Service member_Service;

	@RequestMapping("go_admin_report.do")
	public ModelAndView go_admin_report() {
		return new ModelAndView("admin/admin_report");
	}

	@RequestMapping("go_admin_dashboard.do")
	public ModelAndView go_admin_dashboard() {
		return new ModelAndView("admin/admin_dashboard");
	}

	@RequestMapping("go_admin_memberchk.do")
	public ModelAndView go_admin_memberchk() {
		return new ModelAndView("admin/admin_memberchk");
	}

	@RequestMapping("/go_admin_memberchk_admin.do")
	public ModelAndView go_admin_memberchk_admin() {
		return new ModelAndView("admin/admin_memberchk_admin");
	}

	@RequestMapping("/go_admin_memberchk_search.do")
	public ModelAndView getMemberIdChk(Member_Search_VO msvo) {
		ModelAndView mv = new ModelAndView("admin/admin_memberchk");
		List<Member_VO> result = member_Service.getMemberList(msvo);
		mv.addObject("search_result", result);

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

	@RequestMapping("/simbatest")
	public ModelAndView simbatest() {
		return new ModelAndView("user/recipe/search_list");
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