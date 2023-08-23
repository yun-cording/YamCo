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
		return new ModelAndView("user/ranking/ranking_search");
	}
	@RequestMapping("go_ranking_recipe.do")
	public ModelAndView go_ranking_recipe() {
		return new ModelAndView("user/ranking/ranking_recipe");
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
	@RequestMapping("/go_user_list.do")
	public ModelAndView goUserList() {
		return new ModelAndView("user/recipe/user_list");
	}
	@RequestMapping("/go_public_list.do")
	public ModelAndView goPublicList() {
		return new ModelAndView("user/recipe/public_list");
	}
	@RequestMapping("go_main.do")
	public ModelAndView go_main() {
		return new ModelAndView("/main");
	}
	@RequestMapping("go_error.do")
	public ModelAndView go_error() {
		return new ModelAndView("/error");
	}
	@RequestMapping("go_find_id.do")
	public ModelAndView go_find_id() {
		return new ModelAndView("login/find_id");
	}
	@RequestMapping("go_find_pw.do")
	public ModelAndView go_find_pw() {
		return new ModelAndView("login/find_pw");
	}
	@RequestMapping("go_login.do")
	public ModelAndView go_login() {
		return new ModelAndView("login/login");
	}
	@RequestMapping("go_member_join.do")
	public ModelAndView go_member_join() {
		return new ModelAndView("login/member_join");
	}
	@RequestMapping("go_new_pw.do")
	public ModelAndView go_new_pw() {
		return new ModelAndView("login/new_pw");
	}
	@RequestMapping("go_social_join.do")
	public ModelAndView go_social_join() {
		return new ModelAndView("login/social_join");
	}
	@RequestMapping("go_changeMyinfo.do")
	public ModelAndView go_changeMyinfo() {
		return new ModelAndView("mypage/changeMyinfo");
	}
	@RequestMapping("go_changeMypw.do")
	public ModelAndView go_changeMypw() {
		return new ModelAndView("mypage/changeMypw");
	}
	@RequestMapping("go_myComment.do")
	public ModelAndView go_myComment() {
		return new ModelAndView("mypage/myComment");
	}
	@RequestMapping("go_myContent.do")
	public ModelAndView go_myContent() {
		return new ModelAndView("mypage/myContent");
	}
	@RequestMapping("go_myinfo.do")
	public ModelAndView go_myinfo() {
		return new ModelAndView("mypage/myinfo");
	}
	@RequestMapping("go_myWishList.do")
	public ModelAndView go_myWishList() {
		return new ModelAndView("mypage/myWishList");
	}
	@RequestMapping("go_reportComment.do")
	public ModelAndView go_reportComment() {
		return new ModelAndView("mypage/reportComment");
	}
	@RequestMapping("go_reportContent.do")
	public ModelAndView go_reportContent() {
		return new ModelAndView("mypage/reportContent");
	}
	@RequestMapping("go_leaveMember.do")
	public ModelAndView go_leaveMember() {
		return new ModelAndView("mypage/leaveMember");
	}
	@RequestMapping("/go_search.do")
	public ModelAndView go_searchList() {
		return new ModelAndView("user/recipe/search_list");
	}
}
