package com.yamco.user.model.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yamco.user.model.dao.U_recipe_DAO;
import com.yamco.user.model.vo.U_recipe_VO;
import com.yamco.user.model.vo.U_recipe_meta_VO;

@Service
public class U_recipe_ServiceImpl implements U_recipe_Service {
	@Autowired
	private U_recipe_DAO u_recipe_DAO;

	// 일주일 조회수 기준 상위 30개 가져오기
	@Override
	public List<U_recipe_meta_VO> getU_recipeRankListRecipe7Days() {
		return u_recipe_DAO.getU_recipeRankListRecipe7Days();
	}

	// 한달 조회수 기준 상위 30개 가져오기
	@Override
	public List<U_recipe_meta_VO> getU_recipeRankListRecipe1Month() {
		return u_recipe_DAO.getU_recipeRankListRecipe1Month();
	}

	@Override
	public List<U_recipe_meta_VO> getSearch(Map<String, String> map) {
		return u_recipe_DAO.getSearch(map);
	}

	// 조회수 상승
	@Override
	public int getHitUp(String rcp_idx, String m_idx) {
		return u_recipe_DAO.getHitUp(rcp_idx, m_idx);
	}
	
	// 레시피 글쓰기
	@Override
	public int getWrite(U_recipe_VO uvo) {
		return u_recipe_DAO.getWrite(uvo);
	}
}
