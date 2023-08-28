package com.yamco.api.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yamco.api.model.dao.Api_DAO;
import com.yamco.api.model.vo.Public_VO;
import com.yamco.user.model.vo.Member_VO;

@Service
public class Api_ServiceImpl implements Api_Service {
	@Autowired
	private Api_DAO api_DAO;
	
	@Override
	public Public_VO getDetailedInfo() {
		return api_DAO.getDetailedInfo();
	}
	
	@Override
	public Member_VO getIdChk(String id) {
		return api_DAO.getIdChk(id);
	}
}
