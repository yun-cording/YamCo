package com.yamco.user.controller;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Random;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RequestPart;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.fasterxml.jackson.databind.JsonNode;
import com.yamco.admin.model.service.Log_Service;
import com.yamco.api.model.service.Api_Service;
import com.yamco.api.model.service.P_recipe_Service;
import com.yamco.api.model.vo.P_recipe_VO;
import com.yamco.user.model.service.U_recipe_Service;
import com.yamco.user.model.vo.Comment_VO;
import com.yamco.user.model.vo.RecentList_VO;
import com.yamco.user.model.vo.U_recipe_VO;
import com.yamco.user.model.vo.U_recipe_meta_VO;

@Controller
public class Recipe_Controller {

	@Autowired
	U_recipe_Service u_recipe_Service;
	@Autowired
	Log_Service log_Service;
	@Autowired
	Api_Service api_Service;
	@Autowired
	P_recipe_Service p_recipe_Service;

	//레시피 저장 , 레시피 임시저장
	@PostMapping("/write_go")
	public ModelAndView get_write(U_recipe_VO uvo, HttpServletRequest request,
			@RequestPart("u_rcp_img1") MultipartFile u_rcp_img1,String u_rcp_ingArr, String u_rcp_status) {
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
		uvo.setU_rcp_ing(u_rcp_ingArr);
		uvo.setU_rcp_category(uvo.getU_rcp_category2());
		uvo.setU_rcp_ctype(uvo.getU_rcp_category1());
		System.out.println(u_rcp_ingArr);
		
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
				String path = request.getSession().getServletContext().getRealPath("resources/user_image/user_thumnail"); // 업로드할 폴더 경로
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
			// 카테고리 값 넘겨주기 처리
			String category_choice1 = urvo.getU_rcp_ctype();
			System.out.println("category_choice1 : " + category_choice1);
			String category_choice2 = urvo.getU_rcp_category();
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
				mv.addObject("keyword_length",2);
			}else { // 키워드가 1개인 경우
				u_rcp_keyword1 = urvo.getU_rcp_keyword();
				mv.addObject("u_rcp_keyword1",u_rcp_keyword1);
				mv.addObject("keyword_length",1);
				System.out.println("u_rcp_keyword1 : " + u_rcp_keyword1);
			}
			if(urvo.getU_rcp_ing()!=null) {
				String[] arr = urvo.getU_rcp_ing().split(",");
				int length = arr.length;
				mv.addObject("rcp_ing",arr);
				mv.addObject("length",length);
			}else {
				mv.addObject("length",0);
			}
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

	// TODO 상우 user recipe 시작
	
	// TODO 상우 user recipe list 출력
	@RequestMapping("/user_list.go")
	public ModelAndView u_recipe_list(HttpServletRequest request, HttpServletResponse response,
			@RequestParam(value = "selectedWay", required = false) String selectedWay,
			@RequestParam(value = "selectedCate", required = false) String selectedCate,
			HttpSession session
			) {
		ModelAndView mv = new ModelAndView("user/recipe/user_list");
		
		// 냠냠's 쉐프레시피
		// 상우 DB에 방문자수 로그 찍기 (랭킹)
		log_Service.visitorUp(request, response);
		
		// 전체 리스트 받아오기
		List<U_recipe_meta_VO> userList = u_recipe_Service.u_recipe_list();
		
		System.out.println(userList.size());
		
		mv.addObject("userList", userList);
		
		return mv;
	}
	
	
	
	// TODO 상우 user recipe detail 시작
		
