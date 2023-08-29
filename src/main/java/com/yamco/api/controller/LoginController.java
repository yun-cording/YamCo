package com.yamco.api.controller;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.util.Iterator;

import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.yamco.api.model.vo.Naver_VO;

@Controller
public class LoginController {
	@RequestMapping("/naver_login.do")
	public ModelAndView naverLoginGo(String code, String state, HttpSession session ) {
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
				if(res_code==200) {
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
					json =(JSONObject) parser.parse(sb2.toString());
					System.out.println(json);
					JSONObject response = (JSONObject) json.get("response");
					String id = response.get("id").toString();
					String nickname = response.get("nickname").toString();
					String profile_image = response.get("profile_image").toString();
					String gender = response.get("gender").toString();
					String email = response.get("email").toString();
					String mobile = response.get("mobile").toString();
					String birthday = response.get("birthday").toString();
//					String birthyear = response.get("birthyear").toString();
					
					
					Naver_VO vo = new Naver_VO();
					
					vo.setId(id);
					vo.setNickname(nickname);
					vo.setProfile_image(profile_image);
					vo.setGender(gender);
					vo.setEmail(email);
					vo.setMobile(mobile);
					vo.setBirthday(birthday);
//					vo.setBirthyear(birthyear);
					
					// DB다녀와서 고유id 있는지 체크하기
					// 있으면 세션에 로그인 변수저장후 홈페이지로
//					mv.setViewName("/user/home");
					session.setAttribute("login", "ok");
					session.setAttribute("id", id);
					
					// 없으면 닉네임 기입창으로
					mv.setViewName("/login/social_join");
					mv.addObject("vo",vo);
					return mv;
				}
			}
		} catch (Exception e) {
			System.out.println(e);
			return new ModelAndView("error404");
		}
		return new ModelAndView("error");
	}
	
	
	
	
	
	
	
	
	
	// TODO 재훈 시작
	// TODO 카카오 로그인시작
	//kakaologin.do
	// https://kauth.kakao.com/oauth/authorize?
	// response_type=code&client_id=aab498f24417783525d7f40dcb83e5e6&
	// redirect_uri=http://localhost:8090/kakaologin.do
	@RequestMapping("/kakaologin.do")
	public ModelAndView kakaoLogin(String code) {
		ModelAndView mv = new ModelAndView();
		
		// 1. 토큰 받기
		// POST	https://kauth.kakao.com/oauth/token
		String reqURL = "https://kauth.kakao.com/oauth/token" ;
		try {
			URL url = new URL(reqURL);
			HttpURLConnection conn = (HttpURLConnection)url.openConnection();
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
			sb.append("&code="+code);
			bw.write(sb.toString());
			bw.flush();
			
			// 성공하면 200 
			int responseCode = conn.getResponseCode();	
			
			// 요청을 통해 얻은 JSON 타입의 결과 메세지를 읽어 온다.
			if (responseCode == 200) {
				BufferedReader br = 
						new BufferedReader(new InputStreamReader(conn.getInputStream()));
				StringBuffer result = new StringBuffer();
				String line = null ; 
				while ((line = br.readLine())!= null) {
					result.append(line);
				}
				// JSON파싱 처리 "access_token" 과 "refresh_token"
				JSONParser pars = new JSONParser();
				JSONObject json = (JSONObject)pars.parse(result.toString());
				
				String access_token = (String)json.get("access_token");
				String refresh_token = (String)json.get("refresh_token");
				
				// 3. 사용자 정보 요청
				String apiURL = "https://kapi.kakao.com/v2/user/me";
				
				// 헤더부분
				String header = "Bearer "+ access_token;
				
				URL url2 = new URL(apiURL);
				HttpURLConnection conn2 = (HttpURLConnection)url2.openConnection();
				// POST방식
				conn2.setRequestMethod("POST");
				conn2.setDoOutput(true);
				
				// 헤더 요청 사항
				conn2.setRequestProperty("Authorization", header);
				
				int res_code = conn2.getResponseCode();
				
				if (res_code == HttpURLConnection.HTTP_OK) {
					// 카카오 서버쪽에서 사용자의 정보를 보낸다.
					// 이것을 읽어와서 필요한 정보들을 선별해야 한다.
				BufferedReader brdm =
						new BufferedReader(new InputStreamReader(conn2.getInputStream()));
			
					String str = null;
					StringBuffer res = new StringBuffer();
					while ((str = brdm.readLine()) != null) {
						res.append(str);
					}
					// 개인 사용자 정보
					// System.out.println(res.toString());
					json = (JSONObject)pars.parse(res.toString());
					System.out.println(json);
					
					JSONObject props = (JSONObject)json.get("properties");
					// 닉네임
					String nickName = (String)props.get("nickname");
					// 프로필 사진 사이즈(640x640.jpg)
					String profile_image = (String)props.get("proflie_image");
					
					
					JSONObject kakao_account = (JSONObject)json.get("kakao_account");
					// 이메일
					String email = (String)kakao_account.get("email");
					
					
					
					
					mv.addObject("nickName", nickName);
					mv.addObject("email", email);
					mv.addObject("profile_image", profile_image);
				}
			}
			return mv ;
		} catch (Exception e) {
			return null ;
		}
	}
	
	// TODO 카카오 로그인 끝
	// TODO 재훈 끝 
	
}
