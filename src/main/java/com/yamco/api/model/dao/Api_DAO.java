package com.yamco.api.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.yamco.api.model.vo.Public_VO;

@Repository
public class Api_DAO {
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	// 게시물 상세리스트 받기
	public Public_VO getDetailedInfo() {
		return (Public_VO) sqlSessionTemplate.selectList("api.detailedlist");
	}
}
