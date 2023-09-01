package com.yamco.user.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.yamco.user.model.service.RandomService;
import com.yamco.user.model.vo.Random_VO;

@Controller
public class User_Controller2 {
	
	// TODO 재훈 메인 시작
	@Autowired
	private RandomService randomService;
	
	@RequestMapping("/main.go")
	public ModelAndView homeGo() {
		ModelAndView mv = new ModelAndView("/main"); 
		// TODO 재훈 랜덤 재료(자정 초기화) 시작
		 Random_VO selectedFile = randomService.getSelectedFile();
		 System.out.println("윽");
		 System.out.println("selectedFile : " +selectedFile.getFood_img());
		 mv.addObject("selectedFile", selectedFile);
		 // TODO 재훈 랜덤 재료(자정 초기화) 끝
		
		return mv;
	}
//	@RequestMapping("/")
//	public ModelAndView homeGo() {
//		ModelAndView mv = new ModelAndView("/"); 
//		// 이건 나중에 메인을 시작 페이지로 할때 쓰일 예정 위에 이동만 바꿔주면됨
//		return mv;
//	}
	
	// TODO 재훈 메인 끝
	@RequestMapping("/public_list.go")
	public ModelAndView publicListGo() {
		ModelAndView mv = new ModelAndView("/user/recipe/public_list");
		return mv;
	}
	@RequestMapping("/user_list.go")
	public ModelAndView userListGo() {
		ModelAndView mv = new ModelAndView("/user/recipe/user_list");
		return mv;
	}
	@RequestMapping("/ranking_recipe.go")
	public ModelAndView rankingRecipeGo() {
		ModelAndView mv = new ModelAndView("/user/ranking/ranking_recipe");
		return mv;
	}
	@RequestMapping("/ranking_search.go")
	public ModelAndView rankingSearchGo() {
		ModelAndView mv = new ModelAndView("/user/ranking/ranking_search");
		return mv;
	}
	@RequestMapping("/award.go")
	public ModelAndView awardGo() {
		ModelAndView mv = new ModelAndView("/user/award/award");
		return mv;
	}
	@RequestMapping("/faq.go")
	public ModelAndView faqGo() {
		ModelAndView mv = new ModelAndView("/user/faq/faq");
		return mv;
	}
	@RequestMapping("/plz.go")
	public ModelAndView plzGo() {
		ModelAndView mv = new ModelAndView("/user/plz/plz");
		return mv;
	}
	@RequestMapping("/login.go")
	public ModelAndView loginGo() {
		ModelAndView mv = new ModelAndView("/login/login");
		return mv;
	}
	@RequestMapping("/member_join.go")
	public ModelAndView memberJoinGo() {
		ModelAndView mv = new ModelAndView("/login/member_join");
		return mv;
	}
	@RequestMapping("/find_pw.go")
	public ModelAndView findPwGo() {
		ModelAndView mv = new ModelAndView("/login/find_pw");
		return mv;
	}
	@RequestMapping("/new_pw.go")
	public ModelAndView newPwGo() {
		ModelAndView mv = new ModelAndView("/login/new_pw");
		return mv;
	}
	@RequestMapping("/social_join.go")
	public ModelAndView socialJoinGo() {
		ModelAndView mv = new ModelAndView("/social_join");
		return mv;
	}
	@RequestMapping("/user_recipe_write.go")
	public ModelAndView userRecipeWriteGo() {
		ModelAndView mv = new ModelAndView("/user/recipe/user_recipe_write");
		return mv;
	}
	@RequestMapping("/myinfo.go")
	public ModelAndView myinfoGo() {
		ModelAndView mv = new ModelAndView("/mypage/myinfo");
		return mv;
	}
	@RequestMapping("/mywishlist.go")
	public ModelAndView myWishListGo() {
		ModelAndView mv = new ModelAndView("/mypage/myWishList");
		return mv;
	}
	@RequestMapping("/reportcontent.go")
	public ModelAndView reportContentGo() {
		ModelAndView mv = new ModelAndView("/mypage/reportContent");
		return mv;
	}
	@RequestMapping("/mycontent.go")
	public ModelAndView myContentGo() {
		ModelAndView mv = new ModelAndView("/mypage/myContent");
		return mv;
	}
	@RequestMapping("/mycomment.go")
	public ModelAndView myCommentGo() {
		ModelAndView mv = new ModelAndView("/mypage/myComment");
		return mv;
	}
	
	@RequestMapping("/public_recipe_detail.go")
	public ModelAndView publicRecipeDetailGo() {
		ModelAndView mv = new ModelAndView("/user/recipe/public_recipe_detail");
		// 레시피 번호받아와서 상세정보 출력하기
		return mv;
	}
	
}
