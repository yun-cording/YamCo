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

		String manual01 = "";
		String manual02 = "";
		String manual03 = "";
		String manual04 = "";
		String manual05 = "";
		String manual_img01 = "";
		String manual_img02 = "";
		String manual_img03 = "";
		String manual_img04 = "";
		String manual_img05 = "";
		
		String[] manual = new String[5];
        String[] manualImg = new String[5];
		
		for (JsonNode jsonNode : rowList) {
		    JsonNode rcpSeqNode = jsonNode.get("RCP_SEQ"); // rcpSeq 키의 값 가져오기
		    // 받아온 하나의 Node
//		    System.out.println(rcpSeqNode);
		    
		    if (rcpSeqNode != null && rcpSeqNode.asText().equals(rcpSeq)) {
		    	detail_list.add(jsonNode); // 조건에 맞는 경우 리스트에 추가
		    	System.out.println("추가중!");
		    	for (int i = 1; i < 6; i++) {
					 manual01 = jsonNode.get("MANUAL01").asText();
					 manual02 = jsonNode.get("MANUAL02").asText();
					 manual03 = jsonNode.get("MANUAL03").asText();
					 manual04 = jsonNode.get("MANUAL04").asText();
					 manual05 = jsonNode.get("MANUAL05").asText();
					 manual_img01 = jsonNode.get("MANUAL_IMG01").asText();
					 manual_img02 = jsonNode.get("MANUAL_IMG02").asText();
					 manual_img03 = jsonNode.get("MANUAL_IMG03").asText();
					 manual_img04 = jsonNode.get("MANUAL_IMG04").asText();
					 manual_img05 = jsonNode.get("MANUAL_IMG05").asText();
				}
	           for (int i = 1; i <= 5; i++) {
	               manual[i - 1] = jsonNode.get("MANUAL0" + i).asText();
	               manualImg[i - 1] = jsonNode.get("MANUAL_IMG0" + i).asText();
	           }
		    }
		}

		
		
		int targetIndex = -1; // 일치하는 인덱스를 찾을 때 초기값 설정
	    int rcp_idx = 0;

		for (int i = 0; i < rowList.size(); i++) {
		    JsonNode jsonNode = rowList.get(i);
		    JsonNode rcpSeqNode = jsonNode.get("RCP_SEQ"); // RCP_SEQ 키의 값

		    if (rcpSeqNode != null && rcpSeqNode.isTextual() && rcpSeqNode.asText().equals(rcpSeq)) {
		        targetIndex = i;
		        break; // 일치하는 인덱스를 찾았으므로 루프 종료
		    }
		}

		if (targetIndex != -1) {
			rcp_idx = targetIndex + 1;
		    System.out.println("일치하는 인덱스 + 1: " + rcp_idx);
		} else {
		    System.out.println("일치하는 값이 없습니다.");
		}

		// DB 가서 평점 받아오자 (rcpSeq를 기반으로 idx + 1 숫자를 뽑아와서 ㄱ  
		String avg_rating = p_recipe_Service.article_rating(String.valueOf(rcp_idx));
		// System.out.println("평점은" + avg_rating);
		
		
		
    	P_recipe_VO vo = new P_recipe_VO();
    	vo.setManual01(manual01);
    	vo.setManual02(manual02);
    	vo.setManual03(manual03);
    	vo.setManual04(manual04);
    	vo.setManual05(manual05);
    	vo.setManualImg01(manual_img01);
    	vo.setManualImg02(manual_img02);
    	vo.setManualImg03(manual_img03);
    	vo.setManualImg04(manual_img04);
    	vo.setManualImg05(manual_img05);

		
		// Map으로 해도 오류 
//		Map<String, String> manualMap = new HashMap<>();
//		for (JsonNode jsonNode : detail_list) {
//			System.out.println(jsonNode);
//			for (int i = 1; i < 21; i++) {
//				try {
//				    String key = "MANUAL0" + i;
//				    String value = jsonNode.get(key).asText();
//				    manualMap.put(key, value);
//				} catch (Exception e) {
//					// TODO: handle exception
//				}
//			}
//		}
		

		
//		String rcpSeq = k.get("RCP_SEQ").asText();
//		String attFileNoMain = k.get("ATT_FILE_NO_MAIN").asText();
//		String rcpNm = k.get("RCP_NM").asText();
    	
    	
    	
    	
    	// 이런 레시피는 어떠세요??? 
    	// 전체 자료에서 
    	
    	// RCP_WAY2 조리방법
    	// RCP_PARTS_DTLS 레시피
    	// RCP_PAT2 카테고리
//    	 List<Integer> matchingRcpSeqValues = new ArrayList<>();
//
//         for (JsonNode detail : detail_list) {
//             // detail_list의 각 항목에 대해 RCP_SEQ 값 가져오기 (int 변환)
//             int detailRcpSeq = detail.get("RCP_SEQ").asInt();
//
//             // rowList에서 RCP_SEQ와 일치하는 항목을 찾습니다.
//             for (JsonNode row : rowList) {
//                 int rowRcpSeq = row.get("RCP_SEQ").asInt();
//                 
//                 // RCP_SEQ가 일치하면 해당 값을 matchingRcpSeqValues에 추가합니다.
//                 if (detailRcpSeq == rowRcpSeq) {
//                     matchingRcpSeqValues.add(rowRcpSeq);
//                     break; // 이미 찾았으므로 다음 detail 항목으로 이동합니다.
//                 }
//             }
//         }
//
//         // 결과 출력
//         System.out.println("Matching RCP_SEQ values:");
//         for (int rcpSeq : matchingRcpSeqValues) {
//             System.out.println(rcpSeq);
//         }
//    	
    	
    	// wishlist 여부 받아오기
    	String m_idx = (String)session.getAttribute("m_idx");
    	System.out.println("id는 : " + m_idx);
    	String liked_ornot = p_recipe_Service.liked_ornot(m_idx, String.valueOf(rcp_idx));
    	System.out.println("좋아요했는가 : " + liked_ornot);
    	// 좋아요 안함
		mv.addObject("liked_ornot", liked_ornot);
		
		// 내가 쓴 댓글 목록 받아오기
		Member_VO mvo = member_Service.getMemberOne(m_idx);
		List<Comment_VO> comments_list = p_recipe_Service.load_comments(mvo.getM_nick(), String.valueOf(rcp_idx));
		for (Comment_VO comment_VO : comments_list) {
//			System.out.println(comment_VO.getC_contents());
		}
		
		// 이 게시물에 들어간 댓글 전체 받아오기
		List<Comment_VO> comments_list_all = p_recipe_Service.load_all_comments(String.valueOf(rcp_idx));
		for (Comment_VO comment_VO : comments_list_all) {
//			System.out.println(comment_VO.getC_contents());
		}
		
		List<Comment_VO> comments_list_mine = new ArrayList<>();
		
		// comments_list_all에서 특정 rcp_idx 값을 가진 댓글만 필터링하여 comments_list_mine에 추가
		for (Comment_VO comment : comments_list_all) {
		    if (String.valueOf(comment.getRcp_idx()).equals(rcp_idx)) {
		        comments_list_mine.add(comment);
		    }
		}
		System.out.println("내꺼 갯수 : " + comments_list_mine.size());
		
		

		// comments_list_mine에는 특정 rcp_idx 값에 해당하는 댓글만 들어있게 됩니다.


		// 댓글 전체리스트
		mv.addObject("comments_list_all", comments_list_all);
    	// 전체 onelist 뽑기
    	System.out.println(detail_list);
		mv.addObject("detail_list", detail_list);
		mv.addObject("pDetailVO", vo);
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
	



