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
						+ "<table><tbody>"
						+ "<tr><td><h2>냠냠 레시피</h2></td></tr>"
						+ "<tr><td><h3>링크를 클릭해서 새로운 비밀번호를 설정해주세요.</h3></td></tr>"
						+ "<tr><td><font size='28px'>비밀번호 변경 링크</font></td></tr>"
						+ "<tr><td></td></tr>"
						+ "<tr><td>30분 이내로 변경을 완료해주세요. 시간이 지나면 비밀번호 변경이 어렵습니다.</td></tr>"
						+ "<tr><td><font size='15px'>링크 : <a href='http://localhost:8090/go_new_pw.do?m_id=" + mvo.getM_id() + "'>변경하러 가기</font></td></tr>"
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
