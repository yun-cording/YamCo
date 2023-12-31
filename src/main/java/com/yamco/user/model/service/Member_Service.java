package com.yamco.user.model.service;

import java.util.List;

import com.yamco.user.model.vo.Member_Search_VO;
import com.yamco.user.model.vo.Member_VO;
import com.yamco.user.model.vo.Member_meta_VO;

public interface Member_Service {
	// 자체 회원가입
	public int getMemberJoin(Member_VO mvo);
	
	// 관리자 자체 회원가입
	public int getAdminJoin(Member_VO mvo);

	// 아이디 중복검사
	public int getMemberIdChk(String m_id);

	// 회원 검색
	public List<Member_VO> getMemberList(Member_Search_VO msvo);

	// 관리자 검색
	public List<Member_VO> getAdminList(Member_Search_VO msvo);
	
	// 명예의 전당 가져오기
	public List<Member_meta_VO> getAwardList();
	
	// 닉네임 설정하기
	public int setNick(Member_VO m_vo);
	
	// 자체 로그인
	public Member_VO getMemberLogin(Member_VO mvo);
	
	// 틀린 횟수 업데이트
	public int getFailCountUp(Member_VO mvo);
	
	// 비밀번호 변경
	public int getChangePw(Member_VO mvo);
	
	// 사용자 상세보기
	public Member_VO getMemberOne(String m_idx);
	
	// 사용자 정보 변경
	public int changeMyInfo(Member_VO mvo);
	
	// 사용자 탈퇴
	public int leaveMember(Member_VO mvo);
	
	// 관리자 탈퇴
	public int leaveAdmin(Member_VO mvo);
	
	// 토큰, 날짜 생성
	public int setMakeToken(Member_VO mvo);
	
	// 비밀번호 변경 대상 사용자 검색
	public Member_VO getEmailId(Member_VO mvo);
	
	// 비밀번호 변경 후 토큰 삭제
	public int getTokenDelete(Member_VO mvo);
	
	// 찜목록
	public List<String> getMyWishList(String m_idx);
	
	// m_idx를 조건으로 Member_VO update 수행
	public int getUpdate(Member_VO mvo);
}
