package com.yamco.user.model.service;

import java.util.List;

public interface User_log_Service {
	// 일주일 검색수 기준 상위 30개 가져오기
	public List<String> getU_recipeRankListSearch7Days();

	// 한달 검색수 기준 상위 30개 가져오기
	public List<String> getU_recipeRankListSearch1Month();
}
