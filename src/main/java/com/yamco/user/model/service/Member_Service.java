package com.yamco.user.model.service;

import com.yamco.user.model.vo.Member_VO;

public interface Member_Service {	
	// 자체 회원가입
	public int getMemberJoin(Member_VO mvo);
	
	// 아이디 중복검사
	public int getMemberIdChk(String m_id);
	
	// 성훈 작업 시작
	// 구글 로그인 회원가입되어 있는지 아이디 chk
	public Member_VO gloginchk(String m_id);

	// 구글 회원가입 db 정보등록
	public int glogin_join(Member_VO mvo);
	// 성훈 작업 끝
	// 닉네임 설정하기
	public int setNick(Member_VO m_vo);
}
