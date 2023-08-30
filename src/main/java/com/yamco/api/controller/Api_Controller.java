package com.yamco.api.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.yamco.api.model.service.Api_Service;

@Controller
public class Api_Controller {
	@Autowired
	private Api_Service board_Service;
//	@Autowired
//	private Paging paging;
//	@Autowired
//	private BCryptPasswordEncoder passwordEncoder;
	
	// 유저레시피 상세페이지
	@RequestMapping("/go_userDet.do")
	public ModelAndView go_userDet() {
		ModelAndView mv = new ModelAndView("user/recipe/user_recipe_detail");
		
		return mv;
	}
	
	// 공공레시피 상세페이지
//	@RequestMapping("/go_publicDet.do")
//	public ModelAndView go_publicDet() {
//		ModelAndView mv = new ModelAndView("user/recipe/public_recipe_detail");
//		
//		return mv;
//	}
	
	// 사용자레시피 작성페이지
	@RequestMapping("/go_userWrite.do")
	public ModelAndView go_userWrite() {
		ModelAndView mv = new ModelAndView("user/recipe/user_recipe_write");
		
		return mv;
	}
	
	// 사용자레시피 수정페이지
	@RequestMapping("/go_userUpdate.do")
	public ModelAndView go_userUpdate() {
		ModelAndView mv = new ModelAndView("user/recipe/user_recipe_update");
		
		return mv;
	}
}
