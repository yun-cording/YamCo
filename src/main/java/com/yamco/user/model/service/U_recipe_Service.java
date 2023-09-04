package com.yamco.user.model.service;

import java.util.List;
import java.util.Map;

import com.yamco.user.model.vo.U_recipe_VO;
import com.yamco.user.model.vo.U_recipe_meta_VO;

public interface U_recipe_Service {
	// 검색결과 가져오기
	public List<U_recipe_meta_VO> getSearch(Map<String, String> map);
	// 일주일 조회수 기준 상위 30개 가져오기
	public List<U_recipe_meta_VO> getU_recipeRankListRecipe7Days();

	// 한달 조회수 기준 상위 30개 가져오기
	public List<U_recipe_meta_VO> getU_recipeRankListRecipe1Month();

	// 조회수 상승
	public int getHitUp(String rcp_idx, String m_idx);
	
	// 레시피 글쓰기
	public int getWrite(U_recipe_VO uvo);
}
