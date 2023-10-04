package com.yamco.user.controller;

import java.io.File;
import java.math.BigDecimal;
import java.math.RoundingMode;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.UUID;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.fasterxml.jackson.databind.JsonNode;
import com.yamco.admin.model.service.AdminService;
import com.yamco.admin.model.service.Log_Service;
import com.yamco.admin.model.vo.Report_VO;
import com.yamco.admin.model.vo.Admin_Report_VO;
import com.yamco.api.model.dao.P_recipe_DAO;
import com.yamco.api.model.service.P_recipe_Service;
import com.yamco.api.model.vo.P_recipe_VO;
import com.yamco.user.model.service.Comment_Service;
import com.yamco.user.model.service.Images_Service;
import com.yamco.user.model.service.Main_Service;
import com.yamco.user.model.service.Member_Service;
import com.yamco.user.model.service.RandomService;
import com.yamco.user.model.service.Report_t_Service;
import com.yamco.user.model.service.U_recipe_Service;
import com.yamco.user.model.service.User_Service;
import com.yamco.user.model.service.User_log_Service;
import com.yamco.user.model.vo.Comment_VO;
import com.yamco.user.model.vo.Comment_meta_VO;
import com.yamco.user.model.vo.Member_VO;
import com.yamco.user.model.vo.Member_meta_VO;
import com.yamco.user.model.vo.Notice_VO;
import com.yamco.user.model.vo.Random_save_VO;
import com.yamco.user.model.vo.Ref_VO;
import com.yamco.user.model.vo.Report_t_meta_VO;
import com.yamco.user.model.vo.U_recipe_Search_VO;
import com.yamco.user.model.vo.U_recipe_VO;
import com.yamco.user.model.vo.U_recipe_meta_VO;

@Controller
public class User_Controller2 {

	@Autowired
	private RandomService randomService;
	@Autowired
	private Images_Service images_Service;
	@Autowired
	private Main_Service main_service;

	@Autowired
	private U_recipe_Service u_recipe_Service;
	@Autowired
	private Member_Service member_Service;
	@Autowired
	private User_log_Service user_log_Service;
	@Autowired
	private BCryptPasswordEncoder passwordEncoder;
	@Autowired
	private P_recipe_Service p_recipe_Service;
	@Autowired
	private User_Service user_Service;
	@Autowired
	private Log_Service log_Service;
	@Autowired
	private Comment_Service comment_Service;
	@Autowired
	private Report_t_Service report_t_Service;
	@Autowired
	private P_recipe_DAO p_Recipe_DAO;
	@Autowired
	private AdminService admin_Service;

	@RequestMapping("/main.do")
	public ModelAndView homeGo(HttpSession session) {
		ModelAndView mv = new ModelAndView("/main");

		// TODO 재훈 메인 시작
		// TODO 재훈 랜덤 재료(자정 초기화) 시작
		Random_save_VO saveVO = randomService.getSelectedFile();
		mv.addObject("saveVO", saveVO);
		// TODO 재훈 랜덤 재료(자정 초기화) 끝
		// TODO 재훈 공지,광고 가져오기 시작

		List<Notice_VO> list  = images_Service.getNoticeList();
		mv.addObject("noticeList", list);

		// TODO 재훈 공지,광고 가져오기 끝
		// TODO 재훈 최신 레시피 가져오기 시작
		
		List<U_recipe_meta_VO> user_list  = main_service.getUsertrendList();
		mv.addObject("userList", user_list);
		
		// TODO 재훈 최신 레시피 가져오기 끝
		
		// TODO 재훈 베스트 레시피 가져오기 시작
		
		List<U_recipe_meta_VO> best_list  = main_service.getbestList();
		mv.addObject("bestList", best_list);
		
		// TODO 재훈 베스트 레시피 가져오기 끝
		
		// TODO 재훈 베스트 레시피 가져오기 시작
		
		List<Member_meta_VO> award_list  = main_service.getmainAwardList();
		mv.addObject("award_list", award_list);
		
		// TODO 재훈 베스트 레시피 가져오기 끝
		// TODO 재훈 메인 끝
		// TODO 희준 bestList초기화 시작
		List<U_recipe_meta_VO> bestList = new ArrayList<U_recipe_meta_VO>();
		List<String> idxList =  user_log_Service.getBestListIdx();
		if(idxList.size()>5) {
			idxList = idxList.subList(0, 4); // 5개이상이면 5개로 자르기
		}
		for (String k : idxList) {
			int rcp_idx = Integer.parseInt(k);
			if(rcp_idx>=10000) {
				// 사용자 metadata 가져오기
				U_recipe_meta_VO mvo = u_recipe_Service.getSelectOne(k);
				bestList.add(mvo);
			}else {
				// json 가져오기
				// TODO 공공데이터 시작
				List<JsonNode> rowList = p_recipe_Service.go_public_list();
				List<P_recipe_VO> prvo = p_recipe_Service.article_summary();
				for (int i = 0; i < rowList.size(); i++) {
					JsonNode k2 = rowList.get(i);
					String rcpSeq = k2.get("RCP_SEQ").asText();
					String rcpNm = k2.get("RCP_NM").asText();
					P_recipe_VO vo = new P_recipe_VO();
					vo = prvo.get(i);
					if (vo.getAvg_c_grade() != null) {
						BigDecimal avgCGrade = new BigDecimal(vo.getAvg_c_grade()).setScale(1, RoundingMode.HALF_UP);
						vo.setAvg_c_grade(avgCGrade.toString());
					}
					if (k.equals(rcpSeq)) {
						U_recipe_meta_VO pvo = new U_recipe_meta_VO();
						pvo.setRcp_idx(rcpSeq);
						if (vo.getAvg_c_grade() == null) {
							pvo.setAvg_grade("0");
						} else {
							pvo.setAvg_grade(vo.getAvg_c_grade());
						}
						pvo.setU_rcp_title(rcpNm);
						bestList.add(pvo);
						// TODO 공공데이터 끝
					}
				}
			}
		}
		session.setAttribute("bestList2",bestList);
		// TODO 희준 bestList초기화 끝
		return mv;
	}

	
	// TODO 상우 게시물 찜 누르기 시작
	@RequestMapping("/wish_ornot.do")
	// ajax 사용할 때는 이거 무조건 넣어야 함!! response (반응형)
	@ResponseBody
	public Map<String, String> wish_ornot(HttpServletRequest request, HttpServletResponse response, HttpSession session,
			@RequestParam(value = "m_idx", required = false) String m_idx,
			@RequestParam(value = "rcp_idx", required = false) String rcp_idx
			) {
		// 세션에서 String 형태로 rcp_idx 받아오자
	    Map<String, String> response_map = new HashMap<>();
	    

	    // m_idx 받아오기
	    m_idx = (String) session.getAttribute("m_idx");
	    rcp_idx = (String) session.getAttribute("rcp_idx");

		// rcp_idx, m_idx 보내야 함.
		String liked_ornot_result = "0";
		
		// DB에서 받아오는 로직 추가
		liked_ornot_result = p_Recipe_DAO.liked_ornot(m_idx, rcp_idx);
		
		if (liked_ornot_result == "1") {
			// liked_ornot이 1이면(좋아요를 insert 했다면) 좋아요 되어있음 반환
			response_map.put("resultValue", "1");
		}else if (liked_ornot_result == "0") {
			// 아니라면 좋아요 해제함 반환
			response_map.put("resultValue", "0");
		}
		
		return response_map;
	}
	
