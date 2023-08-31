package com.yamco.user.model.service;

import java.util.List;
import java.util.Map;

import com.yamco.user.model.vo.U_recipe_meta_VO;

public interface U_recipe_Service {
	// 자체 회원가입
	public List<U_recipe_meta_VO> getU_recipeRankListRecipe();
	// 검색결과 가져오기
	public List<U_recipe_meta_VO> getSearch(Map<String, String> map);
}
