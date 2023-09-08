package com.yamco.admin.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class Log_DAO {
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	public int visitorUp() {
		return sqlSessionTemplate.insert("user_log.visitorUp");
	}
}