	// TODO 상우 게시물 찜 누르기 완료

	

	@RequestMapping("/ranking_recipe.do")
	public ModelAndView rankingRecipeGo(HttpServletRequest request, HttpServletResponse response) {
		// 랭킹
		// 상우 DB에 방문자수 로그 찍기 (랭킹)
		log_Service.visitorUp(request, response);
		ModelAndView mv = new ModelAndView("/user/ranking/ranking_recipe");
		return mv;
	}

	@RequestMapping("/ranking_search.do")
	public ModelAndView rankingSearchGo() {
		ModelAndView mv = new ModelAndView("/user/ranking/ranking_search");
		List<String> result = user_log_Service.getU_recipeRankListSearch1Month();
		mv.addObject("lank_list_search", result);
		return mv;
	}

	@RequestMapping("/ranking_search_7day.do")
	public ModelAndView rankingSearch7DayGo() {
		ModelAndView mv = new ModelAndView("/user/ranking/ranking_search_7day");
		List<String> result = user_log_Service.getU_recipeRankListSearch7Days();
		mv.addObject("lank_list_search", result);
		return mv;
	}

	@RequestMapping("/award.do")
	public ModelAndView awardGo(HttpServletRequest request, HttpServletResponse response) {
		// 상우 DB에 방문자수 로그 찍기 (랭킹)
		log_Service.visitorUp(request, response);
		ModelAndView mv = new ModelAndView("/user/award/award");
		List<Member_meta_VO> awardList = member_Service.getAwardList();
		Map<String, U_recipe_meta_VO> recipeMap = new HashMap<>();

		Integer count = 0;
		for (Iterator<Member_meta_VO> iterator = awardList.iterator(); iterator.hasNext();) {
			Member_meta_VO mmvo = (Member_meta_VO) iterator.next();
			String rcp_idx = mmvo.getMax_hit_1mon_rcp_idx();

			if (rcp_idx == null) {
				recipeMap.put(count.toString(), null);
			} else {
				U_recipe_meta_VO meta = u_recipe_Service.getSelectOne(rcp_idx);
				recipeMap.put(count.toString(), u_recipe_Service.getSelectOne(rcp_idx));
			}

			count++;
		}

		mv.addObject("awardList", awardList);
		mv.addObject("recipeMap", recipeMap);

		return mv;
	}

	@RequestMapping("/faq.do")
	public ModelAndView faqGo() {
		ModelAndView mv = new ModelAndView("/user/faq/faq");
		return mv;
	}

	@RequestMapping("/plz.do")
	public ModelAndView plzGo(HttpServletRequest request, HttpServletResponse response) {
		// 냉부해
		// 상우 DB에 방문자수 로그 찍기
		log_Service.visitorUp(request, response);
		ModelAndView mv = new ModelAndView("/user/plz/plz");
		return mv;
	}

	@RequestMapping("/login.do")
	public ModelAndView loginGo(@RequestParam("url") String url) {
		// 로그인하면 원래 있던 페이지로 이동하기 위한 url 주소 받기
		ModelAndView mv = new ModelAndView("/login/login");
		mv.addObject("url",url);
		return mv;
	}

	@RequestMapping("/member_join.do")
	public ModelAndView memberJoinGo() {
		ModelAndView mv = new ModelAndView("/login/member_join");
		return mv;
	}

	@RequestMapping("/find_pw.do")
	public ModelAndView findPwGo() {
		ModelAndView mv = new ModelAndView("/login/find_pw");
		return mv;
	}

	@RequestMapping("/new_pw.do")
	public ModelAndView newPwGo() {
		ModelAndView mv = new ModelAndView("/login/new_pw");
		return mv;
	}

