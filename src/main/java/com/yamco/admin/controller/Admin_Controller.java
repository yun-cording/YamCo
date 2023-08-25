package com.yamco.admin.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class Admin_Controller {
	
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
		return new ModelAndView("admin/admin_index");
	}
    // 상우 테스트
	@RequestMapping("/admin_test_sw.do")
	public ModelAndView admin_test_sw() {
		return new ModelAndView("admin/admin_test_sw");
	}
}
