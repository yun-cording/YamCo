package com.yamco.admin.controller;

import java.io.File;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.yamco.admin.model.service.AdminService;
import com.yamco.admin.model.vo.Admin_Banner_VO;
import com.yamco.admin.model.vo.Admin_Dash_VO;
import com.yamco.admin.model.vo.Admin_Report_Chk_VO;
import com.yamco.admin.model.vo.Member_count_summary_VO;
import com.yamco.user.model.service.Member_Service;
import com.yamco.user.model.service.U_recipe_Service;
import com.yamco.user.model.vo.Member_Search_VO;
import com.yamco.user.model.vo.Member_VO;
import com.yamco.user.model.vo.U_recipe_meta_VO;

@Controller
@RequestMapping("/admin")
public class Admin_Controller {
	@Autowired
	private Member_Service member_Service;
	@Autowired
	private AdminService adminService;
	@Autowired
	private U_recipe_Service u_recipe_Service;
	@Autowired
	private BCryptPasswordEncoder passwordEncoder;

	@RequestMapping("/admin_report_recipe.do")
	public ModelAndView go_admin_All(@ModelAttribute("result") String result) {
		ModelAndView mv = new ModelAndView("admin/admin_report");
		List<List<Admin_Report_Chk_VO>> total_list = adminService.admin_report_All();
		mv.addObject("rcp_list", total_list.get(0));
		mv.addObject("c_list", total_list.get(1));
		mv.addObject("answerRcp_list",total_list.get(2));
		mv.addObject("answerC_list",total_list.get(3));
		mv.addObject("result", result);
		return mv;
	}
	
	@RequestMapping("answer_to_reporter.do")
	public ModelAndView answer_report(String answer_text , String reporter_name) {
		ModelAndView mv = new ModelAndView("redirect:/admin/admin_report_recipe.do");
		System.out.println("신고자 : " + reporter_name);
		String r_idx = reporter_name.split("닉")[0].trim();
		System.out.println("r_idx : " + r_idx);
		String r_answer = answer_text.trim();
		Admin_Report_Chk_VO arcvo = new Admin_Report_Chk_VO();
		arcvo.setR_idx(r_idx);
		arcvo.setR_answer(r_answer);
		System.out.println("answer_text : "+answer_text);
		int result = adminService.answer_report(arcvo);
		
		return mv;
	}

	@RequestMapping("go_admin_dashboard.do")
	public ModelAndView go_admin_dashboard(HttpSession session) {
		ModelAndView mv = new ModelAndView("admin/admin_dashboard");
		Admin_Dash_VO dash_VO = adminService.getDashBoard();
		session.setAttribute("recent_report_list", dash_VO.getRecent_report_list());
		mv.addObject("vo", dash_VO);
		return mv;
	}

	@RequestMapping("go_admin_memberchk.do")
	public ModelAndView go_admin_memberchk() {
		ModelAndView mv = new ModelAndView("admin/admin_memberchk");
		Member_count_summary_VO countSummary = adminService.getMemberCountSummary();
		mv.addObject("countSummary", countSummary);

		return mv;
	}

	@RequestMapping("/go_admin_memberchk_admin.do")
	public ModelAndView go_admin_memberchk_admin() {
		ModelAndView mv = new ModelAndView("admin/admin_memberchk_admin");
		Member_count_summary_VO countSummary = adminService.getMemberCountSummary();
		mv.addObject("countSummary", countSummary);
		return mv;
	}

	@RequestMapping("/go_admin_memberchk_search.do")
	public ModelAndView get_admin_memberchk_search(Member_Search_VO msvo) {
		ModelAndView mv = new ModelAndView("admin/admin_memberchk");
		List<Member_VO> result = member_Service.getMemberList(msvo);
		mv.addObject("search_result", result);
		Member_count_summary_VO countSummary = adminService.getMemberCountSummary();
		mv.addObject("countSummary", countSummary);

		return mv;
	}

	@RequestMapping("/go_admin_memberchk_admin_search.do")
	public ModelAndView get_admin_memberchk_admin_search(Member_Search_VO msvo) {
		ModelAndView mv = new ModelAndView("admin/admin_memberchk_admin");
		List<Member_VO> result = member_Service.getAdminList(msvo);
		mv.addObject("search_result", result);

		Member_count_summary_VO countSummary = adminService.getMemberCountSummary();
		mv.addObject("countSummary", countSummary);

		return mv;
	}

	@RequestMapping("/go_admin_memberchk_update.do")
	public ModelAndView get_admin_memberchk_open_lock(Member_VO mvo) {
		ModelAndView mv = new ModelAndView("admin/admin_memberchk");
		String m_status = mvo.getM_status();
		if (m_status != null && m_status.equalsIgnoreCase("3")) {
			member_Service.leaveMember(mvo);
		} else {
			member_Service.getUpdate(mvo);
		}
		Member_count_summary_VO countSummary = adminService.getMemberCountSummary();
		mv.addObject("countSummary", countSummary);

		return mv;
	}

