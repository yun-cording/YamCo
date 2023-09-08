package com.yamco.api.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.yamco.user.model.vo.Member_VO;

@Repository
public class Api_DAO {
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	// 소셜로그인 고유 id 체크 (db에 있는지 없는지)
	public Member_VO getIdChk(String m_id) {
		return sqlSessionTemplate.selectOne("api.idChk",m_id); 
	}
	// 닉네임체크
	public int getNickChk(String m_nick) {
		return sqlSessionTemplate.selectOne("api.nickChk", m_nick);
	}
	// 조회수 올리기
	public int hitUpdate(String rcp_idx) {
		return sqlSessionTemplate.update("api.hit_update", rcp_idx);
	}
}
