package com.yamco.admin.model.service;

import java.util.List;

import com.yamco.admin.model.vo.Admin_Dash_VO;
import com.yamco.admin.model.vo.Admin_Report_Chk_VO;
import com.yamco.admin.model.vo.Admin_Report_VO;

public interface AdminService {
	public Admin_Dash_VO getDashBoard();

	public boolean blindDo(Admin_Report_VO vo);
	
	// 신고내역 관리 모든 신고내역 불러오기
	public List<Admin_Report_Chk_VO> getReportlist();


}
