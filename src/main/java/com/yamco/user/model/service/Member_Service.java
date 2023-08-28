package com.yamco.user.model.service;

import java.util.List;

import com.yamco.user.model.vo.Member_VO;

public interface Member_Service {	
	// 자체 회원가입
	public int getMemberJoin(Member_VO mvo);
	
	// 멤버 전체보기
	public List<Member_VO> getMemberList();
}
