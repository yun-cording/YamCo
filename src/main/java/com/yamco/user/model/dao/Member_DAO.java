package com.yamco.user.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.yamco.user.model.vo.Member_Search_VO;
import com.yamco.user.model.vo.Member_VO;

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

	// 성훈 작업 시작
	// 구글 로그인 회원가입되어 있는지 아이디 chk
	public Member_VO gloginchk(String m_id) {
		return sqlSessionTemplate.selectOne("member.gloginchk", m_id);
	}

	public int gloginjoin(Member_VO mvo) {
		return sqlSessionTemplate.insert("member.gloginjoin", mvo);
	}
	// 성훈 작업 끝

	// 닉네임 설정하기
	public int setNick(Member_VO m_vo) {
		return sqlSessionTemplate.update("member.upNick", m_vo);
	}
}
