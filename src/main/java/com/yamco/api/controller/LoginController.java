package com.yamco.api.controller;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;

import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.yamco.api.model.service.Api_Service;
import com.yamco.user.model.service.Member_Service;
import com.yamco.user.model.vo.Member_VO;

@Controller
public class LoginController {
	@Autowired
	private Api_Service api_Service;
	@Autowired
	private Member_Service member_Service;
	// TODO 희준의 작업공간 시작
	@RequestMapping("/naver_login.do")
	public ModelAndView naverLoginGo(String code, String state, HttpSession session) {
		ModelAndView mv = new ModelAndView();

		try {
			String clientId = "YvbCvm24gWq60XdG4a8G";// 애플리케이션 클라이언트 아이디값";
			String clientSecret = "Zg7E_cBoml";// 애플리케이션 클라이언트 시크릿값";
			String redirectURI = URLEncoder.encode("http://localhost:8090/naver_login.do", "UTF-8");
			String apiURL;
			apiURL = "https://nid.naver.com/oauth2.0/token?grant_type=authorization_code&";
			apiURL += "client_id=" + clientId;
			apiURL += "&client_secret=" + clientSecret;
			apiURL += "&redirect_uri=" + redirectURI;
			apiURL += "&code=" + code;
			apiURL += "&state=" + state;
			URL url = new URL(apiURL);
			HttpURLConnection con = (HttpURLConnection) url.openConnection();
			con.setRequestMethod("GET");
			int responseCode = con.getResponseCode();
			BufferedReader br;
			if (responseCode == 200) { // 정상 호출
				br = new BufferedReader(new InputStreamReader(con.getInputStream()));
			} else { // 에러 발생
				br = new BufferedReader(new InputStreamReader(con.getErrorStream()));
			}
			String inputLine;
			StringBuffer res = new StringBuffer();
			while ((inputLine = br.readLine()) != null) {
				res.append(inputLine);
			}
			br.close();
			if (responseCode == 200) { // 토큰가져오기 성공
				JSONParser parser = new JSONParser();
				JSONObject json = (JSONObject) parser.parse(res.toString());
				String access_token = json.get("access_token").toString();
				String header = "Bearer " + access_token;
				String apiURL2 = "https://openapi.naver.com/v1/nid/me";
				URL url2 = new URL(apiURL2);
				HttpURLConnection con2 = (HttpURLConnection) url2.openConnection();
				con2.setRequestMethod("GET");
				con2.setDoOutput(true);
				con2.setRequestProperty("Authorization", header);
				int res_code = con2.getResponseCode();
				if (res_code == 200) {
					BufferedReader br2;
					if (res_code == 200) { // 정상 호출
						br2 = new BufferedReader(new InputStreamReader(con2.getInputStream()));
					} else { // 에러 발생
						br2 = new BufferedReader(new InputStreamReader(con2.getErrorStream()));
					}
					String inputLine2;
					StringBuffer sb2 = new StringBuffer();
					while ((inputLine2 = br2.readLine()) != null) {
						sb2.append(inputLine2);
					}
					br2.close();
					json = (JSONObject) parser.parse(sb2.toString());
					JSONObject response = (JSONObject) json.get("response");
					String id = response.get("id").toString();
					String nickname = response.get("nickname").toString();
					String profile_image = "";
					if(response.get("profile_image")!=null) {
						profile_image = response.get("profile_image").toString();
					}
					String gender = response.get("gender").toString();
					String mobile = "";
					if(response.get("mobile")!=null) {
						mobile = response.get("mobile").toString();
					}
					String birthday = response.get("birthday").toString();

					Member_VO m_vo = new Member_VO();

					m_vo.setM_id(id);
					m_vo.setM_status("1");
					m_vo.setM_login_type("3");
					m_vo.setM_nick(nickname);
					m_vo.setM_image(profile_image);
					m_vo.setM_gender(gender);
					m_vo.setM_phone(mobile.replaceAll("-", ""));
					m_vo.setM_birthday(birthday.replaceAll("-", ""));

					// DB다녀와서 고유id 있는지 체크하기
					Member_VO m_vo2 = api_Service.getIdChk(id);
					if(m_vo2!=null) {
						if(m_vo2.getM_status().equals("3")) {
							String alert="탈퇴한 회원입니다.";
							mv.addObject("alert", alert);
							mv.setViewName("login/login");
							return mv;
						}else if(m_vo2.getM_status().equals("4")){
							String alert="블락된 회원입니다. 게시물, 댓글 작성이 제한됩니다.";
							mv.addObject("alert", alert);
							mv.setViewName("main");
							return mv;
						}else {
							if (m_vo2.getM_nick() !=null) {
								// 닉네임 널이 아니라면
								mv.setViewName("main");
								session.setAttribute("loginChk", true);
								session.setAttribute("m_nick", nickname);
								session.setAttribute("m_idx", m_vo2.getM_idx());
								session.setAttribute("m_image", m_vo2.getM_image());
							} else {
								mv.setViewName("/login/social_join"); // 닉네임받는곳
								mv.addObject("m_id",id); // 소셜로그인 고유id
								mv.addObject("m_nick",nickname); // 소셜로그인내부 nick네임
							}
						}
					}else {
						// 없으면 DB에 닉네임 null로 저장후 닉네임 받으러
						m_vo.setM_nick(null);// db에 저장할 닉네임 null
						member_Service.getMemberJoin(m_vo); // db에 저장
						mv.setViewName("/login/social_join"); // 닉네임받는곳
						mv.addObject("m_id", id); // 소셜로그인 고유id
						mv.addObject("m_nick", nickname); // 소셜로그인내부 nick네임
					}
					return mv;
				}
			}
		} catch (Exception e) {
			System.out.println(e);
			return new ModelAndView("error404");
		}
		return new ModelAndView("error404");
	}
	
