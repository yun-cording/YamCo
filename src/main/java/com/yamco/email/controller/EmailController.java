package com.yamco.email.controller;

import java.util.Random;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.yamco.email.service.EmailService;

@Controller
public class EmailController {
	@Autowired
	private EmailService mailService;
	
	@RequestMapping("/email_send.do")
	public ModelAndView sendMail() {
		try {
			ModelAndView mv = new ModelAndView("redirect:/");
			// 임시번호 만들기
						Random random = new Random();
			            String order_no = String.valueOf(random.nextInt(1000000) % 1000000);
			            if(order_no.length() < 6) {
			                int substract = 6 - order_no.length();
			                StringBuffer sb = new StringBuffer();

			                for(int i=0; i<substract; i++) {
			                    sb.append("0");
			                }
			                
			                sb.append(order_no);
			                order_no = sb.toString();
			            }
			            
			            // 임시번호 db에 저장해서 사용
			            
			            // 
			            mailService.sendEmail(order_no, "pcl8205@naver.com");
			            return mv;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}
}
