package com.yamco.user.model.service;

import java.util.List;
import java.util.Map;

import com.yamco.user.model.vo.U_recipe_Search_VO;
import com.yamco.user.model.vo.U_recipe_VO;
import com.yamco.user.model.vo.U_recipe_meta_VO;

public interface U_recipe_Service {
	// 검색결과 가져오기
	public List<U_recipe_meta_VO> getSearch(Map<String, String> map, String m_idx);

	// rcp_idx를 포함한 U_recipe_VO로 U_recipe_meta_VO 검색
	public U_recipe_meta_VO getSelectOne(U_recipe_VO urvo);
	
	// U_recipe_VO로 U_recipe_meta_VO 검색
	public List<U_recipe_meta_VO> getSelectList(U_recipe_VO urvo);
	
	// U_recipe_Search_VO로 U_recipe_meta_VO 검색
	public List<U_recipe_meta_VO> getSelectList(U_recipe_Search_VO ursvo);
	
	// rcp_idx로 U_recipe_meta_VO 검색
	public U_recipe_meta_VO getSelectOne(String rcp_idx);

	// 일주일 조회수 기준 상위 30개 가져오기
	public List<U_recipe_meta_VO> getU_recipeRankListRecipe7Days();

	// 한달 조회수 기준 상위 30개 가져오기
	public List<U_recipe_meta_VO> getU_recipeRankListRecipe1Month();

	// 조회수 상승
	public int getHitUp(String rcp_idx, String m_idx);
	
	// 레시피 글쓰기
	public int getWrite(U_recipe_VO uvo);
	
	// 임시저장된 레시피 조회 (성훈)
	public U_recipe_VO getLimit_recipe(String m_idx);

	// 임시저장 레시피 삭제 
	public int deleteRecipe(String m_idx);

	//
	public int limitWrite(U_recipe_VO uvo);
	
	
}
