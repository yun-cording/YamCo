package com.yamco.admin.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yamco.admin.model.dao.AdminDAO;
import com.yamco.admin.model.vo.Admin_Banner_VO;
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
	
	@Override
	public List<List<Admin_Banner_VO>> total_list() {
		return adminDAO.total_list();
	}
	
	@Override
	public void noticeDel(String notice_idx) {
		adminDAO.noticeDel(notice_idx);
	}
	@Override
	public void pplDel(String ppl_idx) {
		adminDAO.pplDel(ppl_idx);
	}
	@Override
	public void foodingDel(String food_idx) {
		adminDAO.foodingDel(food_idx);
	}
	
	@Override
	public List<List<Admin_Banner_VO>> total_delete_list() {
		return adminDAO.total_delete_list();
	}
	@Override
	public void noticeUp(String idx) {
		adminDAO.noticeUp(idx);
	}
	@Override
	public void pplUp(String idx) {
		adminDAO.pplUp(idx);		
	}
	@Override
	public void foodingUp(String idx) {
		adminDAO.foodingUp(idx);		
	}
}
