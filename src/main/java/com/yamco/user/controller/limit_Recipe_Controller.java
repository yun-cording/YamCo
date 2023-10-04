package com.yamco.user.controller;

import java.io.File;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestPart;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.yamco.user.model.service.U_recipe_Service;
import com.yamco.user.model.vo.U_recipe_VO;

@Controller
public class limit_Recipe_Controller {
	@Autowired
	U_recipe_Service u_recipe_Service;
	
	
	//임시저장으로 불러온 게시글 저장 or 임시저장
	@PostMapping("/limit_write_go.do")
	public ModelAndView get_write(U_recipe_VO uvo, HttpServletRequest request,
			@RequestPart("u_rcp_img1") MultipartFile u_rcp_img1, String u_rcp_ingArr, String u_rcp_status) {
		ModelAndView mv = new ModelAndView("redirect:/");
		HttpSession session = request.getSession();

		System.out.println("recipe_status : " + u_rcp_status);
		String name = (String) session.getAttribute("m_nick");
		System.out.println("닉네임 : " + name);
		String m_idx = (String) session.getAttribute("m_idx");
		System.out.println("midx : " + m_idx);

		uvo.setM_idx(m_idx);
		uvo.setU_rcp_blind("0");
		uvo.setM_nick(name);
		
		// 키워드 db에 넣기 위한 처리
		String u_rcp_keyword = "";
		if (uvo.getU_rcp_keyword1() != null) {
			u_rcp_keyword = uvo.getU_rcp_keyword1();
		} else if (uvo.getU_rcp_keyword2() != null) {
			u_rcp_keyword = uvo.getU_rcp_keyword1() + "," + uvo.getU_rcp_keyword2();
		}
		uvo.setU_rcp_keyword(u_rcp_keyword);
		
		//db 에 카테고리 값 넣기
		uvo.setU_rcp_category(uvo.getU_rcp_category2());
		uvo.setU_rcp_ctype(uvo.getU_rcp_category1());
		
		uvo.setU_rcp_ing(u_rcp_ingArr);
		
		System.out.println("카테고리 1 : " + uvo.getU_rcp_category1());
		System.out.println("카테고리 2 : " + uvo.getU_rcp_category2());
		System.out.println("난이도 : " + uvo.getU_rcp_level());
		System.out.println("메인작성내용 : " + uvo.getU_rcp_main());
		
		try {
				
			if (u_rcp_status.equals("2")) { // 임시 저장으로 등록했을 경우
				uvo.setU_rcp_status(u_rcp_status);

				if (u_rcp_img1 == null) {
					uvo.setU_rcp_img("");
				} else {
				// 썸네일 파일 처리
				UUID uuid = UUID.randomUUID();
				String[] uuids = uuid.toString().split("-");
				String uniqueName = uuids[0];
				String fileName = u_rcp_img1.getOriginalFilename();
				String u_rcp_img = uniqueName + fileName;

				// db에 파일 이름 값 넣기
				uvo.setU_rcp_img(u_rcp_img);
				System.out.println("파일 이름 : " + u_rcp_img);
				String path = request.getSession().getServletContext().getRealPath("resources/user_image/user_thumnail"); // 업로드할 폴더 경로
				System.out.println("저장 경로 : " + path);
				File saveFile = new File(path + "//" + u_rcp_img);
				u_rcp_img1.transferTo(saveFile); // 파일을 톰켓 가상폴더에 저장 // 파일 처리 끝		
				} // 파일이 첨부되어 있을경우 끝
				
				u_recipe_Service.deleteRecipe(m_idx); // 임시저장되어있는 기존글 삭제
				int result = u_recipe_Service.getWrite(uvo); // 새로 작성글 임시저장처리
				return mv;
			} else { // 글쓰기로 등록했을 경우
				uvo.setU_rcp_status("0");
				if (u_rcp_img1 == null) {
					uvo.setU_rcp_img("");
				} else {
					// 썸네일 파일 처리
				UUID uuid = UUID.randomUUID();
				String[] uuids = uuid.toString().split("-");
				String uniqueName = uuids[0];
				String fileName = u_rcp_img1.getOriginalFilename();
				String u_rcp_img = uniqueName + fileName;
				// db에 파일 이름 값 넣기
				uvo.setU_rcp_img(u_rcp_img);
				System.out.println("파일 이름 : " + u_rcp_img);
				String path = request.getSession().getServletContext().getRealPath("resources/user_image/user_thumnail"); // 업로드할 폴더 경로
				System.out.println("저장 경로 : " + path);
				File saveFile = new File(path + "//" + u_rcp_img);
				u_rcp_img1.transferTo(saveFile); // 파일을 톰켓 가상폴더에 저장 // 파일 처리 끝		

				} // 파일이 첨부되어 있을경우 끝
				
				// 업데이트문 처리해줘야 함
				int result = u_recipe_Service.limitWrite(uvo);
				return mv;
			} // 글쓰기로 등록했을 경우 끝
		} catch (Exception e) {
			System.out.println("error메세지는 : " + e);
			return null;
		}
		}
	}
