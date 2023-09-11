package com.yamco.user.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.yamco.admin.model.vo.Report_VO;

@Repository
public class Report_DAO {
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;

	// 신고 인서트
	public String reportInsert(Report_VO revo) {
		return String.valueOf(sqlSessionTemplate.insert("report.reportInsert", revo));
	}
}
