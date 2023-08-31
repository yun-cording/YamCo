package com.yamco.user.model.service;

import java.util.List;

import com.yamco.user.model.vo.U_recipe_meta_VO;

public interface U_recipe_Service {
	// 일주일 조회수 기준 상위 30개 가져오기
	public List<U_recipe_meta_VO> getU_recipeRankListRecipe7Days();

	// 한달 조회수 기준 상위 30개 가져오기
	public List<U_recipe_meta_VO> getU_recipeRankListRecipe1Month();

	// 검색결과 idx가져오기
	public List<String> getSearch(String search_text);

	// rcp_idx로 metadata가져오기
	public U_recipe_meta_VO getSearchData(String rcp_idx);

	// 조회수 상승
	public int getHitUp(String rcp_idx, String m_idx);
}
