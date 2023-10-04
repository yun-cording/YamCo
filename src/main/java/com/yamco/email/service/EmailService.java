package com.yamco.email.service;

import javax.mail.internet.MimeMessage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Service;

import com.yamco.user.model.dao.Member_DAO;
import com.yamco.user.model.vo.Member_VO;

@Service
public class EmailService {
	@Autowired
	private JavaMailSender mailSender;
	private MimeMessage message;
	private MimeMessageHelper messageHelper;
	
	
	public void sendEmail(Member_VO mvo, String fromMail) {
		EmailHandler sendMail;
		try {			
			sendMail = new EmailHandler(mailSender);
			sendMail.setSubject("냠냠레시피에서 새로운 비밀번호 변경 링크를 보내드립니다."); // 메일 제목
			
			// 내용
			sendMail.setText("" 
						+ "<table style=\"border-radius:10px; border: 2px solid green; text-align: center; width: 80%; margin:10%; height: 400px;\"><tbody>"
						+ "<tr><td style='height:80px;'><h2 style=\"font-size: 5rem; color: tomato; width: 100%; margin: 2% auto;\">냠냠 레시피</h2><hr style=\"border: 1.5px solid green;\"></td></tr>"
						+ "<tr><td><h4 style=\"font-size: 1.5rem; margin: 3% auto;\">링크를 클릭해서 <span style=\"color: tomato;\">새로운 비밀번호</span>를 설정해주세요.</h4></td></tr>"
						+ "<tr><td><h4 style='font-size: 20px; margin:3% auto;'><span style=\"font-size: 20px;\">변경하러 가기</span> | <span style=\"color: green;\"><a href='http://localhost:8090/go_new_pw.do?m_id=" + mvo.getM_id() + "' style='text-decoration:none; color:green;'>Link</span> | </h4></td></tr>"
						+ "<tr><td></td></tr>"
						+ "<tr><td><span style=\"color: tomato; font-weight: bold;\">30분 이내</span>로 변경을 완료해주세요. <br>시간이 지나면 비밀번호 변경이 어렵습니다.</td></tr>"
						+ "</tbody></table>");
			
			// 보내는 이
			sendMail.setFrom(fromMail, "YamYam Recipe");
			
			// 받는 이
			sendMail.setTo(mvo.getM_id());
			sendMail.send();
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println(e);
		}
	}
}
