package com.yamco.api.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.yamco.api.model.vo.Public_VO;
import com.yamco.user.model.vo.Member_VO;

@Repository
public class Api_DAO {
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	// 게시물 상세리스트 받기
	public Public_VO getDetailedInfo() {
		return (Public_VO) sqlSessionTemplate.selectList("api.detailedlist");
	}
	// 소셜로그인 고유 id 체크 (db에 있는지 없는지)
	public Member_VO getIdChk(String m_id) {
		return sqlSessionTemplate.selectOne("api.idChk",m_id); 
	}
}
