package com.yamco.user.model.service;

import java.util.List;

import com.yamco.user.model.vo.Member_Search_VO;
import com.yamco.user.model.vo.Member_VO;

public interface Member_Service {
	// 자체 회원가입
	public int getMemberJoin(Member_VO mvo);

	// 아이디 중복검사
	public int getMemberIdChk(String m_id);

	// 회원 검색
	public List<Member_VO> getMemberList(Member_Search_VO msvo);
	
	// 닉네임 설정하기
	public int setNick(Member_VO m_vo);
	
	// 자체 로그인
	public Member_VO getMemberLogin(Member_VO mvo);
	
	// 틀린 횟수 업데이트
	public int getFailCountUp(Member_VO mvo);
	
	// 비밀번호 변경
	public int getChangePw(Member_VO mvo);

	public Member_VO getMemberOne(String m_idx);

	public int changeMyInfo(Member_VO mvo);

	public int leaveMember(Member_VO mvo);

}
