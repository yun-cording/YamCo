package com.yamco.user.controller;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
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

	@PostMapping("/write_go")
	public ModelAndView get_write(U_recipe_VO uvo, HttpServletRequest request, 
			@RequestPart("u_rcp_img1") MultipartFile u_rcp_img1, String[] u_rcp_ing2,String u_rcp_status) {
		ModelAndView mv = new ModelAndView("/main");
		HttpSession session = request.getSession();
		
		System.out.println("recipe_status : " + u_rcp_status);
		String name = (String) session.getAttribute("m_nick");
		System.out.println("닉네임 : "+name);
		String midx = (String) session.getAttribute("m_idx");
		System.out.println("midx : "+midx);
		
		
		uvo.setM_idx((String)session.getAttribute("m_idx"));
		uvo.setU_rcp_blind("0");
		uvo.setM_nick((String)session.getAttribute("m_nick"));
		//uvo.setU_rcp_status(0);
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
					// 카테고리 db에 값 넣기 위한 처리
					String u_rcp_category = uvo.getU_rcp_category1() + "," + uvo.getU_rcp_category2() ;
					uvo.setU_rcp_category(u_rcp_category);
					// 키워드 db에 넣기 위한 처리
					String u_rcp_keyword = "";
					if(uvo.getU_rcp_keyword1() != null) {
						 u_rcp_keyword = uvo.getU_rcp_keyword1();
					}else if(uvo.getU_rcp_keyword2() != null) {
						 u_rcp_keyword =  uvo.getU_rcp_keyword1() + "," + uvo.getU_rcp_keyword2() ;
					}
					uvo.setU_rcp_keyword(u_rcp_keyword);
					// 재료들 배열 값 넣기
					String u_rcp_ing = "";
					for (int i = 0; i < u_rcp_ing2.length; i++) {
						u_rcp_ing += u_rcp_ing2[i] + ",";
					}
					System.out.println("u_rcp_ing : " + u_rcp_ing);
					uvo.setU_rcp_ing(u_rcp_ing);
					
					// 썸네일 파일 처리
					UUID uuid = UUID.randomUUID();
					String[] uuids = uuid.toString().split("-");
					String uniqueName = uuids[0];

					String fileName = u_rcp_img1.getOriginalFilename();
					String u_rcp_img = uniqueName + fileName;
					// db에 파일 이름 값 넣기
					uvo.setU_rcp_img(u_rcp_img);
					System.out.println("파일 이름 : " + u_rcp_img);

					String path = request.getSession().getServletContext()
							.getRealPath("resources/user_image/user_thumnail"); // 업로드할 폴더 경로
					System.out.println("저장 경로 : " + path);

					File saveFile = new File(path + "//" + u_rcp_img);
					u_rcp_img1.transferTo(saveFile); // 파일을 톰켓 가상폴더에 저장 // 파일 처리 끝

					int result = u_recipe_Service.getWrite(uvo);
				} // 파일이 첨부되어 있을경우 끝
				
				return mv;
			} else { // 글쓰기로 등록했을 경우
				uvo.setU_rcp_status("0");

				if (u_rcp_img1 == null) {
					uvo.setU_rcp_img("");
				} else {
					// 카테고리 db에 값 넣기 위한 처리
					String u_rcp_category = uvo.getU_rcp_category1() + "," + uvo.getU_rcp_category2() ;
					uvo.setU_rcp_category(u_rcp_category);
					// 키워드 db에 넣기 위한 처리
					String u_rcp_keyword =  uvo.getU_rcp_keyword1() + "," + uvo.getU_rcp_keyword2() ;
					uvo.setU_rcp_keyword(u_rcp_keyword);
					// 재료들 배열 값 넣기
					String u_rcp_ing = "";
					for (int i = 0; i < u_rcp_ing2.length; i++) {
						u_rcp_ing += u_rcp_ing2[i] + ",";
					}
					System.out.println("u_rcp_ing : " + u_rcp_ing);
					uvo.setU_rcp_ing(u_rcp_ing);
					
					// 썸네일 파일 처리
					UUID uuid = UUID.randomUUID();
					String[] uuids = uuid.toString().split("-");
					String uniqueName = uuids[0];

					String fileName = u_rcp_img1.getOriginalFilename();
					String u_rcp_img = uniqueName + fileName;
					// db에 파일 이름 값 넣기
					uvo.setU_rcp_img(u_rcp_img);
					System.out.println("파일 이름 : " + u_rcp_img);

					String path = request.getSession().getServletContext()
							.getRealPath("resources/user_image/user_thumnail"); // 업로드할 폴더 경로
					System.out.println("저장 경로 : " + path);

					File saveFile = new File(path + "//" + u_rcp_img);
					u_rcp_img1.transferTo(saveFile); // 파일을 톰켓 가상폴더에 저장 // 파일 처리 끝

					int result = u_recipe_Service.getWrite(uvo);

				} // 파일이 첨부되어 있을경우 끝
				
				return mv;
			} // 글쓰기로 등록했을 경우 끝
		} catch (Exception e) {
			System.out.println("error메세지는 : "+e);
			return null;
		}
	}

		@PostMapping("/saveImage.do")
		@ResponseBody
		public Map<String, String> saveImg(U_recipe_VO uvo, HttpServletRequest request){
			Map<String , String> map = new HashMap<String, String>(); // hash 맵 사용
			
			// 넘어온 파일 검증
			MultipartFile f = uvo.getS_file(); // 멀티파트파일 f 에 ImgVO vo로 f_name으로 보낸 파일을 받아서 집어넣음 
			String fname = null; 
			if(f.getSize()>0) { // f의 사이즈가 0보다 클경우 즉 파일이 있을경우 
				// 첨부파일 위치
				String path = request.getSession().getServletContext().getRealPath("/resources/user_image/user_summernote_img");

				UUID uuid = UUID.randomUUID();
				String[] uuids = uuid.toString().split("-");
				String uniqueName = uuids[0];
				fname = uniqueName+"_"+f.getOriginalFilename();
				
				try {
					//업로드(저장용도) path 경로에 있는 fname파일을 f.transferTo에 업로드하겠다.
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
				map.put("path","/resources/user_image/user_summernote_img"); 
				
				// pom.xml에 json 변환 해주는 라이브러리 추가
				return map;	 //ajax요청에서 map으로 리턴할 경우 키 : 값 으로 리턴 되기 떄문에 json형싱그로 자동으로 리턴이 된다.
			}
			return null;
		}
	
}
