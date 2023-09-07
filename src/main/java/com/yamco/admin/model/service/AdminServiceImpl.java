package com.yamco.admin.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yamco.admin.model.dao.AdminDAO;
import com.yamco.admin.model.vo.Admin_Dash_VO;
import com.yamco.admin.model.vo.Admin_Report_VO;

@Service
public class AdminServiceImpl implements AdminService {
	@Autowired
	private AdminDAO adminDAO;

	@Override
	public Admin_Dash_VO getDashBoard() {
		Admin_Dash_VO vo = adminDAO.getDashBoard();
		
		return vo;
	}
	
	@Override
	public boolean blindDo(Admin_Report_VO vo) {
		return adminDAO.blindDo(vo);
	}
}
