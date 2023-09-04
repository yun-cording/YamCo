package com.yamco.user.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class User_log_DAO {
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;

	public List<String> getU_recipeRankListSearch7Days() {
		return sqlSessionTemplate.selectList("user_log.rankListSearch7Days");
	}

	public List<String> getU_recipeRankListSearch1Month() {
		return sqlSessionTemplate.selectList("user_log.rankListSearch1Month");
	}
}