	@RequestMapping("/social_join.do")
	public ModelAndView socialJoinGo() {
		ModelAndView mv = new ModelAndView("/social_join");
		return mv;
	}
	
	// /user_recipe_write.do recipe_controller로 이동 

	@RequestMapping("/myinfo.do")
	public ModelAndView myinfoGo(HttpSession session) {
		ModelAndView mv = new ModelAndView("/mypage/myinfo");
		String m_idx = (String) session.getAttribute("m_idx");
		Member_VO mvo = member_Service.getMemberOne(m_idx);
		if (mvo.getM_birthday() == null || mvo.getM_birthday().equals("")) {
			mvo.setM_birthday("소셜로그인 회원입니다.");
		}
		if (mvo.getM_gender().equals("M")) {
			mvo.setM_gender("남성");
		} else if (mvo.getM_gender().equals("F")) {
			mvo.setM_gender("여성");
		}
		if (!mvo.getM_login_type().equals("1")) {
			mvo.setM_id("소셜로그인 회원입니다.");
		}
		mv.addObject("mvo", mvo);
		return mv;
	}

	@RequestMapping("/mywishlist.do")
	public ModelAndView myWishListGo(HttpSession session, @ModelAttribute("order") String order) {
		ModelAndView mv = new ModelAndView("/mypage/myWishList");
		String m_idx = (String) session.getAttribute("m_idx");
		List<String> wishList_idx = member_Service.getMyWishList(m_idx); // 찜목록 rcp_idx
		List<U_recipe_meta_VO> wishList_meta = new ArrayList<U_recipe_meta_VO>();
		for (String k : wishList_idx) {
			U_recipe_meta_VO meta_vo = u_recipe_Service.getSelectOne(k);
			if (meta_vo != null) {
				wishList_meta.add(meta_vo);
			}
			// TODO 공공데이터 시작
			List<JsonNode> rowList = p_recipe_Service.go_public_list();
			List<P_recipe_VO> prvo = p_recipe_Service.article_summary();
			for (int i = 0; i < rowList.size(); i++) {
				P_recipe_VO vo = new P_recipe_VO();
				JsonNode k2 = rowList.get(i);
				vo = prvo.get(i);

				if (vo.getAvg_c_grade() != null) {
					BigDecimal avgCGrade = new BigDecimal(vo.getAvg_c_grade()).setScale(1, RoundingMode.HALF_UP);
					vo.setAvg_c_grade(avgCGrade.toString());
				}
				String rcpSeq = k2.get("RCP_SEQ").asText();
				String attFileNoMain = k2.get("ATT_FILE_NO_MAIN").asText();
				String rcpNm = k2.get("RCP_NM").asText();
				if (k.equals(rcpSeq)) {
					U_recipe_meta_VO pvo = new U_recipe_meta_VO();
					pvo.setRcp_idx(rcpSeq);
					pvo.setU_rcp_img(attFileNoMain);
					if (vo.getAvg_c_grade() == null) {
						pvo.setAvg_grade("0");
					} else {
						pvo.setAvg_grade(vo.getAvg_c_grade());
					}
					if (vo.getP_rcp_hit() == null) {
						pvo.setU_rcp_hit("0");
					} else {
						pvo.setU_rcp_hit(vo.getP_rcp_hit());
					}
					pvo.setU_rcp_title(rcpNm);
					pvo.setC_count(vo.getTotal_comments());
					wishList_meta.add(pvo);
					// TODO 공공데이터 끝
				}
			}
		}
		if (order.equals("0") || order.isBlank()) { // 조회순
			Collections.sort(wishList_meta, new Comparator<U_recipe_meta_VO>() {
				@Override
				public int compare(U_recipe_meta_VO vo1, U_recipe_meta_VO vo2) {
					int hit1 = Integer.parseInt(vo1.getU_rcp_hit());
					int hit2 = Integer.parseInt(vo2.getU_rcp_hit());
					return Integer.compare(hit2, hit1);
				}
			});
		} else if (order.equals("1")) { // 평점순
			Collections.sort(wishList_meta, new Comparator<U_recipe_meta_VO>() {
				@Override
				public int compare(U_recipe_meta_VO vo1, U_recipe_meta_VO vo2) {
					double avgGrade1 = Double.parseDouble(vo1.getAvg_grade());
					double avgGrade2 = Double.parseDouble(vo2.getAvg_grade());
					return Double.compare(avgGrade2, avgGrade1);
				}
			});
		}
		mv.addObject("wishList", wishList_meta);

		return mv;
	}

	@RequestMapping("/reportcontent.do")
	public ModelAndView reportContentGo(HttpSession session) {
		ModelAndView mv = new ModelAndView("/mypage/reportContent");
		String m_idx = (String) session.getAttribute("m_idx");
		List<Report_t_meta_VO> result = report_t_Service.getReportRecipe(m_idx);
		mv.addObject("reportList", result);
		
		return mv;
	}

	@RequestMapping("/reportcomment.do")
	public ModelAndView reportCommentGo(HttpSession session) {
		ModelAndView mv = new ModelAndView("/mypage/reportComment");
		String m_idx = (String) session.getAttribute("m_idx");
		List<Report_t_meta_VO> result = report_t_Service.getReportComment(m_idx);
		for (Report_t_meta_VO k : result) {
			String contents = k.getC_contents();
			if(contents.length() > 40) {
				k.setC_contents(contents.substring(0, 40) + "...");
			}
		}
		mv.addObject("reportList", result);
		
		return mv;
	}

