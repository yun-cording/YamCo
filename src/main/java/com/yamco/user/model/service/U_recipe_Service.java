package com.yamco.user.model.service;

import java.util.List;

import com.yamco.user.model.vo.U_recipe_meta_VO;

public interface U_recipe_Service {
	// 자체 회원가입
	public List<U_recipe_meta_VO> getU_recipeRankListRecipe();
	// 검색결과 idx가져오기
	public List<String> getSearch(String search_text);
	// idx로 metadata가져오기
	public U_recipe_meta_VO getSearchData(String k);
}
