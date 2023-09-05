package com.yamco.user.controller;

import java.io.File;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.yamco.user.model.service.Member_Service;
import com.yamco.user.model.service.RandomService;
import com.yamco.user.model.service.U_recipe_Service;
import com.yamco.user.model.service.User_log_Service;
import com.yamco.user.model.vo.Member_VO;
import com.yamco.user.model.vo.Member_meta_VO;
import com.yamco.user.model.vo.RecentList_VO;
import com.yamco.user.model.vo.U_recipe_Search_VO;
import com.yamco.user.model.vo.U_recipe_VO;
import com.yamco.user.model.vo.U_recipe_meta_VO;

@Controller
public class User_Controller2 {

	@Autowired
	private RandomService randomService;

	@Autowired
	private U_recipe_Service u_recipe_Service;
	@Autowired
	private Member_Service member_Service;
	@Autowired
	private User_log_Service user_log_Service;
	@Autowired
	private BCryptPasswordEncoder passwordEncoder;

	@RequestMapping("/main.go")
	public ModelAndView homeGo(HttpSession session) {
		ModelAndView mv = new ModelAndView("/main");
		List<RecentList_VO> recent = new ArrayList();
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
		session.setAttribute("recent", recent);
		// TODO 희준 최근리스트 세션저장용 끝
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
	public ModelAndView awardGo() {
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

		List<U_recipe_meta_VO> search_list = u_recipe_Service.getSearch(map, m_idx);
		mv.addObject("u_list", search_list);
		return mv;
	}

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
			System.out.println(mvo.getM_image());
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

}
