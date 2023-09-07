package com.yamco.admin.model.service;

import com.yamco.admin.model.vo.Admin_Dash_VO;
import com.yamco.admin.model.vo.Member_count_summary_VO;

public interface AdminService {
	// 대시보드 상단카드 4개
	public Admin_Dash_VO getDashTop();

	// 회원수 요약 가져오기
	public Member_count_summary_VO getMemberCountSummary();
}
