package com.yamco.admin.model.service;

import com.yamco.admin.model.vo.Admin_Dash_VO;
import com.yamco.admin.model.vo.Member_count_summary_VO;
import com.yamco.admin.model.vo.Admin_Report_VO;

public interface AdminService {
	public Admin_Dash_VO getDashBoard();

	public boolean blindDo(Admin_Report_VO vo);

	// 회원수 요약 가져오기
	public Member_count_summary_VO getMemberCountSummary();
}
