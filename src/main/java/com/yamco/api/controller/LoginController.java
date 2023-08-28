package com.yamco.api.controller;

import java.io.BufferedReader;
import java.io.InputStreamReader;
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
}
