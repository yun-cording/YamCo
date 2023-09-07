package com.yamco.admin.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yamco.admin.model.dao.AdminDAO;
import com.yamco.admin.model.vo.Admin_Dash_VO;
import com.yamco.admin.model.vo.Member_count_summary_VO;
@Service
public class AdminServiceImpl implements AdminService{
	@Autowired
	private AdminDAO adminDAO;
	@Override
	public Admin_Dash_VO getDashTop() {
		return adminDAO.getDashTop(); 
	}
	
	//회원수 요약 가져오기
	@Override
	public Member_count_summary_VO getMemberCountSummary() {
		return adminDAO.getMemberCountSummary();
	}
}