	// 관리자 회원가입
	@RequestMapping("/admin_join.do")
	public ModelAndView getMemberJoin(Member_VO mvo) {
		ModelAndView mv = new ModelAndView("admin/admin_memberchk_admin");
		try {
			mvo.setM_pw(passwordEncoder.encode(mvo.getM_pw()));
			mvo.setM_login_type("1");
			member_Service.getAdminJoin(mvo);
			return mv;
		} catch (Exception e) {
			e.printStackTrace();
			mv.setViewName("error404");
		}
		return null;
	}

	// 관리자 탈퇴
	@RequestMapping("/go_admin_memberchk_drop_out.do")
	public ModelAndView get_admin_memberchk_drop_out(Member_VO mvo) {
		ModelAndView mv = new ModelAndView("admin/admin_memberchk_admin");
		String m_status = mvo.getM_status();
		member_Service.leaveAdmin(mvo);

		Member_count_summary_VO countSummary = adminService.getMemberCountSummary();
		mv.addObject("countSummary", countSummary);

		return mv;
	}

	@RequestMapping("go_admin_contentchk.do")
	public ModelAndView go_admin_contentchk(U_recipe_meta_VO urmvo) {
		ModelAndView mv = new ModelAndView("admin/admin_contentchk");
		List<U_recipe_meta_VO> result = u_recipe_Service.getUserContentList(urmvo);
		Admin_Dash_VO dash_VO = adminService.getDashBoard();

		mv.addObject("vo", dash_VO);
		mv.addObject("content_result", result);
		return mv;
	}

	@RequestMapping("go_tableExam.do")
	public ModelAndView go_tableExam() {
		return new ModelAndView("admin/table");
	}

	@RequestMapping("/go_admin_ppl.do")
	public ModelAndView admin_pplDo() {
		ModelAndView mv = new ModelAndView("admin/admin_ppl");
		List<List<Admin_Banner_VO>> total_list = adminService.total_list();
		mv.addObject("notice_list", total_list.get(0));
		mv.addObject("ppl_list", total_list.get(1));
		mv.addObject("fooding_list", total_list.get(2));
		return mv;
	}

	@RequestMapping("/notice_delete.go")
	public ModelAndView notice_deleteGo(String idx, String kind) {
		ModelAndView mv = new ModelAndView("redirect:/go_admin_ppl.do");
		if (kind.equals("0")) {
			adminService.noticeDel(idx);
		} else if (kind.equals("1")) {
			adminService.pplDel(idx);
		} else if (kind.equals("2")) {
			adminService.foodingDel(idx);
		}
		return mv;
	}

	@RequestMapping("/deletedNotice.go")
	public ModelAndView deletedNoticeGo() {
		ModelAndView mv = new ModelAndView("admin/admin_deletedppl");
		List<List<Admin_Banner_VO>> total_list = adminService.total_list();
		List<List<Admin_Banner_VO>> total_delete_list = adminService.total_delete_list();
		mv.addObject("notice_list", total_list.get(0));
		mv.addObject("ppl_list", total_list.get(1));
		mv.addObject("notice_list", total_delete_list.get(0));
		mv.addObject("ppl_list", total_delete_list.get(1));
		mv.addObject("fooding_list", total_delete_list.get(2));
		return mv;
	}

	@RequestMapping("/notice_regist.go")
	public ModelAndView notice_registGo(String idx, String kind) {
		ModelAndView mv = new ModelAndView("redirect:/deletedNotice.go");
		if (kind.equals("0")) {
			adminService.noticeUp(idx);
		} else if (kind.equals("1")) {
			adminService.pplUp(idx);
		} else if (kind.equals("2")) {
			adminService.foodingUp(idx);
		}

		return mv;
	}

	@RequestMapping("/go_admin_register.do")
	public ModelAndView go_admin_register() {
		return new ModelAndView("admin/admin_register");
	}

	@RequestMapping("/saveAdminImage.do")
	public ModelAndView saveImg(MultipartFile upload_img, @RequestParam("category") String category,
			@RequestParam("title") String title, HttpServletRequest request) {
		ModelAndView mv = new ModelAndView("admin/admin_register");

		if (upload_img != null && upload_img.getSize() > 0) { // upload_img의 사이즈가 0보다 클경우 즉 파일이 있을경우
			// 첨부파일 위치
			String path = request.getSession().getServletContext().getRealPath("/resources/images");

			UUID uuid = UUID.randomUUID();
			String fname = uuid + "_" + upload_img.getOriginalFilename();

			try {
				// 업로드(저장용도) path 경로에 있는 fname파일을 upload_img.transferTo에 업로드하겠다.
				upload_img.transferTo(new File(path, fname));

				adminService.insertAdminImage(category, title, fname);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}

		return mv;
	}

	@RequestMapping("/content_search.go")
	public ModelAndView getUserSearchList(U_recipe_meta_VO urmvo) {
		ModelAndView mv = new ModelAndView("admin/admin_contentchk");
		List<U_recipe_meta_VO> result = u_recipe_Service.getUserSearchList(urmvo);
		System.out.println(result.size());
		mv.addObject("content_result", result);
		return mv;
	}

}