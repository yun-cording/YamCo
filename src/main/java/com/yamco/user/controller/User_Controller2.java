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
import com.yamco.admin.model.service.Log_Service;
import com.yamco.api.model.service.P_recipe_Service;
import com.yamco.api.model.vo.P_recipe_VO;
import com.yamco.user.model.service.Images_Service;
import com.yamco.user.model.service.Member_Service;
import com.yamco.user.model.service.RandomService;
import com.yamco.user.model.service.U_recipe_Service;
import com.yamco.user.model.service.User_Service;
import com.yamco.user.model.service.User_log_Service;
import com.yamco.user.model.vo.Comment_VO;
import com.yamco.user.model.vo.Member_VO;
import com.yamco.user.model.vo.Member_meta_VO;
import com.yamco.user.model.vo.Notice_VO;
import com.yamco.user.model.vo.Random_save_VO;
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
	Log_Service log_Service;

	@RequestMapping("/main.go")
	public ModelAndView homeGo(HttpSession session) {
		ModelAndView mv = new ModelAndView("/main");

		// TODO 재훈 메인 시작
		// TODO 재훈 랜덤 재료(자정 초기화) 시작
		Random_save_VO saveVO = randomService.getSelectedFile();
		mv.addObject("saveVO", saveVO);
		// TODO 재훈 랜덤 재료(자정 초기화) 끝
		// TODO 재훈 공지,광고 가져오기 시작
		List<Notice_VO> nvo = images_Service.getNoticeList();

		// TODO 재훈 공지,광고 가져오기 끝
		// TODO 재훈 메인 끝

		return mv;
	}