	@RequestMapping("/logOut_go")
	public ModelAndView logoutDo(HttpSession session) {
		session.removeAttribute("loginChk");
		session.removeAttribute("m_nick");
		session.removeAttribute("m_idx");
		session.removeAttribute("m_image");
		return new ModelAndView("main");
	}
	
	// TODO 희준의 작업공간 끝

	// TODO 재훈 시작
	// TODO 카카오 로그인시작
	// kakaologin.do
	// https://kauth.kakao.com/oauth/authorize?
	// response_type=code&client_id=aab498f24417783525d7f40dcb83e5e6&
	// redirect_uri=http://localhost:8090/kakaologin.do
	@RequestMapping("/kakaologin.do")
	public ModelAndView kakaoLogin(String code, HttpSession session) {
		ModelAndView mv = new ModelAndView();

		// 1. 토큰 받기
		// POST https://kauth.kakao.com/oauth/token
		String reqURL = "https://kauth.kakao.com/oauth/token";
		try {
			URL url = new URL(reqURL);
			HttpURLConnection conn = (HttpURLConnection) url.openConnection();
			conn.setRequestMethod("POST");
			conn.setDoOutput(true);
			// 요청 헤더 부분
			conn.setRequestProperty("Content-type", "application/x-www-form-urlencoded;charset=utf-8");
			// 본문에 필요한 요구사항 4개
			BufferedWriter bw = new BufferedWriter(new OutputStreamWriter(conn.getOutputStream()));
			StringBuffer sb = new StringBuffer();
			sb.append("grant_type=authorization_code");
			sb.append("&client_id=aab498f24417783525d7f40dcb83e5e6");
			sb.append("&redirect_uri=http://localhost:8090/kakaologin.do");
			sb.append("&code=" + code);
			bw.write(sb.toString());
			bw.flush();

			// 성공하면 200
			int responseCode = conn.getResponseCode();

			// 요청을 통해 얻은 JSON 타입의 결과 메세지를 읽어 온다.
			if (responseCode == 200) {
				BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream()));
				StringBuffer result = new StringBuffer();
				String line = null;
				while ((line = br.readLine()) != null) {
					result.append(line);
				}
				// JSON파싱 처리 "access_token" 과 "refresh_token"
				JSONParser pars = new JSONParser();
				JSONObject json = (JSONObject) pars.parse(result.toString());

				String access_token = (String) json.get("access_token");

				// 3. 사용자 정보 요청
				String apiURL = "https://kapi.kakao.com/v2/user/me";

				// 헤더부분
				String header = "Bearer " + access_token;

				URL url2 = new URL(apiURL);
				HttpURLConnection conn2 = (HttpURLConnection) url2.openConnection();
				// POST방식
				conn2.setRequestMethod("POST");
				conn2.setDoOutput(true);

				// 헤더 요청 사항
				conn2.setRequestProperty("Authorization", header);

				int res_code = conn2.getResponseCode();

				if (res_code == HttpURLConnection.HTTP_OK) {
					// 카카오 서버쪽에서 사용자의 정보를 보낸다.
					// 이것을 읽어와서 필요한 정보들을 선별해야 한다.
					BufferedReader brdm = new BufferedReader(new InputStreamReader(conn2.getInputStream()));

					String str = null;
					StringBuffer res = new StringBuffer();
					while ((str = brdm.readLine()) != null) {
						res.append(str);
					}
					// 개인 사용자 정보
					// System.out.println(res.toString());
					json = (JSONObject) pars.parse(res.toString());
					System.out.println(json);
					JSONObject props = (JSONObject) json.get("properties");
					// 0) 고유 아이디 DB의 m_id 에 보내야함
					String id = json.get("id").toString();
					// 1) 닉네임 받음 DB안보내고 DB엔 NULL로 보냄 그리고 jsp에 보내야함
					String nickName = props.get("nickname").toString();
					// 2) DB보냄 프로필 사진 주소 , 사이즈(640x640.jpg)
					String profile_image = props.get("profile_image").toString();

					JSONObject kakao_account = (JSONObject) json.get("kakao_account");
					// 3) DB보냄 성별 male은 M으로 저장 fmale 은 F로 저장
					String gen = "";
					if (kakao_account.get("gender") != null) {
						gen = kakao_account.get("gender").toString();
					}
					String gender = null;
					// 성별 if문
					if (gen.equals("male")) {
						gender = "M";
					} else {
						gender = "F";
					}

					// 4) DB보냄 생일
					String birthday = null ;
					if (kakao_account.get("birthday") != null) {
						birthday = kakao_account.get("birthday").toString();
					}

					// DB보낼것들(m_id,프로필 사진 주소,성별(M,F),생일)
					Member_VO mvo = new Member_VO();
					mvo.setM_id(id);
					mvo.setM_status("1");
					mvo.setM_login_type("2");
					mvo.setM_image(profile_image);
					mvo.setM_gender(gender);
					mvo.setM_birthday(birthday);
					// 파싱하고 나서 DB에 insert하기

					// DB다녀와서 고유id 있는지 체크하기
					Member_VO m_vo2 = api_Service.getIdChk(id);
					System.out.println("m_vo2 : " + m_vo2);
					if (m_vo2 != null) {
						// 있으면 세션에 로그인 변수저장후 홈페이지로
						if (m_vo2.getM_nick() != null) {
							// 닉네임 널이 아니라면
							mv.setViewName("main");
							session.setAttribute("loginChk", true);
							session.setAttribute("m_nick", nickName);
							session.setAttribute("m_idx", m_vo2.getM_idx());
							session.setAttribute("m_image", m_vo2.getM_image());
						} else {
							mv.setViewName("/login/social_join"); // 닉네임받는곳
							mv.addObject("m_id", id); // 소셜로그인 고유id
							mv.addObject("m_nick", nickName); // 소셜로그인내부 nick네임
						}

					} else {
						// 없으면 DB에 닉네임 null로 저장후 닉네임 받으러
						mvo.setM_nick(null);// db에 저장할 닉네임 null
						member_Service.getMemberJoin(mvo); // db에 저장
						mv.setViewName("/login/social_join"); // 닉네임받는곳
						mv.addObject("m_id", id); // 소셜로그인 고유id
						mv.addObject("m_nick", nickName); // 소셜로그인내부 nick네임
					}
				}
			}

