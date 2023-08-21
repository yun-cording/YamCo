package com.yamco.user.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;import org.springframework.web.servlet.ModelAndView;

@Controller
public class User_Controller {
	
	@GetMapping("/go_home.do")
	public ModelAndView go_home() {
		ModelAndView mv = new ModelAndView("/home"); 
		return mv ;
	}
	@RequestMapping("go_ranking_search.do")
	public ModelAndView go_ranking_search() {
		return new ModelAndView("user/ranking/ranking");
	}
	@RequestMapping("go_plz.do")
	public ModelAndView go_plz() {
		return new ModelAndView("user/plz/plz");
	}
	@RequestMapping("go_faq.do")
	public ModelAndView go_faq() {
		return new ModelAndView("user/faq/faq");
	}
	@RequestMapping("go_award.do")
	public ModelAndView go_award() {
		return new ModelAndView("user/award/award");
	}
	@RequestMapping("go_admin.do")
	public ModelAndView go_admin() {
		return new ModelAndView("admin/admin_index");
	}
}
