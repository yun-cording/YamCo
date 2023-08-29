package com.yamco.user.model.service;

import com.yamco.user.model.vo.Member_VO;

public interface Member_Service {	
	// 자체 회원가입
	public int getMemberJoin(Member_VO mvo);
	
	// 아이디 중복검사
	public int getMemberIdChk(String m_id);
	
	// 닉네임 설정하기
	public int setNick(Member_VO m_vo);
}
