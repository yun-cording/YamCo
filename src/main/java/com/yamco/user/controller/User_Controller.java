package com.yamco.user.controller;

import java.io.File;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;

@Controller
public class User_Controller {
    @Autowired
    private ServletContext servletContext;

	
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
//	@RequestMapping("/go_public_list.do")
//	public ModelAndView goPublicList() {
//		return new ModelAndView("user/recipe/public_list");
//	}
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
	
	// TODO 상우 작업부분
	// TODO 상우 공공데이터 파싱 => 목록 띄우기
	@RequestMapping("/go_public_list.do")
	public ModelAndView go_public_list(HttpServletRequest request, HttpServletResponse response) throws ServletException {
		System.out.println("공공레시피 가즈아");
		ModelAndView mv = new ModelAndView("user/recipe/public_list");
		
//		최근본레시피 용
//		jsp에서 rcp_idx, u_idx(idx), 썸네일용 main 어쩌구 이미지(src), 
//		카테고리(cate), 작성자(writer) => 공공데이터는 writer를 "냠냠레시피"
//		세션추가만
		  // JSON 파일을 읽어올 리소스 경로
		
//	    // JsonNode는 JSON 데이터의 노드를 나타내는 클래스로, 직접적으로 데이터 클래스의 역할을 대신할 수 없습니다.
		 try {
	            ObjectMapper objectMapper = new ObjectMapper();
	            File jsonFile = new File(servletContext.getRealPath("/resources/data/api_data.json"));

	            // File jsonFile = new File("src\\main\\webapp\\resources\\data\\api_data.json"); // JSON 파일 경로
	            // src/main/webapp 안의 리소스 폴더는 웹 애플리케이션 컨텍스트 경로의 일부이기 때문에 상대경로로 
	            // 직접 참조할 수 없습니다. 대신 ServletContext를 사용하여 리소스에 접근해야 합니다.

	            JsonNode rootNode = objectMapper.readTree(jsonFile);

	            if (rootNode != null && rootNode.isObject()) {
	            	// row 안의 자료들 전체를 담음
	    	    	JsonNode recipeDataNode = rootNode.path("COOKRCP01").path("row");
	    	    	System.out.println(recipeDataNode.isNull());
	    	    	// 전체 자료 출력
	    	    	// System.out.println(recipeDataNode);
	    	    	// 자료형은 ArrayNode임
	    	    	System.out.println("자료형은 : " + recipeDataNode.getClass().getName());
	    	    	List<JsonNode> rowList = new ArrayList<>();

	    	    	if (recipeDataNode != null) {
	    	    	    Iterator<JsonNode> iterator = recipeDataNode.elements();
	    	    	    while (iterator.hasNext()) {
	    	    	        JsonNode recipeNode = iterator.next();
	    	    	        rowList.add(recipeNode);
	    	    	    }
	    	    	}

	    	    	request.setAttribute("rowList", rowList);
	    	    	
	            }
		 }catch (Exception e) {
			System.out.println(e);
		}
		
		return mv;
	
	}
	// TODO 상우 공공데이터 파싱 => 목록 띄우기
	
	// TODO 상우 공공데이터 상세페이지
//	@RequestMapping("/go_publicDet.do")
//	public ModelAndView go_publicDet(HttpServletRequest request,
//			@RequestParam String rcp_seq) {
//		ModelAndView mv = new ModelAndView("user/recipe/public_recipe_detail");
//		System.out.println("레시피 고유번호 : " + rcp_seq);
//		
//		try {
////			List<JsonNode> all_list = parsing_all();		
//			
//			List<JsonNode> detail_list = new ArrayList<>();
//			for (JsonNode jsonNode : all_list) {
//				String rcp_seq_api = jsonNode.get("RCP_SEQ").asText();
//				if (rcp_seq.equals(rcp_seq_api)) {
//					detail_list.add(jsonNode);
//				}
//			}
//			System.out.println(detail_list);
//			mv.addObject("detail_list", detail_list);
//			
//			return mv;
//		} catch (Exception e) {
//		    while(true) {
//		    	try {
//					
//					List<JsonNode> detail_list = new ArrayList<>();
//					for (JsonNode jsonNode : all_list) {
//						String rcp_seq_api = jsonNode.get("RCP_SEQ").asText();
//						if (rcp_seq.equals(rcp_seq_api)) {
//							detail_list.add(jsonNode);
//						}
//					}
//					System.out.println(detail_list);
//					mv.addObject("detail_list", detail_list);
//					
//					return mv;
//				} catch (Exception e2) {
//					mv = new ModelAndView("error500");
//					return null;
//				}
//		    }
//		}
//	}
	
	// TODO 상우 공공데이터 자료 전체 받아서 반환하기
	
	
	    
	    


	
	
	// TODO 상우 작업부분
}
