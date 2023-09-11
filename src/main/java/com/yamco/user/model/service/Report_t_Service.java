package com.yamco.user.model.service;

import java.util.List;

import com.yamco.user.model.vo.Report_t_meta_VO;

public interface Report_t_Service {
	//내가 신고한 게시물 가져오기
	public List<Report_t_meta_VO> getReportRecipe(String m_idx);
	
	//내가 신고한 댓글 가져오기
	public List<Report_t_meta_VO> getReportComment(String m_idx);
}
