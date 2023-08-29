package com.yamco.user.model.service;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yamco.user.model.dao.Member_DAO;
import com.yamco.user.model.vo.Member_VO;

@Service
public class Member_ServiceImpl implements Member_Service{
	@Autowired
	private Member_DAO member_DAO;

	@Override
	public int getMemberJoin(Member_VO mvo) {
		return member_DAO.getMemberJoin(mvo);
	}

	@Override
	public int getMemberIdChk(String m_id) {
		return member_DAO.getMemberIdChk(m_id);
	}
	
	// 닉네임 설정하기
	@Override
	public int setNick(Member_VO m_vo) {
		return member_DAO.setNick(m_vo);
	}
}
