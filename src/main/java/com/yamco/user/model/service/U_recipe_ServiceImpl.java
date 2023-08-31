package com.yamco.user.model.service;

import java.util.List;
import java.util.Map;

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
	public List<U_recipe_meta_VO> getSearch(Map<String, String> map) {
		return u_recipe_DAO.getSearch(map);
	}
}
