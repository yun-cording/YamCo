package com.yamco.user.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yamco.user.model.dao.User_log_DAO;

@Service
public class User_log_Service_Impl implements User_log_Service {
	@Autowired
	private User_log_DAO user_log_DAO;

	// 일주일 검색수 기준 상위 30개 가져오기
	public List<String> getU_recipeRankListSearch7Days() {
		return user_log_DAO.getU_recipeRankListSearch7Days();
	}

	// 한달 검색수 기준 상위 30개 가져오기
	@Override
	public List<String> getU_recipeRankListSearch1Month() {
		return user_log_DAO.getU_recipeRankListSearch1Month();
	}
	
	@Override
	public List<String> getBestListIdx() {
		return user_log_DAO.getBestListIdx();
	}
}