	@RequestMapping("/mycontent.do")
	public ModelAndView myContentGo(HttpSession session) {
		ModelAndView mv = new ModelAndView("/mypage/myContent");
		String m_idx = (String) session.getAttribute("m_idx");
		U_recipe_VO urvo = new U_recipe_VO();
		urvo.setM_idx(m_idx);
		List<U_recipe_meta_VO> result = u_recipe_Service.getSelectList(urvo);
		mv.addObject("contentList", result);
		return mv;
	}

	@RequestMapping("/mycontent_search.do")
	public ModelAndView myContentOrderGo(HttpSession session, @ModelAttribute("keyword") String keyword,
			@ModelAttribute("orderKey") String orderKey, @ModelAttribute("order") String order) {
		ModelAndView mv = new ModelAndView("/mypage/myContent");
		String m_idx = (String) session.getAttribute("m_idx");
		U_recipe_Search_VO ursvo = new U_recipe_Search_VO();
		ursvo.setM_idx(m_idx);

		// 검색어 키워드가 있는 경우
		if (keyword != null && !keyword.isEmpty()) {
			ursvo.setLikeTitle(keyword);

			if (orderKey == null || orderKey.isEmpty()) {
				orderKey = "u_rcp_hit";
			}
		}

		// 정렬 기준이 있는 경우
		if (orderKey != null && !orderKey.isEmpty()) {
			ursvo.setOrderKey(orderKey);
			// 정렬 방식이 없거나 오름차순이면 내림차순으로 바꿔준다.
			if (order == null || order.isEmpty() || order.equalsIgnoreCase("asc")) {
				order = "desc";
			} else { // 그 외의 경우에는 오름차순으로 설정한다.
				order = "asc";
			}
			ursvo.setOrder(order);
		}
		List<U_recipe_meta_VO> result = u_recipe_Service.getSelectList(ursvo);
		mv.addObject("contentList", result);
		return mv;
	}

	@RequestMapping("/mycomment.do")
	public ModelAndView myCommentGo(HttpSession session) {
		ModelAndView mv = new ModelAndView("/mypage/myComment");
		String m_idx = (String) session.getAttribute("m_idx");
		Comment_VO cvo = new Comment_VO();
		cvo.setM_idx(m_idx);

		// 사용자 아이디로 댓글 조회 (단, 공공데이터의 경우 레시피 제목 데이터가 없음)
		List<Comment_meta_VO> result = comment_Service.getSelectList(cvo);

		// 공공데이터에서 레시피 제목 가져오기
		for (Iterator<Comment_meta_VO> iterator = result.iterator(); iterator.hasNext();) {
			Comment_meta_VO cmvo = (Comment_meta_VO) iterator.next();
			String rcp_seq = cmvo.getRcp_idx();
			// 댓글을 단 게시글이 공공데이터일 경우 parsing
			if (Integer.parseInt(rcp_seq) < 10000) {
				// TODO 공공데이터 시작
				List<JsonNode> rowList = p_recipe_Service.go_public_list();
				for (int i = 0; i < rowList.size(); i++) {
					JsonNode node = rowList.get(i);
					String node_rcpSeq = node.get("RCP_SEQ").asText();
					if (rcp_seq.equals(node_rcpSeq)) {
						String node_rcpNm = node.get("RCP_NM").asText();
						cmvo.setU_rcp_title(node_rcpNm);
					}
				}
				// TODO 공공데이터 끝
			}
		}

		mv.addObject("commentList", result);

		return mv;
	}


	@RequestMapping("/search.do")
	public ModelAndView searchGo(@ModelAttribute("search_text") String search_text,
			@ModelAttribute("order") String order, HttpSession session) {
		ModelAndView mv = new ModelAndView("/user/recipe/search_list");
		// 검색어로 DB다녀오기
		Map<String, String> map = new HashMap<String, String>();
		map.put("search", search_text);
		map.put("order", order);

		String m_idx = (String) session.getAttribute("m_idx");

		List<U_recipe_meta_VO> search_list = u_recipe_Service.getSearch(map, m_idx); // 유저레시피 검색결과
		List<U_recipe_meta_VO> p_search_list = new ArrayList<U_recipe_meta_VO>();
		mv.addObject("u_list", search_list);

		// TODO 공공데이터 시작
		List<JsonNode> rowList = p_recipe_Service.go_public_list();
		List<P_recipe_VO> prvo = p_recipe_Service.article_summary();
		int count = 0;
		for (int i = 0; i < rowList.size(); i++) {
			P_recipe_VO vo = new P_recipe_VO();
			JsonNode k = rowList.get(i);
			try {
				vo = prvo.get(i);
				if (vo.getAvg_c_grade() != null) {
					BigDecimal avgCGrade = new BigDecimal(vo.getAvg_c_grade()).setScale(1, RoundingMode.HALF_UP);
					vo.setAvg_c_grade(avgCGrade.toString());
				}
			} catch (Exception e) {
				count++;
			}
			String rcpSeq = k.get("RCP_SEQ").asText();
			String attFileNoMain = k.get("ATT_FILE_NO_MAIN").asText();
			String rcpNm = k.get("RCP_NM").asText();
			if (k.get("RCP_PARTS_DTLS").asText().contains(search_text) || k.get("RCP_NM").asText().contains(search_text)
					|| k.get("RCP_PAT2").asText().contains(search_text)
					|| k.get("HASH_TAG").asText().contains(search_text)) { // 재료에
																			// 검색어가
																			// 포함될때
				U_recipe_meta_VO pvo = new U_recipe_meta_VO();
				pvo.setRcp_idx(rcpSeq);
				pvo.setU_rcp_img(attFileNoMain);
				if (vo.getAvg_c_grade() == null) {
					pvo.setAvg_grade("0");
				} else {
					pvo.setAvg_grade(vo.getAvg_c_grade());
				}
				if (vo.getP_rcp_hit() == null) {
					pvo.setU_rcp_hit("0");
				} else {
					pvo.setU_rcp_hit(vo.getP_rcp_hit());
				}
				pvo.setU_rcp_title(rcpNm);
				pvo.setC_count(vo.getTotal_comments());
				p_search_list.add(pvo);
			}
		}
		if (order.equals("0") || order.isBlank()) { // 조회순
			Collections.sort(p_search_list, new Comparator<U_recipe_meta_VO>() {
				@Override
				public int compare(U_recipe_meta_VO vo1, U_recipe_meta_VO vo2) {
					int hit1 = Integer.parseInt(vo1.getU_rcp_hit());
					int hit2 = Integer.parseInt(vo2.getU_rcp_hit());
					return Integer.compare(hit2, hit1);
				}
			});
		} else if (order.equals("1")) { // 평점순
			Collections.sort(p_search_list, new Comparator<U_recipe_meta_VO>() {
				@Override
				public int compare(U_recipe_meta_VO vo1, U_recipe_meta_VO vo2) {
					double avgGrade1 = Double.parseDouble(vo1.getAvg_grade());
					double avgGrade2 = Double.parseDouble(vo2.getAvg_grade());
					return Double.compare(avgGrade2, avgGrade1);
				}
			});
		}
		mv.addObject("p_list", p_search_list);
		// TODO 공공데이터 끝
		return mv;
	}
	
