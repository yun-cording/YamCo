package com.yamco.user.controller;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RequestPart;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.yamco.user.model.service.U_recipe_Service;
import com.yamco.user.model.vo.U_recipe_VO;

@Controller
public class Recipe_Controller {

	@Autowired
	U_recipe_Service u_recipe_Service;

	//레시피 저장 , 레시피 임시저장
	@PostMapping("/write_go")
	public ModelAndView get_write(U_recipe_VO uvo, HttpServletRequest request,
			@RequestPart("u_rcp_img1") MultipartFile u_rcp_img1, String[] u_rcp_ing2, String u_rcp_status) {
		ModelAndView mv = new ModelAndView("redirect:/go_home.do");
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
		
		// 재료들 배열 값 넣기
		String u_rcp_ing = "";
		for (int i = 0; i < u_rcp_ing2.length; i++) {
			u_rcp_ing += u_rcp_ing2[i] + ",";
		}
		//db 에 카테고리 값 넣기
		uvo.setU_rcp_category(uvo.getU_rcp_category1()+","+uvo.getU_rcp_category2());
		
		System.out.println("u_rcp_ing : " + u_rcp_ing);
		uvo.setU_rcp_ing(u_rcp_ing);
		
		for (int i = 0; i < u_rcp_ing2.length; i++) {
		System.out.println("재료 입력값[" + i + "] :" + u_rcp_ing2[i]);
		}
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
				int result = u_recipe_Service.getWrite(uvo);
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
				int result = u_recipe_Service.getWrite(uvo);
				return mv;
			} // 글쓰기로 등록했을 경우 끝
		} catch (Exception e) {
			System.out.println("error메세지는 : " + e);
			return null;
		}
	}

	// 성훈 레시피 작성
	@RequestMapping("/user_recipe_write.go")
	public ModelAndView userRecipeWriteGo(HttpSession session, String result) {
		ModelAndView mv = new ModelAndView();
		System.out.println("header에서넘어온 result : " + result);
		String result2 = result;
		String m_idx = (String) session.getAttribute("m_idx");
		System.out.println("작성중인 m_idx : " + m_idx);
		
		if(result2.equals("yes")){ // 임시저장글 작성페이지로 이동할 경우
			U_recipe_VO urvo = u_recipe_Service.getLimit_recipe(m_idx);
			// List<String> category1 = Arrays.asList("select_category", "select_steam",
			// "select_boil", "select_cook",
			// "select_stir", "select_fry", "select_etc");
			
			// 카테고리 값 넘겨주기 처리
			String[] u_rcp_category = urvo.getU_rcp_category().split(",");
			String category_choice1 = u_rcp_category[0].trim();
			System.out.println("category_choice1 : " + category_choice1);
			String category_choice2 = u_rcp_category[1].trim();
			System.out.println("category_choice2 : " + category_choice2);
			
			// 난이도는 jsp가서 처리하는 걸로
			
			// 키워드 처리
			String u_rcp_keyword1 = "";
			String u_rcp_keyword2 = "";
			if(urvo.getU_rcp_keyword().contains(",")) { // 키워드가 2개 입력됐을경우
				u_rcp_keyword1 = urvo.getU_rcp_keyword().split(",")[0];
				u_rcp_keyword2 = urvo.getU_rcp_keyword().split(",")[1];
				System.out.println("u_rcp_keyword1 : " + u_rcp_keyword1);
				System.out.println("u_rcp_keyword2 : " + u_rcp_keyword2);
				mv.addObject("u_rcp_keyword2",u_rcp_keyword2);
			}else { // 키워드가 1개인 경우
				u_rcp_keyword1 = urvo.getU_rcp_keyword();
				mv.addObject("u_rcp_keyword1",u_rcp_keyword1);
				System.out.println("u_rcp_keyword1 : " + u_rcp_keyword1);
			}
			
			int ing_count = urvo.getU_rcp_ing().replace(",", ",").length(); // 재료 추가버튼 겟수
			String[] arr = urvo.getU_rcp_ing().split(",");
			for (int i = 0; i < arr.length; i++) {
				System.out.println("배열의 크기 : "+arr[i]);
			}
			int length = arr.length;
			System.out.println("length길이는 : "+ length);
			mv.addObject("arr",arr);
			mv.addObject("length",length);
			mv.setViewName("/user/recipe/limit_recipe_write");
			mv.addObject("category_choice1", category_choice1);
			mv.addObject("category_choice2", category_choice2);
			mv.addObject("result", result2);
			mv.addObject("urvo",urvo);
			return mv;
		}else if(result2.equals("cancelandgo")){
			System.out.println("삭제하러 controller 오니?");
			u_recipe_Service.deleteRecipe(m_idx);
			
			mv.setViewName("/user/recipe/user_recipe_write");
			
			return mv;
			
		}else { 
			System.out.println("설마 여기로 오니 ?");
			mv.setViewName("/user/recipe/user_recipe_write");
			return mv;
		}
	}

	
	
	@PostMapping("/saveImage.do")
	@ResponseBody
	public Map<String, String> saveImg(U_recipe_VO uvo, HttpServletRequest request) {
		Map<String, String> map = new HashMap<String, String>(); // hash 맵 사용

		// 넘어온 파일 검증
		MultipartFile f = uvo.getS_file(); // 멀티파트파일 f 에 ImgVO vo로 f_name으로 보낸 파일을 받아서 집어넣음
		String fname = null;
		if (f.getSize() > 0) { // f의 사이즈가 0보다 클경우 즉 파일이 있을경우
			// 첨부파일 위치
			String path = request.getSession().getServletContext()
					.getRealPath("/resources/user_image/user_summernote_img");

			UUID uuid = UUID.randomUUID();
			String[] uuids = uuid.toString().split("-");
			String uniqueName = uuids[0];
			fname = uniqueName + "_" + f.getOriginalFilename();

			try {
				// 업로드(저장용도) path 경로에 있는 fname파일을 f.transferTo에 업로드하겠다.
				f.transferTo(new File(path, fname));
			} catch (Exception e) {
				e.printStackTrace();
			}
			// 비동기식 요청이므로 저장된 파일의 경로와 파일명을 보내야 한다.
			String path2 = request.getContextPath();
			if (path2 == null) {
				System.out.println("path2 is null");
			}
			System.out.println(path2);
			map.put("fname", fname);
			map.put("path", "/resources/user_image/user_summernote_img");

			// pom.xml에 json 변환 해주는 라이브러리 추가
			return map; // ajax요청에서 map으로 리턴할 경우 키 : 값 으로 리턴 되기 떄문에 json형싱그로 자동으로 리턴이 된다.
		}
		return null;
	}

}
