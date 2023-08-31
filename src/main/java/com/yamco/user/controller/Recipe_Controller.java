package com.yamco.user.controller;

import java.io.File;
import java.io.IOException;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

@Controller
public class Recipe_Controller {
	
	@RequestMapping("/uploadImage")
	public String uploadImage(@RequestParam("rcp_img") MultipartFile image , HttpServletRequest request) {
		
		try {
			UUID uuid = UUID.randomUUID();
			String[] uuids = uuid.toString().split("-");
			String uniqueName = uuids[0];
			
			String fileName = image.getOriginalFilename();
			String u_rcp_img = uniqueName + fileName ;
			System.out.println(u_rcp_img);
			
			String path = request.getSession().getServletContext().getRealPath("resources/user_image/user_thumnail"); // 업로드할 폴더 경로
			System.out.println(path);
			
			File saveFile = new File(path+"//"+u_rcp_img);
			image.transferTo(saveFile); // 파일을 톰켓 가상폴더에 저장
			
			return saveFile.toString(); // 가상폴더의 파일위치 + 이름까지 리턴
		} catch (IllegalStateException | IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			System.out.println(e);
			return null;
		}  
		
	}
	
}
