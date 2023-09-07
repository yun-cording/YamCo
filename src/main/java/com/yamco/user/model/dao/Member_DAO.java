package com.yamco.user.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.yamco.user.model.vo.Member_Search_VO;
import com.yamco.user.model.vo.Member_VO;
import com.yamco.user.model.vo.Member_meta_VO;

@Repository
public class Member_DAO {
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;

	// 자체 회원가입
	public int getMemberJoin(Member_VO mvo) {
		return sqlSessionTemplate.insert("member.join", mvo);
	}

	// 아이디 중복검사
	public int getMemberIdChk(String m_id) {
		return sqlSessionTemplate.selectOne("member.idChk", m_id);
	}

	// 회원 검색
	public List<Member_VO> getMemberList(Member_Search_VO msvo) {
		return sqlSessionTemplate.selectList("member.selectListBySearchVO", msvo);
	}

	// 명예의 전당 가져오기
	public List<Member_meta_VO> getAwardList() {
		return sqlSessionTemplate.selectList("member.selectAwardList");
	}

	// 닉네임 설정하기
	public int setNick(Member_VO m_vo) {
		return sqlSessionTemplate.update("member.upNick", m_vo);
	}
	
	// 자체 로그인
	public Member_VO getMemberLogin(Member_VO mvo) {
		return sqlSessionTemplate.selectOne("member.login", mvo);
	}
	
	// 틀린 횟수 업데이트
	public int getFailCountUp(Member_VO mvo) {
		return sqlSessionTemplate.update("member.failCountUp", mvo);
	}
	
	// 비밀번호 변경
	public int getChangePw(Member_VO mvo) {
		System.out.println("2");
		return sqlSessionTemplate.update("member.changePw", mvo);
	}

	public Member_VO getMemberOne(String m_idx) {
		return sqlSessionTemplate.selectOne("member.getOne", m_idx);
	}

	public int changeMyInfo(Member_VO mvo) {
		return sqlSessionTemplate.update("member.changeMyInfo", mvo);

	}

	//회원 탈퇴
	public int leaveMember(Member_VO mvo) {
		return sqlSessionTemplate.update("member.leave", mvo);
	}

	//관리자 탈퇴
	public int leaveAdmin(Member_VO mvo) {
		return sqlSessionTemplate.update("member.leaveAdmin", mvo);
	}
	
	// 토큰, 날짜 생성
	public int setMakeToken(Member_VO mvo) {
		return sqlSessionTemplate.update("member.token", mvo);
	}
	
	// 비밀번호 변경 대상 사용자 검색
	public Member_VO getEmailId(Member_VO mvo) {
		return sqlSessionTemplate.selectOne("member.emailId", mvo);
	}
	
	// 비밀번호 변경 후 토큰 삭제
	public int getTokenDelete(Member_VO mvo) {
		return sqlSessionTemplate.update("member.tokenDelete", mvo);
	}
	// 찜목록
	public List<String> getMyWishList(String m_idx) {
		return sqlSessionTemplate.selectList("member.wishList", m_idx);
	}
	
	// m_idx를 조건으로 Member_VO update 수행
	public int getUpdate(Member_VO mvo) {
		return sqlSessionTemplate.update("member.update", mvo);
	}
}
