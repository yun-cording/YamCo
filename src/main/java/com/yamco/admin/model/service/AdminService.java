package com.yamco.admin.model.service;

import java.util.List;

import com.yamco.admin.model.vo.Admin_Banner_VO;
import com.yamco.admin.model.vo.Admin_Dash_VO;
import com.yamco.admin.model.vo.Admin_Report_VO;

public interface AdminService {
	public Admin_Dash_VO getDashBoard();

	public boolean blindDo(Admin_Report_VO vo);

	public List<List<Admin_Banner_VO>> total_list();

	public void noticeDel(String notice_idx);

}
