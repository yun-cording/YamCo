package com.yamco.user.controller;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.security.auth.callback.ConfirmationCallback;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.fasterxml.jackson.databind.JsonNode;
import com.yamco.admin.model.service.Log_Service;
import com.yamco.api.model.service.P_recipe_Service;
import com.yamco.user.model.service.Member_Service;
import com.yamco.user.model.service.U_recipe_Service;
import com.yamco.user.model.vo.Member_VO;
import com.yamco.user.model.vo.U_recipe_meta_VO;

@Controller
public class User_Controller {
    
	@Autowired
	U_recipe_Service u_recipe_Service;
	@Autowired
	private Member_Service member_Service;
	@Autowired
	Log_Service log_Service;
	
	@GetMapping("/go_home.do")
	public ModelAndView go_home() {
		// DB에 방문자수 로그 찍기
//		log_Service.visitorUp();
		ModelAndView mv = new ModelAndView("/home");
		return mv;
	}

	@RequestMapping("/go_ranking_search.do")
	public ModelAndView go_ranking_search() {
		// DB에 방문자수 로그 찍기
//		log_Service.visitorUp();
		return new ModelAndView("user/ranking/ranking_search");
	}

	@RequestMapping("/go_ranking_recipe.do")
	public ModelAndView go_ranking_recipe() {
		ModelAndView mv = new ModelAndView("user/ranking/ranking_recipe");
		List<U_recipe_meta_VO> result = u_recipe_Service.getU_recipeRankListRecipe1Month();
		mv.addObject("lank_list_recipe", result);

		return mv;
	}

	@RequestMapping("/go_ranking_recipe_7day.do")
	public ModelAndView go_ranking_recipe_7Days() {
		ModelAndView mv = new ModelAndView("user/ranking/ranking_recipe_7day");
		List<U_recipe_meta_VO> result = u_recipe_Service.getU_recipeRankListRecipe7Days();
		mv.addObject("lank_list_recipe", result);

		return mv;
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

	@RequestMapping("go_main.do")
	public ModelAndView go_main() {
		return new ModelAndView("/main");
	}

	@RequestMapping("go_error404.do")
	public ModelAndView go_error404() {
		return new ModelAndView("/error404");
	}

	@RequestMapping("go_error500.do")
	public ModelAndView go_error500() {
		return new ModelAndView("/error500");
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
	public ModelAndView go_new_pw(@RequestParam("m_id") String m_id, Member_VO mvo) {
		ModelAndView mv = new ModelAndView("login/new_pw");
		
		mvo.setM_id(m_id);
		mv.addObject("mvo", mvo);
		
		Member_VO m_vo = member_Service.getEmailId(mvo);
		try {
			Date now = new Date();
			SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			String date = formatter.format(now);
			
			Date t_time = formatter.parse(m_vo.getM_t_time().toString());
			Date n_time = formatter.parse(date);
			
			long s_time = t_time.getTime();
			long e_time = n_time.getTime();
			System.out.println(s_time);
			System.out.println(e_time);
			
			long diff = e_time - s_time;
			long diffMin = diff / (1000*60);
			System.out.println(diffMin);
			if(diffMin >= 30) {
				String mail_alert = "<script>alert('30분이 지나 세션이 만료되었습니다. 비밀번호 변경 페이지로 돌아가 이메일을 다시 입력해주세요.');window.location.href='/go_login.do'</script>";
				member_Service.getTokenDelete(m_vo);
				mv.addObject("mail_alert", mail_alert);
			}
			return mv;	
		} catch (Exception e) {
			e.printStackTrace();
			mv.setViewName("error404");
		}
		return null;	
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

	@RequestMapping("/go_drag.do")
	public ModelAndView go_drag() {
		return new ModelAndView("admin/draganddrop");
	}
}