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

	// 닉네임 설정하기
	public int setNick(Member_VO m_vo) {
		return sqlSessionTemplate.update("member.upNick", m_vo);
	}

	public Member_VO getMemberOne(String m_idx) {
		return sqlSessionTemplate.selectOne("member.getOne", m_idx);
	}

	public int changeMyInfo(Member_VO mvo) {
		return sqlSessionTemplate.update("member.changeMyInfo", mvo);
	}
}
