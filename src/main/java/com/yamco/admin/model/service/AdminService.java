package com.yamco.admin.model.service;

import com.yamco.admin.model.vo.Admin_Dash_VO;
import com.yamco.admin.model.vo.Admin_Report_VO;

public interface AdminService {
	public Admin_Dash_VO getDashBoard();

	public boolean blindDo(Admin_Report_VO vo);

}
