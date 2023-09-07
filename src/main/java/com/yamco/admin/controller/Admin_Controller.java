package com.yamco.admin.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.yamco.admin.model.service.AdminService;
import com.yamco.admin.model.vo.Admin_Dash_VO;
import com.yamco.user.model.service.Member_Service;
import com.yamco.user.model.service.U_recipe_Service;
import com.yamco.user.model.vo.Member_Search_VO;
import com.yamco.user.model.vo.Member_VO;
import com.yamco.user.model.vo.U_recipe_meta_VO;

@Controller
public class Admin_Controller {
	@Autowired
	private Member_Service member_Service;
	@Autowired
	private AdminService adminService;
	@Autowired
	private U_recipe_Service u_recipe_Service;

	@RequestMapping("go_admin_report.do")
	public ModelAndView go_admin_report() {
		return new ModelAndView("admin/admin_report");
	}

	@RequestMapping("go_admin_dashboard.do")
	public ModelAndView go_admin_dashboard(HttpSession session) {
		ModelAndView mv= new ModelAndView("admin/admin_dashboard");
		Admin_Dash_VO dash_VO =  adminService.getDashTop();
		mv.addObject("dash_VO",dash_VO);
		return mv;
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
	public ModelAndView go_admin_contentchk(U_recipe_meta_VO urmvo) {
		ModelAndView mv = new ModelAndView("admin/admin_contentchk");
		List<U_recipe_meta_VO> result = u_recipe_Service.getUserContentList(urmvo);
		mv.addObject("content_result", result);
		return mv;
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
	
	@RequestMapping("/content_search.go")
	public ModelAndView getUserSearchList(U_recipe_meta_VO urmvo) {
		ModelAndView mv = new ModelAndView("admin/admin_contentchk");
		String category = urmvo.getHave_category();
		if(category != null) {
			urmvo.setU_rcp_category(category);
		}
		List<U_recipe_meta_VO> result = u_recipe_Service.getUserSearchList(urmvo);
		System.out.println(result.get(0).getRcp_idx());
		mv.addObject("content_result", result);
		return mv;
	}	
}