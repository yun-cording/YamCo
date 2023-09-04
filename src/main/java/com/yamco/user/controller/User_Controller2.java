package com.yamco.user.controller;

import java.io.File;
import java.util.HashMap;
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
import com.yamco.user.model.vo.Member_VO;
import com.yamco.user.model.vo.Random_VO;
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
	private BCryptPasswordEncoder passwordEncoder;

	
	@RequestMapping("/main.go")
	public ModelAndView homeGo(HttpSession session) {
		ModelAndView mv = new ModelAndView("/main");
		// TODO 재훈 메인 시작
		// TODO 재훈 랜덤 재료(자정 초기화) 시작
		 Random_VO selectedFile = randomService.getSelectedFile();
		 System.out.println("윽");
		 System.out.println("selectedFile : " +selectedFile.getFood_img());
		 mv.addObject("selectedFile", selectedFile);
		 // TODO 재훈 랜덤 재료(자정 초기화) 끝
		// TODO 재훈 메인 끝
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
	public ModelAndView myinfoGo(HttpSession session) {
		ModelAndView mv = new ModelAndView("/mypage/myinfo");
		String m_idx = (String)session.getAttribute("m_idx");
		Member_VO mvo = member_Service.getMemberOne(m_idx);
		if(mvo.getM_birthday()==null || mvo.getM_birthday().equals("")) {
			mvo.setM_birthday("소셜로그인 회원입니다.");
		}
		if(mvo.getM_gender().equals("M")) {
			mvo.setM_gender("남성");
		}else if(mvo.getM_gender().equals("F")) {
			mvo.setM_gender("여성");
		}
		if(!mvo.getM_login_type().equals("1")) {
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
	public ModelAndView publicRecipeDetailGo(@RequestParam("rcp_idx") String rcp_idx, @RequestParam("m_idx") String m_idx) {
		ModelAndView mv = new ModelAndView("/user/recipe/public_recipe_detail");
		
		//조회수 상승
		int result = u_recipe_Service.getHitUp(rcp_idx, m_idx);
		System.out.println("result : " + result);
		
		// 레시피 번호받아와서 상세정보 출력하기
		return mv;
	}
	@RequestMapping("/search.go")
	public ModelAndView searchGo(@ModelAttribute("search_text") String search_text,@ModelAttribute("order")String order) {
		ModelAndView mv = new ModelAndView("/user/recipe/search_list");
		// 검색어로 DB다녀오기
		Map<String, String> map = new HashMap<String, String>();
		map.put("search", search_text);
		map.put("order", order);
		List<U_recipe_meta_VO> search_list = u_recipe_Service.getSearch(map);
		mv.addObject("u_list",search_list);
		return mv;
	}
	
	@RequestMapping("/changeMyInfo.go")
	public ModelAndView changeMyInfoGo( HttpSession session ) {
		ModelAndView mv =new ModelAndView("mypage/changeMyinfo");
		String m_idx = (String)session.getAttribute("m_idx");
		Member_VO mvo = member_Service.getMemberOne(m_idx);
		if(mvo.getM_gender().equals("M")) {
			mvo.setM_gender("남성");
		}else if(mvo.getM_gender().equals("F")) {
			mvo.setM_gender("여성");
		}
		mv.addObject("mvo",mvo);
		return mv;
	}
	@RequestMapping("/changeMyInfo.do")
	public ModelAndView changeMyInfoDo( HttpSession session, Member_VO mvo, MultipartFile file) {
		ModelAndView mv =new ModelAndView("redirect:/myinfo.go");
		String path = session.getServletContext().getRealPath("/resources/user_image");
		String f_name = file.getOriginalFilename();
		if (file.isEmpty()) {
			
		} else {
			UUID uuid = UUID.randomUUID();
			f_name = uuid.toString() + "_" + file.getOriginalFilename();
			mvo.setM_image("resources/user_image/"+f_name);
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
		
		String m_idx = (String)session.getAttribute("m_idx");
		mvo.setM_idx(m_idx);
		int res = member_Service.changeMyInfo(mvo);
		mv.addObject("mvo",mvo);
		return mv;
	}
	@RequestMapping("/leaveMember.go")
	public ModelAndView leaveMemberGo( HttpSession session ) {
		ModelAndView mv = new ModelAndView("/mypage/leaveMember"); 
		String m_idx = (String)session.getAttribute("m_idx");
		Member_VO mvo = member_Service.getMemberOne(m_idx);
		if(mvo.getM_login_type().equals("2") || mvo.getM_login_type().equals("3") || mvo.getM_login_type().equals("4")) {
			mv.addObject("social", true);
			if(mvo.getM_gender().equals("M")) {
				mvo.setM_gender("남성");
			}else if(mvo.getM_gender().equals("F")) {
				mvo.setM_gender("여성");
			}
			if(mvo.getM_birthday()==null || mvo.getM_birthday().equals("")) {
				mvo.setM_birthday("소셜로그인 회원입니다.");
			}
			mvo.setM_id("소셜로그인 회원입니다.");
			mv.addObject("mvo", mvo);
			mv.setViewName("mypage/myinfo");
		}
		return mv;
	}
	@RequestMapping("/leaveMember.do")
	public ModelAndView leaveMemberDo( HttpSession session, String pw, boolean social) {
		ModelAndView mv= new ModelAndView("main");
		String m_idx = (String)session.getAttribute("m_idx");
		Member_VO mvo = member_Service.getMemberOne(m_idx);
		if(social) {
			int res = member_Service.leaveMember(mvo);
			String alert="<script>alert('탈퇴가 완료되었습니다. 이용해주셔서 감사합니다.')</script>";
			session.removeAttribute("loginChk");
			session.removeAttribute("m_nick");
			session.removeAttribute("m_idx");
			session.removeAttribute("m_image");
			mv.addObject("alert",alert);
			return mv;
		}
		boolean pwChk = passwordEncoder.matches(pw, mvo.getM_pw());
		if(pwChk) {
			int res = member_Service.leaveMember(mvo);
			String alert="<script>alert('탈퇴가 완료되었습니다. 이용해주셔서 감사합니다.')</script>";
			session.removeAttribute("loginChk");
			session.removeAttribute("m_nick");
			session.removeAttribute("m_idx");
			session.removeAttribute("m_image");
			mv.addObject("alert",alert);
		}else {
			String alert="<script>alert('비밀번호가 틀렸습니다.')</script>";
			mv.addObject("alert", alert);
			mv.setViewName("/mypage/leaveMember");
		}
		
		return mv;
	}
	
	
}
