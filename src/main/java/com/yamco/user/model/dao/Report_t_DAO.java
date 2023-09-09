package com.yamco.user.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.yamco.user.model.vo.Report_t_meta_VO;

@Repository
public class Report_t_DAO {
	@Autowired
	private SqlSessionTemplate sessionTemplate;

	public List<Report_t_meta_VO> getReportRecipe(String m_idx) {
		return sessionTemplate.selectList("report_t.selectListRecipeByM_idx", m_idx);
	}

	public List<Report_t_meta_VO> getReportComment(String m_idx) {
		return sessionTemplate.selectList("report_t.selectListCommentByM_idx", m_idx);
	}
}
