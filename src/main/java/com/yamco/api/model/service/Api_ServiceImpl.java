package com.yamco.api.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yamco.api.model.dao.Api_DAO;
import com.yamco.user.model.vo.Member_VO;

@Service
public class Api_ServiceImpl implements Api_Service {
	@Autowired
	private Api_DAO api_DAO;
	
	// 소셜로그인 id있는지 확인
	@Override
	public Member_VO getIdChk(String id) {
		return api_DAO.getIdChk(id);
	}
	// 닉네임 체크
	@Override
	public int getNickChk(String m_nick) {
		return api_DAO.getNickChk(m_nick);
	}
	// 조회수 올리기
	@Override
	public int hitUpdate(String rcp_idx) {
		return api_DAO.hitUpdate(rcp_idx);
	}
	
}
