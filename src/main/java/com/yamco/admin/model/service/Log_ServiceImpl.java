package com.yamco.admin.model.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yamco.admin.model.dao.Log_DAO;

// implements 안했음!!
@Service
public class Log_ServiceImpl implements Log_Service {
	@Autowired
	private Log_DAO log_DAO;
	
	public void visitorUp(HttpServletRequest httpRequest, HttpServletResponse httpResponse) {
        HttpSession session = httpRequest.getSession(false); // 이미 생성된 세션이 있는 경우만 가져옴
        
        if (session != null && session.getAttribute("logCountExecuted") == null) {
        	log_DAO.visitorUp();
        }
        
        session.setAttribute("logCountExecuted", true);
    }
}