	@RequestMapping("/user_recipe_detail.do")
	// seq인지 idx인지 체크
	public ModelAndView go_publicDet(@RequestParam("rcp_idx") String rcp_idx, HttpSession session,
			HttpServletRequest httpRequest, HttpServletResponse httpResponse) {
		ModelAndView mv = new ModelAndView("user/recipe/user_recipe_detail");
		
		// DB에 방문자수 +1 하자
		log_Service.visitorUp(httpRequest, httpResponse);
		
		// 상세페이지 idx를 현재페이지에 담자
		session.setAttribute("currentRcpIdx", rcp_idx);
		
		System.out.println("현재 페이지 rcpidx는 " + rcp_idx);
		
		// rcp_idx에 해당하는 자료 가져오자.
		U_recipe_meta_VO uvo = new U_recipe_meta_VO();
		uvo = u_recipe_Service.u_recipe_detail(rcp_idx);
		
		// 조회수 1 올리기
		api_Service.hitUpdate(rcp_idx);

    	// wishlist 여부 받아오기
    	String m_idx = (String)session.getAttribute("m_idx");
    	System.out.println("Rcp_Cont id는 : " + m_idx);
    	
    	// 좋아요했는가
    	String liked_ornot = p_recipe_Service.liked_ornot(m_idx, String.valueOf(rcp_idx));
    	System.out.println("좋아요했는가 : " + liked_ornot);
    	// 좋아요 안함
		mv.addObject("liked_ornot", liked_ornot);
		
		// 이 게시물에 들어간 댓글 전체 받아오기
		List<Comment_VO> comments_list_all = p_recipe_Service.load_all_comments(String.valueOf(rcp_idx));
		for (Comment_VO comment_VO : comments_list_all) {
//				System.out.println(comment_VO.getC_contents());
		}

		List<Comment_VO> comments_list_mine = new ArrayList<>();
		
		// m_nick을 기준으로 내꺼랑 일치하는 댓글만 필터링
		
		String m_nick = (String)session.getAttribute("m_nick");
		if (m_nick == null) {
			// 닉네임이 null인 경우 내 list 받아올 필요 없다.
		}else {
			// 닉네임이 있는 경우만 실행
			// comments_list_all에서 특정 m_nick 값을 가진 댓글만 필터링하여 comments_list_mine에 추가
			for (Comment_VO comment : comments_list_all) {
				if (String.valueOf(comment.getRcp_idx()).equals(m_nick)) {
					comments_list_mine.add(comment);
					mv.addObject("comments_list_mine", comments_list_mine);
					// 내꺼 list에 담고 그담 어떻게 해?
				}
			}
		}
		
//	
//		
//		
//		// TODO 상우 이런 레시피는 어떠세요?(레시피 추천) 시작
		// 전체 리스트 받아오기
		List<U_recipe_meta_VO> userList = u_recipe_Service.u_recipe_list();
		System.out.println("전체는 받음");

		// 추천게시물 띄우기
		// 랜덤으로 선택한 게시물의 인덱스를 저장할 리스트
		List<Integer> randomIndexes = new ArrayList<>();
		int totalRecipes = userList.size(); // 전체 게시물 수
		int numberOfRecipesToSelect = 8; // 가져올 게시물 수 (15개)

		// 랜덤으로 15개의 유니크한 인덱스 선택
		Random random = new Random();
		while (randomIndexes.size() < numberOfRecipesToSelect) {
		    int randomIndex = random.nextInt(totalRecipes);
		    if (!randomIndexes.contains(randomIndex)) {
		        randomIndexes.add(randomIndex);
		    }
		}

		List<U_recipe_meta_VO> random_list = new ArrayList<>(); 
		U_recipe_meta_VO uvo2 = new U_recipe_meta_VO();

		
		// 랜덤으로 선택한 인덱스에 해당하는 게시물을 detail_list에 추가
		for (Integer index : randomIndexes) {
		    uvo2 = userList.get(index);
		    random_list.add(uvo2);
		}
		// TODO 상우 이런 레시피는 어떠세요?(레시피 추천) 끝
		
		
		
		// System.out.println("내꺼 갯수 : " + comments_list_mine.size());
		// 댓글 전체리스트
		// 이용자 id도 보내주자
		// 아래 삭제해도 됨 (세션에서 뽑아씀)
		mv.addObject("m_idx", m_idx);
		// 댓글 전체 보내기
		mv.addObject("comments_list_all", comments_list_all);
		mv.addObject("random_list", random_list);
		mv.addObject("uvo", uvo);
//			mv.addObject("manualMap", manualMap);
		// System.out.println("detail list 갔다!");
		// 전체 리스트
		// System.out.println(detail_list);
		
		
		// m_nick, m_idx, loginChk, session 들어감
		
		// TODO 상우 공공데이터 상세페이지
		
		
		
		String cate = "";
		String img = "";
		String title = "";
		
		// TODO 희준 세션에 최근리스트 추가하기 시작
		List<RecentList_VO> recent = (List<RecentList_VO>) session.getAttribute("recent");
		RecentList_VO rec_vo = new RecentList_VO();
		if (recent == null) {
			recent = new ArrayList<RecentList_VO>();
		}
		boolean found = false;
		for (RecentList_VO k : recent) {
			if (k.getIdx().equals(rcp_idx)) {
				found = true;
			}
		}
		if (!found) {
			rec_vo.setIdx(rcp_idx);
			rec_vo.setCate(uvo.getU_rcp_category());
			rec_vo.setImg(uvo.getU_rcp_img());
			rec_vo.setTitle(uvo.getU_rcp_title());
			rec_vo.setWriter(uvo.getM_nick());
			recent.add(0, rec_vo);
			if (recent.size() < 4) {
				recent.subList(0, recent.size() - 1);
			} else {
				recent = recent.subList(0, 3);
			}
			session.setAttribute("recent", recent);
		}
		// TODO 희준 세션에 최근리스트 추가하기 끝
		
		System.out.println("상세 cont 완료");

		return mv;
	}
	// TODO 상우 user recipe detail 종료
	
	// TODO 상우 user recipe 종료
}