			return mv;

		} catch (Exception e) {
			System.out.println(e);
			return new ModelAndView("error404");
		}

	}

	// TODO 카카오 로그인 끝
	// TODO 재훈 끝

	// TODO 구글 로그인 시작
	// TODO 성훈 시작
	@RequestMapping("/google_login_do")
	public ModelAndView google_Login(HttpSession session, String m_id, String m_image) {
		ModelAndView mv = new ModelAndView();

		// 1차로 db에 m_id에 해당하는 값이 있는지 확인
		Member_VO mvo = api_Service.getIdChk(m_id);
		// db에 값이 저장되어 있는경우 즉, 이미 회원가입이 되어있는경우 바로 메인페이지로 이동
		if (mvo != null) {
			if (mvo.getM_nick() != null) { // db에 값이 있고 닉네임까지 입력되어 있을경우 메인으로이동
				mv.setViewName("/main");
				session.setAttribute("loginChk", true);
				session.setAttribute("m_nick", mvo.getM_nick());
				session.setAttribute("m_idx", mvo.getM_idx());
				session.setAttribute("m_image", mvo.getM_image());
			 // db에 값이 있고 닉네임까지 입력되어 있을경우 메인으로이동 끝
			}else {
				mv.setViewName("/login/social_join"); // 닉네임받는곳
				mv.addObject("m_id", m_id); // 소셜로그인 고유id
			}
			return mv;
		 // db에 값은 저장되어있지만 닉네임이 입력이 안되어있을때 닉네임 입력 페이지로이동 끝
		}else { // db에 값이 없는경우 = 처음 회원가입하는경우
			mvo = new Member_VO();
			mvo.setM_id(m_id);
			mvo.setM_image(m_image);
			mvo.setM_login_type("4");
			member_Service.getMemberJoin(mvo);
			session.setAttribute("loginChk", true);
			session.setAttribute("id", m_id);
			session.setAttribute("m_idx", mvo.getM_idx());
			session.setAttribute("m_image", mvo.getM_image());
			mv.setViewName("/login/social_join"); // 닉네임받는곳
			return mv;
		} // 구글 로그인 처음 회원가입 끝
	}

	// TODO 구글 로그인 끝
	// TODO 성훈 끝
}
