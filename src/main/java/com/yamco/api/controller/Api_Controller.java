package com.yamco.api.controller;

import java.math.BigDecimal;
import java.math.RoundingMode;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.fasterxml.jackson.databind.JsonNode;
import com.yamco.api.model.service.P_recipe_Service;
import com.yamco.api.model.vo.P_recipe_VO;
import com.yamco.user.model.service.Member_Service;
import com.yamco.user.model.vo.Comment_VO;
import com.yamco.user.model.vo.Member_VO;

@Controller
public class Api_Controller {
	@Autowired
	P_recipe_Service p_recipe_Service;
	@Autowired
	Member_Service member_Service;
//	@Autowired
//	private Paging paging;
//	@Autowired
//	private BCryptPasswordEncoder passwordEncoder;
	
	// TODO 상우 작업부분
	// 유저레시피 상세페이지
	@RequestMapping("/go_userDet.do")
	public ModelAndView go_userDet() {
		ModelAndView mv = new ModelAndView("user/recipe/user_recipe_detail");
		
		return mv;
	}
	
	// 공공레시피 상세페이지
	@RequestMapping("/go_publicDet.do")
	public ModelAndView go_publicDet(@RequestParam("rcp_seq") String rcpSeq, HttpSession session) {
		ModelAndView mv = new ModelAndView("user/recipe/public_recipe_detail");
		// 공공리스트 전체 리스트 받아오자
		List<JsonNode> rowList = p_recipe_Service.go_public_list();
		// 그중에서 rcpSeq가 받아온 값과 일치하는 녀석만 정보를 빼오자.
		System.out.println(rowList.size());
		
	
		
		// 필터링
		List<JsonNode> detail_list = new ArrayList<>();
		
		String[] manual = new String[5];
        String[] manualImg = new String[5];
		
		for (JsonNode jsonNode : rowList) {
		    JsonNode rcpSeqNode = jsonNode.get("RCP_SEQ"); // json 파일에서 RCP_SEQ 키 값 가져오기
		    // 받아온 하나의 Node
		    System.out.println(rcpSeqNode);
		    
		    if (rcpSeqNode != null && rcpSeqNode.asText().equals(rcpSeq)) {
		    	detail_list.add(jsonNode); // 조건에 맞는 경우 리스트에 추가
		    	System.out.println("추가중!");
	           for (int i = 1; i <= 5; i++) {
	               manual[i - 1] = jsonNode.get("MANUAL0" + i).asText();
	               manualImg[i - 1] = jsonNode.get("MANUAL_IMG0" + i).asText();
	           }
		    }
		}

		// RCP_SEQ와 일치하는 rcp_idx 세션에 담기
		session.setAttribute("rcp_idx", rcpSeq);

		// DB 가서 평점 받아오자 (rcpSeq를 기반으로 idx + 1 숫자를 뽑아와서 ㄱ  
		String avg_rating = p_recipe_Service.article_rating(String.valueOf(rcpSeq));
		// System.out.println("평점은" + avg_rating);
		
		
    	
    	// wishlist 여부 받아오기
    	String m_idx = (String)session.getAttribute("m_idx");
    	System.out.println("id는 : " + m_idx);
    	String liked_ornot = p_recipe_Service.liked_ornot(m_idx, String.valueOf(rcpSeq));
    	System.out.println("좋아요했는가 : " + liked_ornot);
    	// 좋아요 안함
		mv.addObject("liked_ornot", liked_ornot);
		
		// 이 게시물에 들어간 댓글 전체 받아오기
		List<Comment_VO> comments_list_all = p_recipe_Service.load_all_comments(String.valueOf(rcpSeq));
		for (Comment_VO comment_VO : comments_list_all) {
//			System.out.println(comment_VO.getC_contents());
		}
		
		List<Comment_VO> comments_list_mine = new ArrayList<>();
		
		// comments_list_all에서 특정 rcp_idx 값을 가진 댓글만 필터링하여 comments_list_mine에 추가
		for (Comment_VO comment : comments_list_all) {
		    if (String.valueOf(comment.getRcp_idx()).equals(String.valueOf(rcpSeq))) {
		        comments_list_mine.add(comment);
		    }
		}
		System.out.println("내꺼 갯수 : " + comments_list_mine.size());
		
		// 댓글 전체리스트
		// 이용자 id도 보내주자
		mv.addObject("m_idx", m_idx);
		mv.addObject("comments_list_all", comments_list_all);
		mv.addObject("manual", manual);
		mv.addObject("manualImg", manualImg);
    	// 전체 onelist 뽑기
    	System.out.println(detail_list);
		mv.addObject("detail_list", detail_list);
		mv.addObject("avg_rating", avg_rating);
//		mv.addObject("manualMap", manualMap);
		System.out.println("detail list 갔다!");
		
				
		return mv;
	}
	
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
	
	// TODO 상우 공공데이터 파싱 => 목록 띄우기
	@RequestMapping("/go_public_list.do")
	public ModelAndView go_public_list(HttpServletRequest request, HttpServletResponse response) throws ServletException {
		ModelAndView mv = new ModelAndView("user/recipe/public_list");
		
		List<JsonNode> rowList = p_recipe_Service.go_public_list();
		List<P_recipe_VO> prvo = p_recipe_Service.article_summary();	
		
		List<P_recipe_VO> listSummary = new ArrayList<>();
		int count = 0;
		// 있는지 없는지 검사
		    for (int i = 0; i < rowList.size(); i++) {
		    	P_recipe_VO vo = new P_recipe_VO();
		        JsonNode k = rowList.get(i);	
		        try {
		        	vo = prvo.get(i);
		        	// String 맞음
//		        	System.out.println(vo.getAvg_c_grade().getClass().getName());
//		        	vo.setAvg_c_grade(String.format("%.1f", vo.getAvg_c_grade()));
		        	
		              if (vo.getAvg_c_grade() != null) {
		                  BigDecimal avgCGrade = new BigDecimal(vo.getAvg_c_grade()).setScale(1, RoundingMode.HALF_UP);
		                  vo.setAvg_c_grade(avgCGrade.toString());
		              }
		        }catch (Exception e) {
		        	count++;
//		        	System.out.println("vo 빈값, count는 : " + count);
				}

		        String rcpSeq = k.get("RCP_SEQ").asText();
		        String attFileNoMain = k.get("ATT_FILE_NO_MAIN").asText();
		        String rcpNm = k.get("RCP_NM").asText();
		        
		        // 자바 빈 규약에 맞게 변경 _ 없애기
		        vo.setRcpSeq(rcpSeq);
		        vo.setAttFileNoMain(attFileNoMain);
		        vo.setRcpNm(rcpNm);

		        listSummary.add(vo);
		    }
		    return mv.addObject("listSummary", listSummary);
	}
	// TODO 상우 공공데이터 파싱 => 목록 띄우기
	
	
	// TODO 상우 공공데이터 자료 전체 받아서 반환하기
	
	// TODO 상우 공공데이터 자료 전체 받아서 반환하기
	
	// TODO 상우 작업부분
}
	



