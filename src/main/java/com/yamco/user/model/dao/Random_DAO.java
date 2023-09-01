package com.yamco.user.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.yamco.user.model.vo.Random_VO;

@Repository
public class Random_DAO {

	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;

	public List<Random_VO> getRandomList() {
		return sqlSessionTemplate.selectList("image.random") ;
	}
	
	
}
