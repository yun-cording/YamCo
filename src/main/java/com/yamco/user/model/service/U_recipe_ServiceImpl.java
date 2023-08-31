package com.yamco.user.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yamco.user.model.dao.U_recipe_DAO;
import com.yamco.user.model.vo.U_recipe_meta_VO;

@Service
public class U_recipe_ServiceImpl implements U_recipe_Service {
	@Autowired
	private U_recipe_DAO u_recipe_DAO;

	@Override
	public List<U_recipe_meta_VO> getU_recipeRankListRecipe() {
		return u_recipe_DAO.getU_recipeRankListRecipe();
	}
	@Override
	public List<String> getSearch(String search_text) {
		return u_recipe_DAO.getSearch(search_text);
	}
	@Override
	public U_recipe_meta_VO getSearchData(String k) {
		return u_recipe_DAO.getSearchData(k);
	}
}
