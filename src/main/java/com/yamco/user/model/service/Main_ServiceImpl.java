package com.yamco.user.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yamco.user.model.dao.Main_DAO;
import com.yamco.user.model.vo.Member_meta_VO;
import com.yamco.user.model.vo.U_recipe_meta_VO;

@Service
public class Main_ServiceImpl implements Main_Service {
	
	@Autowired
	private Main_DAO main_DAO ;
	
	@Override
	public List<U_recipe_meta_VO> getUsertrendList() {
		return main_DAO.getUsertrendList() ;
	}
	
	@Override
	public List<U_recipe_meta_VO> getbestList() {
		return main_DAO.getbestList() ;
	}
	
	@Override
	public List<Member_meta_VO> getmainAwardList() {
		return main_DAO.getmainAwardList() ;
	}
}