	// TODO 상우 사용자 댓글 좋아요
	@RequestMapping("/comment_like.do")
	@ResponseBody // JSON 응답을 반환
	public Map<String, Object> comment_like(@RequestParam(value = "buttonId", required = true) String buttonId,
	        @RequestParam(value = "rcpSeq", required = false) String rcpSeq, HttpSession session, HttpServletRequest request) {
	    Map<String, Object> response = new HashMap<>();
		// 이 게시물에 들어간 댓글 전체 받아오기
		// List<Comment_VO> comments_list_all = p_recipe_Service.load_all_comments(String.valueOf(rcpSeq));
	    
		HttpSession session1 = request.getSession();
		String currentRcpIdx = (String) session1.getAttribute("currentRcpIdx");
	    
	    // 댓글 좋아요했는가 체크
	    
	    // 사람 idx 받아오기
		String m_idx = (String) session1.getAttribute("m_idx");
	    
	    // 댓글 idx 받아오기
		// 숫자 부분을 추출하는 정규 표현식
		Pattern pattern = Pattern.compile("\\d+$");
        Matcher matcher = pattern.matcher(buttonId);
        String numberPart = "";

        if (matcher.find()) {
            numberPart = matcher.group(); // 추출한 숫자 부분
        }
		
        int array_idx = Integer.parseInt(numberPart);
		
		String c_idx = "";
		// 해당 댓글의 c_idx 추출
		List<Comment_VO> comments_list_all = p_recipe_Service.load_all_comments(String.valueOf(currentRcpIdx));
		if (array_idx >= 0 && array_idx < comments_list_all.size()) {
		    Comment_VO commentVo = comments_list_all.get(array_idx);

		    // Comment_VO 객체에서 c_idx 추출
		    c_idx = commentVo.getC_idx();
		}else {
			
		}
	    
		String liked_ornot = "0";
		int liked_ornot_num = 0;
		
		// 좋아요했는가
		// ★ 한주가 수정 => 좋아요 했으면 취소, 안해있으면 좋아요 insert 
		// liked_ornot_num = comment_Service.comment_likeornot(c_idx, m_idx);
		
		// liked_ornot 추가 좋아요 여부 확인
		liked_ornot_num = comment_Service.comment_likedornot(c_idx, m_idx);
		liked_ornot = String.valueOf(liked_ornot_num);
		
		// 확인 후 insert 혹은 delete
		comment_Service.insertOrUpdateCommentLike(c_idx, m_idx, liked_ornot);
		
		// 처리 후 다시 좋아요 여부 확인
		liked_ornot_num = comment_Service.comment_likedornot(c_idx, m_idx);
		liked_ornot = String.valueOf(liked_ornot_num);

		if (liked_ornot.equals("1")) {
			// liked_ornot이 1이면(좋아요를 insert 했다면) 좋아요 되어있음 반환
			response.put("resultValue", true);
		}else if (liked_ornot.equals("0")) {
			// 아니라면 좋아요 해제함 반환
			response.put("resultValue", false);
		}
		
			
		// 전체 리스트 다시 받아오기
		comments_list_all = p_recipe_Service.load_all_comments(String.valueOf(currentRcpIdx));
		
		int cHitValue = 0; // 댓글의 c_hit 값을 저장할 변수, 초기값은 -1 또는 다른 적절한 값으로 설정

		for (Comment_VO commentVO : comments_list_all) {
		    if (commentVO.getC_idx().equals(c_idx)) {
		        cHitValue = Integer.parseInt(commentVO.getC_like());
		        break; // 
		    }else {
		    	
		    }
		}
			
		response.put("cHitValue", cHitValue);
		response.put("success", true);
        response.put("message", "댓글 좋아요 완료함!");
	    return response;
	}
	