//	@RequestMapping("/public_list.go")
//	public ModelAndView publicListGo() {
//		ModelAndView mv = new ModelAndView("/user/recipe/public_list");
//		return mv;
//	}
	
	// TODO 상우 게시물 찜 누르기 시작
	
	// TODO 상우 게시물 찜 누르기 완료

	@RequestMapping("/user_list.go")
	public ModelAndView userListGo(HttpServletRequest request, HttpServletResponse response) {
		// 냠냠's 쉐프레시피
		// 상우 DB에 방문자수 로그 찍기 (랭킹)
		log_Service.visitorUp(request, response);
		ModelAndView mv = new ModelAndView("/user/recipe/user_list");
		return mv;
	}

	@RequestMapping("/ranking_recipe.go")
	public ModelAndView rankingRecipeGo(HttpServletRequest request, HttpServletResponse response) {
		// 랭킹
		// 상우 DB에 방문자수 로그 찍기 (랭킹)
		log_Service.visitorUp(request, response);
		ModelAndView mv = new ModelAndView("/user/ranking/ranking_recipe");
		return mv;
	}

	@RequestMapping("/ranking_search.go")
	public ModelAndView rankingSearchGo() {
		ModelAndView mv = new ModelAndView("/user/ranking/ranking_search");
		List<String> result = user_log_Service.getU_recipeRankListSearch1Month();
		mv.addObject("lank_list_search", result);
		return mv;
	}

	@RequestMapping("/ranking_search_7day.go")
	public ModelAndView rankingSearch7DayGo() {
		ModelAndView mv = new ModelAndView("/user/ranking/ranking_search_7day");
		List<String> result = user_log_Service.getU_recipeRankListSearch7Days();
		mv.addObject("lank_list_search", result);
		return mv;
	}

	@RequestMapping("/award.go")
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

	@RequestMapping("/faq.go")
	public ModelAndView faqGo() {
		ModelAndView mv = new ModelAndView("/user/faq/faq");
		return mv;
	}

	@RequestMapping("/plz.go")
	public ModelAndView plzGo(HttpServletRequest request, HttpServletResponse response) {
		// 냉부해
		// 상우 DB에 방문자수 로그 찍기
		log_Service.visitorUp(request, response);
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

	@RequestMapping("/mywishlist.go")
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

	@RequestMapping("/reportcontent.go")
	public ModelAndView reportContentGo() {
		ModelAndView mv = new ModelAndView("/mypage/reportContent");
		return mv;
	}

	@RequestMapping("/mycontent.go")
	public ModelAndView myContentGo(HttpSession session) {
		ModelAndView mv = new ModelAndView("/mypage/myContent");
		String m_idx = (String) session.getAttribute("m_idx");
		U_recipe_VO urvo = new U_recipe_VO();
		urvo.setM_idx(m_idx);
		List<U_recipe_meta_VO> result = u_recipe_Service.getSelectList(urvo);
		mv.addObject("contentList", result);
		return mv;
	}

	@RequestMapping("/mycontent_search.go")
	public ModelAndView myContentOrderGo(HttpSession session, @ModelAttribute("keyword") String keyword,
			@ModelAttribute("orderKey") String orderKey, @ModelAttribute("order") String order) {
		ModelAndView mv = new ModelAndView("/mypage/myContent");
		String m_idx = (String) session.getAttribute("m_idx");
		U_recipe_Search_VO ursvo = new U_recipe_Search_VO();
		ursvo.setM_idx(m_idx);
		
		//검색어 키워드가 있는 경우 
		if (keyword != null && !keyword.isEmpty()) {
			ursvo.setLikeTitle(keyword);
		}
		//정렬 기준이 있는 경우
		if (orderKey != null && !orderKey.isEmpty()) {
			ursvo.setOrderKey(orderKey);
			//정렬 방식이 없거나 오름차순이면 내림차순으로 바꿔준다.
			if (order == null || order.isEmpty() || order.equalsIgnoreCase("asc")) {
				order = "desc";
			} else { //그 외의 경우에는 오름차순으로 설정한다.
				order = "asc";
			}
			ursvo.setOrder(order);
		}
		List<U_recipe_meta_VO> result = u_recipe_Service.getSelectList(ursvo);
		mv.addObject("contentList", result);
		return mv;
	}

	@RequestMapping("/mycomment.go")
	public ModelAndView myCommentGo() {
		ModelAndView mv = new ModelAndView("/mypage/myComment");
		return mv;
	}

	@RequestMapping("/public_recipe_detail.go")
	public ModelAndView publicRecipeDetailGo(@RequestParam("rcp_idx") String rcp_idx, HttpSession session) {
		ModelAndView mv = new ModelAndView("/user/recipe/public_recipe_detail");

		String m_idx = (String) session.getAttribute("m_idx");

		// 조회수 상승 //추후에 log 기록을 위해서 null 대신 m_idx 넘겨야 함
		int result = u_recipe_Service.getHitUp(rcp_idx, m_idx);

		// 레시피 번호받아와서 상세정보 출력하기
		return mv;
	}

	@RequestMapping("/search.go")
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
	        @RequestParam(value = "rcpSeq", required = true) String rcpSeq, HttpSession session, HttpServletRequest request) {
	    Map<String, Object> response = new HashMap<>();
		// 이 게시물에 들어간 댓글 전체 받아오기
		// List<Comment_VO> comments_list_all = p_recipe_Service.load_all_comments(String.valueOf(rcpSeq));
//		System.out.println("rcp_idx는 : " + rcpSeq);
	    
	    try {
	    	HttpSession session1 = request.getSession();
			String currentRcpIdx = (String) session1.getAttribute("currentRcpIdx");

			if (currentRcpIdx != null) {
			    // 세션에서 값을 가져왔으므로 이 값을 사용하여 원하는 작업을 수행할 수 있습니다.
			} else {
			    // 세션에 해당 속성이 없는 경우 처리할 내용을 여기에 작성하세요.
			}
			
			System.out.println("rcpidx는 : " + currentRcpIdx);
			System.out.println("버튼 ID는 : " + buttonId);
			
			// 숫자 부분을 추출하는 정규 표현식
			Pattern pattern = Pattern.compile("\\d+$");
	        Matcher matcher = pattern.matcher(buttonId);
	        String numberPart = "";

	        if (matcher.find()) {
	            numberPart = matcher.group(); // 추출한 숫자 부분
	        }
			
	        int array_idx = Integer.parseInt(numberPart);
			System.out.println("배열 인덱스는 : " + array_idx);
			
			String c_idx = "";
			// 해당 댓글의 c_idx 추출
			List<Comment_VO> comments_list_all = p_recipe_Service.load_all_comments(String.valueOf(currentRcpIdx));
			if (array_idx >= 0 && array_idx < comments_list_all.size()) {
			    Comment_VO commentVo = comments_list_all.get(array_idx);

		    // Comment_VO 객체에서 c_idx 추출
		    c_idx = commentVo.getC_idx();
			}
			
//			System.out.println("c_idx는 : " + c_idx);
			user_Service.comment_like(c_idx);
			System.out.println("댓글 좋아요 완료!");
			
		} catch (Exception e) {
	        response.put("success", false);
	        response.put("message", "댓글 좋아요 처리 중 오류 발생");
	    }
	    return response;
	}
	// TODO 상우 사용자 댓글 좋아요 완료

	@RequestMapping("/changeMyInfo.go")
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
		ModelAndView mv = new ModelAndView("redirect:/myinfo.go");
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

	@RequestMapping("/leaveMember.go")
	public ModelAndView leaveMemberGo(HttpSession session) {
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
			if (file.isEmpty()) {
				// 빈 경로
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
				System.out.println("이미지 저장 성공");
			}
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("이미지 저장 실패");
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
//	                System.out.println("파일 이름 : " + originalFilename);
//
//	                // 파일을 업로드
//	                File dest = new File(filePath);
//	                image.transferTo(dest);
//	                System.out.println("이미지 업로드 했다!");
//
//	            } catch (IOException e) {
//	                e.printStackTrace();
//	                System.out.println("이미지 업로드 오류");
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

		// 여기네
		String s_rcp_idx = (String) session.getAttribute("rcp_idx");

		// System.out.println("자료형은 : " +
		// session.getAttribute("rcp_idx").getClass().getName());

		// System.out.println(s_rcp_idx);
		cvo.setRcp_idx(String.valueOf(s_rcp_idx));

		int result = user_Service.comment_write(cvo);

		return new ModelAndView("user/recipe/public_recipe_detail");

	}
	// TODO 상우 사용자 댓글작성 완료
	
	
	@RequestMapping("/changeMyPw.go")
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
}
