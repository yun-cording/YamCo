package com.yamco.user.model.service;

import com.yamco.user.model.vo.Member_VO;

public interface Member_Service {	
	// 자체 회원가입
	public int getMemberJoin(Member_VO mvo);
	
	// 멤버 전체보기
	public int getMemberIdChk(String m_id);
}
