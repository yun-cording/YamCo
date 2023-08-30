package com.yamco.user.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.yamco.user.model.vo.RecentList_VO;
import com.yamco.user.model.vo.U_recipe_VO;

@Controller
public class User_Controller2 {
	
	@RequestMapping("/main.go")
	public ModelAndView homeGo(HttpSession session) {
		ModelAndView mv = new ModelAndView("/main");
		List<RecentList_VO> recent = new ArrayList<RecentList_VO>();
		RecentList_VO vo = new RecentList_VO();
		vo.setIdx("10001");
		vo.setCate("분식");
		vo.setImg("https://mediahub.seoul.go.kr/wp-content/uploads/2020/10/d13ea4a756099add8375e6c795b827ab.jpg");
		vo.setWriter("김심바");
		recent.add(vo);
		RecentList_VO vo2 = new RecentList_VO();
		vo2.setIdx("153");
		vo2.setCate("분식");
		vo2.setImg("https://mediahub.seoul.go.kr/wp-content/uploads/2020/10/d13ea4a756099add8375e6c795b827ab.jpg");
		vo2.setWriter("냠냠레시피");
		recent.add(vo);
		recent.add(vo2);
		session.setAttribute("recent",recent);
		return mv;
	}
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
	@RequestMapping("/search.go")
	public ModelAndView searchGo(String search_text) {
		ModelAndView mv = new ModelAndView("/user/recipe/search_list");
		// 검색어로 DB다녀오기
		
		
		return mv;
	}
	
	
}
