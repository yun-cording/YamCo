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
import com.yamco.user.model.vo.RecentList_VO;

@Controller
public class Api_Controller {
	@Autowired	
	P_recipe_Service p_recipe_Service;
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
	public ModelAndView go_publicDet(@RequestParam("rcp_seq") String rcpSeq, HttpSession session ) {
		ModelAndView mv = new ModelAndView("user/recipe/public_recipe_detail");
		// 공공리스트 전체 리스트 받아오자
		List<JsonNode> rowList = p_recipe_Service.go_public_list();
		// 그중에서 rcpSeq가 받아온 값과 일치하는 녀석만 정보를 빼오자.
		
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
		String cate="";
		String img ="";
		String title="";
		for (JsonNode jsonNode : rowList) {
		    JsonNode rcpSeqNode = jsonNode.get("RCP_SEQ"); // rcpSeq 키의 값 가져오기
		    // 받아온 하나의 Node
//		    System.out.println(rcpSeqNode);

		    if (rcpSeqNode != null && rcpSeqNode.asText().equals(rcpSeq)) {
		    	detail_list.add(jsonNode); // 조건에 맞는 경우 리스트에 추가
		    	System.out.println("추가중!");
		    	for (int i = 1; i < 6; i++) {
				     cate = jsonNode.get("RCP_PAT2").asText();
				     img = jsonNode.get("ATT_FILE_NO_MAIN").asText();
				     title = jsonNode.get("RCP_NM").asText();
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
    
//    	System.out.println(vo.getManual01());
//    	System.out.println(vo.getManual02());
//    	System.out.println(vo.getManual03());
//    	System.out.println(vo.getManual04());
//    	System.out.println(vo.getManual05());
		
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
		mv.addObject("detail_list", detail_list);
		mv.addObject("pDetailVO", vo);
//		mv.addObject("manualMap", manualMap);
		System.out.println("detail list 갔다!");
		// 전체 리스트
		System.out.println(detail_list);
		// TODO 희준 세션에 최근리스트 추가하기 시작
		List<RecentList_VO> recent = (List<RecentList_VO>) session.getAttribute("recent");
		RecentList_VO rec_vo = new RecentList_VO();
		if (recent == null) {
		    recent = new ArrayList<RecentList_VO>();
		}
		boolean found = false;
		for (RecentList_VO k : recent) {
		    if (k.getIdx().equals(rcpSeq)) {
		    	found = true;
		    }
		}
		if(!found) {
			rec_vo.setIdx(rcpSeq);
			rec_vo.setCate(cate);
			rec_vo.setImg(img);
			rec_vo.setTitle(title);
			rec_vo.setWriter("공공데이터 제공");
			recent.add(0, rec_vo);
			if(recent.size()<4) {
				recent.subList(0, recent.size()-1);
			}else {
				recent = recent.subList(0, 3);
			}
	        session.setAttribute("recent", recent);
		}
		// TODO 희준 세션에 최근리스트 추가하기 끝
		
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
	



