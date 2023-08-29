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
	// 성훈 작업 시작
	@Override
	public Member_VO gloginchk(String m_id) {
		return member_DAO.gloginchk(m_id);
	}
	
	@Override
	public int glogin_join(Member_VO mvo) {
		return member_DAO.gloginjoin(mvo);
	}
	// 성훈 작업 끝
}