	// 댓글 리로딩  
	@RequestMapping("/get_comment_list.do")
	@ResponseBody // JSON 응답을 반환
	public Map<String, Object> get_comment_list(@RequestParam(value = "buttonId", required = true) String buttonId,
	        String rcpSeq, HttpSession session, HttpServletRequest request) {
	    Map<String, Object> response = new HashMap<>();
	    
	    try {
	    	HttpSession session1 = request.getSession();
			String currentRcpIdx = (String) session1.getAttribute("currentRcpIdx");
			
			
			// 숫자 부분을 추출하는 정규 표현식
			Pattern pattern = Pattern.compile("\\d+$");
	        Matcher matcher = pattern.matcher(buttonId);
	        String numberPart = "";

	        if (matcher.find()) {
	            numberPart = matcher.group(); // 추출한 숫자 부분
	        }
			
	        int array_idx = Integer.parseInt(numberPart);
			
			String c_idx = "";
			// 해당 댓글의 c_idx 추출
			List<Comment_VO> comments_list_all = p_recipe_Service.load_all_comments(String.valueOf(currentRcpIdx));
			if (array_idx >= 0 && array_idx < comments_list_all.size()) {
			    Comment_VO commentVo = comments_list_all.get(array_idx);

			    // Comment_VO 객체에서 c_idx 추출
			    c_idx = commentVo.getC_idx();
			}else {
			}
			
			int cHitValue = 0; // 댓글의 c_hit 값을 저장할 변수, 초기값은 -1 또는 다른 적절한 값으로 설정

			for (Comment_VO commentVO : comments_list_all) {

			    if (commentVO.getC_idx().equals(c_idx)) {
			        cHitValue = Integer.parseInt(commentVO.getC_like());
			        break; // 
			    }else {
			    }
			}
			
			

			// cHitValue 변수에는 c_idx 변수와 일치하는 댓글의 c_hit 값이 저장됩니다.
			// 이 값을 사용하여 필요한 작업을 수행할 수 있습니다.

			
			response.put("cHitValue", cHitValue);
			response.put("success", true);
	        response.put("message", "댓글 좋아요 완료함!");
			
		} catch (Exception e) {
			// update된 변수를 같이 가져와서 update랑 조회 해서
			// map에 좋아요수 담아서 
	        response.put("success", false);
	        response.put("message", "댓글 좋아요 처리 중 오류 발생");
	    }
	    return response;
	}
	
	// TODO 상우 사용자 댓글 좋아요 완료
	
	// TODO 상우 댓글 수정 시작
	 @RequestMapping("/comment_revise.do")
	    @ResponseBody
	    public String reviseComment(@RequestParam("revisionBtnId") String revisionBtnId, @RequestParam("text") String newText,
	    		HttpSession session, HttpServletRequest request) {
		 	HttpSession session1 = request.getSession();
			String currentRcpIdx = (String) session.getAttribute("currentRcpIdx");
			
			// 숫자 부분을 추출하는 정규 표현식 (id 받아와서 숫자만 추출해서, idx 체크하기)
			Pattern pattern = Pattern.compile("\\d+$");
	        Matcher matcher = pattern.matcher(revisionBtnId);
	        String numberPart = "";

	        if (matcher.find()) {
	            numberPart = matcher.group(); // 추출한 숫자 부분
	        }
			
	        int array_idx = Integer.parseInt(numberPart);
			
			String c_idx = "";

	        try {
	        	List<Comment_VO> comments_list_all = p_recipe_Service.load_all_comments(String.valueOf(currentRcpIdx));
				if (array_idx >= 0 && array_idx < comments_list_all.size()) {
				    Comment_VO commentVo = comments_list_all.get(array_idx);

				    // Comment_VO 객체에서 c_idx 추출
				    c_idx = commentVo.getC_idx();
				}else {
				}
	        	
				// 보낼 때부터 Map으로 보내면 오류 나나?
				
	        	
				// 댓글 수정 DAO
				comment_Service.comment_revision(newText, c_idx);
				
				// 수정한 내용 다시 받아오기 => ajax로 쏴주자
				Comment_meta_VO cmvo = new Comment_meta_VO(); 
				cmvo = comment_Service.getOneComment(c_idx);
			    Map<String, String> response = new HashMap<>();
			    response.put("c_contents", cmvo.getC_contents());
				
				
				
	            
	            return "Success"; // 성공적으로 업데이트된 경우 반환할 응답 메시지
	        } catch (Exception e) {
	            e.printStackTrace();
	            return "Error"; // 오류 발생 시 반환할 응답 메시지
	        }
	    }
	
	
	// TODO 상우 댓글 수정 완료
	 
	 // TODO 상우 댓글 삭제 시작
	 @RequestMapping("/comment_delete.do")
	 @ResponseBody
	 public String reviseComment(@RequestParam("deleteBtnId") String deleteBtnId,
			 HttpSession session, HttpServletRequest request) {
		 
		 HttpSession session1 = request.getSession();
		 String currentRcpIdx = (String) session1.getAttribute("currentRcpIdx");
		 
		 // 숫자 부분을 추출하는 정규 표현식 (id 받아와서 숫자만 추출해서, idx 체크하기)
		 Pattern pattern = Pattern.compile("\\d+$");
		 Matcher matcher = pattern.matcher(deleteBtnId);
		 String numberPart = "";
		 
		 if (matcher.find()) {
			 numberPart = matcher.group(); // 추출한 숫자 부분
		 }
		 
		 int array_idx = Integer.parseInt(numberPart);
		 
		 String c_idx = "";
		 
		 try {
			 List<Comment_VO> comments_list_all = p_recipe_Service.load_all_comments(String.valueOf(currentRcpIdx));
			 if (array_idx >= 0 && array_idx < comments_list_all.size()) {
				 Comment_VO commentVo = comments_list_all.get(array_idx);
				 
				 // Comment_VO 객체에서 c_idx 추출
				 c_idx = commentVo.getC_idx();
			 }else {
			 }
			
			 comment_Service.comment_delete(c_idx);
			 
			 return "Success"; // 성공적으로 업데이트된 경우 반환할 응답 메시지
		 } catch (Exception e) {
			 e.printStackTrace();
			 return "Error"; // 오류 발생 시 반환할 응답 메시지
		 }
	 }
	 
	 
	 // TODO 상우 댓글 수정 완료
	
	

