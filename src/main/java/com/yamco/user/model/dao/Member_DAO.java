package com.yamco.user.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.yamco.user.model.vo.Member_VO;

@Repository
public class Member_DAO {
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	// 자체 회원가입
	public int getMemberJoin(Member_VO mvo) {
		return sqlSessionTemplate.insert("member.join", mvo);
	}
	
	// 멤버 전체보기
	public int getMemberIdChk(String m_id){
		return sqlSessionTemplate.selectOne("member.idChk", m_id);
	}
	// 성훈 작업 시작
	// 구글 로그인 회원가입되어 있는지 아이디 chk
	public Member_VO gloginchk(String m_id) {
		return sqlSessionTemplate.selectOne("member.gloginchk",m_id);
	}

	public int gloginjoin(Member_VO mvo) {
		return sqlSessionTemplate.insert("member.gloginjoin",mvo);
	}
	// 성훈 작업 끝
}
