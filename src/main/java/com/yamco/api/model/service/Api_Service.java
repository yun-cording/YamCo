package com.yamco.api.model.service;

import com.yamco.api.model.vo.Public_VO;
import com.yamco.user.model.vo.Member_VO;

public interface Api_Service {
	public Public_VO getDetailedInfo();
	
	// 소셜로그인 id있는지 확인
	public Member_VO getIdChk(String id);
	// 닉네임 체크
	public int getNickChk(String m_nick);

}