	@RequestMapping("/changeMyInfo2.do")
	public ModelAndView changeMyInfoGo(HttpSession session) {
		ModelAndView mv = new ModelAndView("mypage/changeMyinfo");
		String m_idx = (String) session.getAttribute("m_idx");
		Member_VO mvo = member_Service.getMemberOne(m_idx);
		if (mvo.getM_gender().equals("M")) {
			mvo.setM_gender("남성");
		} else if (mvo.getM_gender().equals("F")) {
			mvo.setM_gender("여성");
		}
		mv.addObject("mvo", mvo);
		return mv;
	}

	@RequestMapping("/changeMyInfo.do")
	public ModelAndView changeMyInfoDo(HttpSession session, Member_VO mvo, MultipartFile file) {
		ModelAndView mv = new ModelAndView("redirect:/myinfo.do");
		String path = session.getServletContext().getRealPath("/resources/user_image");
		String f_name = file.getOriginalFilename();
		if (file.isEmpty()) {

		} else {
			UUID uuid = UUID.randomUUID();
			f_name = uuid.toString() + "_" + file.getOriginalFilename();
			mvo.setM_image("resources/user_image/" + f_name);
			session.setAttribute("m_image", mvo.getM_image());
			session.setAttribute("m_nick", mvo.getM_nick());
			try {
				byte[] in = file.getBytes();
				File out = new File(path, f_name);
				FileCopyUtils.copy(in, out);
			} catch (Exception e) {
				// TODO: handle exception
			}
		}

		String m_idx = (String) session.getAttribute("m_idx");
		mvo.setM_idx(m_idx);
		int res = member_Service.changeMyInfo(mvo);
		mv.addObject("mvo", mvo);
		return mv;
	}

	@RequestMapping("/leaveMember2.do")
	public ModelAndView leaveMemberDo2(HttpSession session) {
		ModelAndView mv = new ModelAndView("/mypage/leaveMember");
		String m_idx = (String) session.getAttribute("m_idx");
		Member_VO mvo = member_Service.getMemberOne(m_idx);
		if (mvo.getM_login_type().equals("2") || mvo.getM_login_type().equals("3")
				|| mvo.getM_login_type().equals("4")) {
			mv.addObject("social", true);
			if (mvo.getM_gender().equals("M")) {
				mvo.setM_gender("남성");
			} else if (mvo.getM_gender().equals("F")) {
				mvo.setM_gender("여성");
			}
			if (mvo.getM_birthday() == null || mvo.getM_birthday().equals("")) {
				mvo.setM_birthday("소셜로그인 회원입니다.");
			}
			mvo.setM_id("소셜로그인 회원입니다.");
			mv.addObject("mvo", mvo);
			mv.setViewName("mypage/myinfo");
		}
		return mv;
	}

	@RequestMapping("/leaveMember.do")
	public ModelAndView leaveMemberDo(HttpSession session, String pw, boolean social) {
		ModelAndView mv = new ModelAndView("main");
		String m_idx = (String) session.getAttribute("m_idx");
		Member_VO mvo = member_Service.getMemberOne(m_idx);
		if (social) {
			int res = member_Service.leaveMember(mvo);
			String alert = "<script>alert('탈퇴가 완료되었습니다. 이용해주셔서 감사합니다.')</script>";
			session.removeAttribute("loginChk");
			session.removeAttribute("m_nick");
			session.removeAttribute("m_idx");
			session.removeAttribute("m_image");
			mv.addObject("alert", alert);
			return mv;
		}
		boolean pwChk = passwordEncoder.matches(pw, mvo.getM_pw());
		if (pwChk) {
			int res = member_Service.leaveMember(mvo);
			String alert = "<script>alert('탈퇴가 완료되었습니다. 이용해주셔서 감사합니다.')</script>";
			session.removeAttribute("loginChk");
			session.removeAttribute("m_nick");
			session.removeAttribute("m_idx");
			session.removeAttribute("m_image");
			mv.addObject("alert", alert);
		} else {
			String alert = "<script>alert('비밀번호가 틀렸습니다.')</script>";
			mv.addObject("alert", alert);
			mv.setViewName("/mypage/leaveMember");
		}

		return mv;
	}

