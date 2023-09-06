package com.yamco.admin.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yamco.admin.model.dao.AdminDAO;
import com.yamco.admin.model.vo.Admin_Dash_VO;
@Service
public class AdminServiceImpl implements AdminService{
	@Autowired
	private AdminDAO adminDAO;
	@Override
	public Admin_Dash_VO getDashTop() {
		return adminDAO.getDashTop(); 
	}
}
