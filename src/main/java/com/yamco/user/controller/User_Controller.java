package com.yamco.user.controller;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.yamco.user.model.service.U_recipe_Service;
import com.yamco.user.model.vo.U_recipe_meta_VO;

@Controller
public class User_Controller {
	@Autowired
	U_recipe_Service u_recipe_Service;

	@GetMapping("/go_home.do")
	public ModelAndView go_home() {
		ModelAndView mv = new ModelAndView("/home");
		return mv;
	}

	@RequestMapping("go_ranking_search.do")
	public ModelAndView go_ranking_search() {
		return new ModelAndView("user/ranking/ranking_search");
	}

	@RequestMapping("go_ranking_recipe.do")
	public ModelAndView go_ranking_recipe() {
		ModelAndView mv = new ModelAndView("user/ranking/ranking_recipe");
		List<U_recipe_meta_VO> result = u_recipe_Service.getU_recipeRankListRecipe();
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

	@RequestMapping("/go_drag.do")
	public ModelAndView go_drag() {
		return new ModelAndView("admin/draganddrop");
	}

	// TODO 상우 공공데이터 파싱
	@RequestMapping("/getplist.do")
	public ModelAndView test(HttpServletRequest request) {
		ModelAndView mv = new ModelAndView("test/test");

		String apiKey = "157eb67278c64819b531"; // 성훈 API key
		String apiUrl = "https://openapi.foodsafetykorea.go.kr/api/" + apiKey + "/COOKRCP01/json/1/1000";

		try {
			URL url = new URL(apiUrl);
			HttpURLConnection connection = (HttpURLConnection) url.openConnection();
			connection.setRequestMethod("GET");

			BufferedReader reader = new BufferedReader(new InputStreamReader(connection.getInputStream()));

			StringBuilder jsonContent = new StringBuilder();
			String line;
			while ((line = reader.readLine()) != null) {
				jsonContent.append(line);
			}

			ObjectMapper objectMapper = new ObjectMapper();
			JsonNode rootNode = objectMapper.readTree(jsonContent.toString());

			// 전체 path 안으로 들어감.
			JsonNode rowNode = rootNode.path("COOKRCP01").path("row");
			int count = 0;
			if (rowNode.isArray()) {
				ArrayList<String> rcpPat2Values = new ArrayList<>();
				for (JsonNode itemNode : rowNode) {
					// 조리법 1 (\n 제거, ● 방울토마토 : 이런 value 전체 제거)
					String rcpPat2Value = itemNode.path("RCP_PARTS_DTLS").asText().replaceAll("\\n", "");
					if (rcpPat2Value.contains("●") || rcpPat2Value.contains("•") || rcpPat2Value.contains("재료")
							|| rcpPat2Value.startsWith(".")) {
					} else {
						count++;
						rcpPat2Values.add(rcpPat2Value);
						System.out.println(rcpPat2Value);
						System.out.println();
					}
				}
				request.setAttribute("rcpPat2Values", rcpPat2Values);
				request.setAttribute("count", count);
				System.out.println("자료 갯수는 : " + count);
				// 동그라미 특문 2개 뺐을 때 자료갯수는 925개.

				// 특문 2개(●, •) + 재료 or 주재료로 시작하는 자료 + . 으로만 된 자료까지 뺐을 때 갯수는 793개

			}

			connection.disconnect();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return mv;
	}
	// TODO 상우 공공데이터 파싱 끝
}
