package com.yamco.user.model.service;

import java.util.List;

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
	public List<Member_VO> getMemberList() {
		return member_DAO.getMemberList();
	}
}
