package com.yamco.api.model.service;

import com.yamco.user.model.vo.Member_VO;

public interface Api_Service {
	
	// 소셜로그인 id있는지 확인
	public Member_VO getIdChk(String id);
	// 닉네임 체크
	public int getNickChk(String m_nick);
	// 조회수 올리기
	public int hitUpdate(String rcp_idx);
}