	// TODO 상우 사용자 댓글작성
	@RequestMapping("/comment_write.do")
	public ModelAndView comment_write(@RequestParam(value = "rate", required = true) String rate,
			@RequestParam(value = "comment", required = true) String comment,
			@RequestParam(value = "image", required = false) MultipartFile image, HttpSession session,
			HttpServletRequest request) {

		 try {
		        String path = request.getSession().getServletContext().getRealPath("/resources/images/comment");
		        MultipartFile file = image;
		        String imagePath = null; // 이미지 경로를 저장할 변수

	        if (file.isEmpty()) {
	            // 이미지가 업로드되지 않았을 경우 기본 이미지 경로를 설정합니다.
	            imagePath = "resources/images/comment/sample_white.png";
//		        bv.setF_name("");
			} else {
				// 같은 이름 없도록 UUID 사용
				UUID uuid = UUID.randomUUID();
				// 원본 파일명
				String originalFilename = image.getOriginalFilename();
				// 확장자 추출
				String fileExtension = originalFilename.substring(originalFilename.lastIndexOf("."));
				// UUID를 포함한 새로운 파일명 생성
				String f_name = uuid.toString() + fileExtension;
//		        bv.setF_name(f_name);

				// 이미지 저장
				byte[] in = image.getBytes();
				File out = new File(path, f_name);
				FileCopyUtils.copy(in, out);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		// ★ 이미지 실제 경로에 업로드

//		 if (!image.isEmpty()) {
//	            try {
//	                // 업로드할 폴더 경로 설정
//	                // String uploadPath = "resources/images/comment/";
//	                String uploadPath = "src/main/resources/static/images/comment/"; // resources 폴더 안에 있는 경우
//
//	                // 업로드할 파일의 경로 설정
//	                String originalFilename = image.getOriginalFilename();
//	                String filePath = uploadPath + originalFilename;
//
//	                // 파일을 업로드
//	                File dest = new File(filePath);
//	                image.transferTo(dest);
//
//	            } catch (IOException e) {
//	                e.printStackTrace();
//	            }
//	        } else {
//	            // 이미지 파일이 비어있는 경우 처리
//	        	
//	        }

		String m_idx = (String) session.getAttribute("m_idx");
		Member_VO mvo = member_Service.getMemberOne(m_idx);

		Comment_VO cvo = new Comment_VO();
		cvo.setM_nick(mvo.getM_nick());
		cvo.setC_contents(comment);
		cvo.setC_img("resources/images/comment/" + image.getOriginalFilename());
		cvo.setC_grade(rate);

		// 여기네 (세션에서 값 null로 나옴)
		String s_rcp_idx = (String) session.getAttribute("rcp_idx");

		// session.getAttribute("rcp_idx").getClass().getName());

		cvo.setRcp_idx(String.valueOf(s_rcp_idx));

		int result = user_Service.comment_write(cvo);

		return new ModelAndView("user/recipe/public_recipe_detail");

	}
	// TODO 상우 사용자 댓글작성 완료
	
	// TODO 상우 게시글 신고 시작
	
	@SuppressWarnings("unused")
	@RequestMapping("/reportInsert.do")
	@ResponseBody
	public Map<String, Object> reportInsert(HttpSession session,
			@RequestParam(value = "reason", required = false) String reason,
			@RequestParam(value = "rReply", required = false) String rReply,
			@RequestParam(value = "otherReason", required = false) String otherReason
			) {
		
		
		// 댓글 정보 받기 (정보 없으면 null)
		String c_idx = null;
		String m_idx = (String) session.getAttribute("m_idx");
		String rcp_idx = (String) session.getAttribute("rcp_idx");
		
		Report_VO revo = new Report_VO();
		revo.setM_idx(m_idx);
		
		// 기타의 경우
		if (reason.equals("기타")) {
			revo.setR_type(reason);
			revo.setR_reply(rReply);
			if (c_idx != null) {
				revo.setC_idx(c_idx);
			}
			else if (rcp_idx != null) {
				revo.setRcp_idx(rcp_idx);
			}
			// 기타가 아닌 경우
		}else {
			revo.setR_type(reason);
			if (c_idx != null) {
				revo.setC_idx(c_idx);
			}
			if (rcp_idx != null) {
				revo.setRcp_idx(rcp_idx);
			}
		}
		Map<String, Object> result = new HashMap<String, Object>();
		
		// 해당 게시물에 대해서 사용자가 신고를 했는지 안했는지 확인 => 신고 안한 경우에만 신고 작동
		// 신고 이미 한 경우에는, 이미 신고 완료한 게시물입니다 alert 띄우자!
		String result_str =  admin_Service.reportInsert(revo);
		
		// insert 성공 시
		if (result_str.equals("1")) {
			result.put("response", true);
		}else {
			result.put("response", false);
		}
			
		// 서비스 가자
				
		return result;
	}
	
	
	// TODO 상우 게시글 신고 완료
	
	
	@RequestMapping("/changeMyPw2.do")
	public ModelAndView changeMyPwGo() {
		return new ModelAndView("/mypage/changeMypw");
	}

	@RequestMapping("/changeMyPw.do")
	public ModelAndView changeMyPwDo(String m_pw, HttpSession session) {
		ModelAndView mv = new ModelAndView("/login/login");
		String m_idx = (String) session.getAttribute("m_idx");
		Member_VO mvo = member_Service.getMemberOne(m_idx);
		m_pw = passwordEncoder.encode(m_pw);
		mvo.setM_pw(m_pw);
		member_Service.getChangePw(mvo);
		session.removeAttribute("loginChk");
		session.removeAttribute("m_nick");
		session.removeAttribute("m_idx");
		session.removeAttribute("m_image");
		String alert = "<script>alert('비밀번호 변경이 완료되었습니다. 다시 로그인 해주세요')</script>";
		mv.addObject("alert", alert);
		return mv;
	}
	
	//TODO 재훈 냉장고 열기 시작
	@RequestMapping("/openRef.do")
	@ResponseBody
	 public List<U_recipe_meta_VO> processInput(@RequestParam("inputValues") String[] inputValues,
			 @RequestParam("order") String order) {
		 // 입력된 값을 처리하고 DB에서 데이터를 가져오는 로직을 작성
				Ref_VO rfvo = new Ref_VO();
				rfvo.setInput1(inputValues[0]);
				rfvo.setInput2(inputValues[1]);
				rfvo.setInput3(inputValues[2]);
				rfvo.setOrder(order);

				List<U_recipe_meta_VO> search_list = u_recipe_Service.getRefSearch(rfvo); // 냉장고 검색결과
		return search_list ;
	}
	//TODO 재훈 냉장고 열기 끝
	
}
