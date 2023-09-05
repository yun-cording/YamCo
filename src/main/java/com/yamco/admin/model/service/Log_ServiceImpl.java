package com.yamco.admin.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yamco.admin.model.dao.Log_DAO;

// implements 안했음!!
@Service
public class Log_ServiceImpl implements Log_Service {
	@Autowired
	private Log_DAO log_DAO;
	
	public int visitorUp() {
		return log_DAO.visitorUp();
	}
}
