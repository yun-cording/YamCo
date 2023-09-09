package com.yamco.user.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yamco.user.model.dao.Report_t_DAO;
import com.yamco.user.model.vo.Report_t_meta_VO;

@Service
public class Report_t_Service_Impl implements Report_t_Service {
	@Autowired
	Report_t_DAO report_t_DAO;
	
	//내가 신고한 게시물 가져오기
	@Override
	public List<Report_t_meta_VO> getReportRecipe(String m_idx) {
		return report_t_DAO.getReportRecipe(m_idx);
	}
	
	//내가 신고한 댓글 가져오기
	@Override
	public List<Report_t_meta_VO> getReportComment(String m_idx) {
		return report_t_DAO.getReportComment(m_idx);
		
	}
}
