package com.yamco.user.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.yamco.user.model.vo.U_recipe_meta_VO;

@Repository
public class U_recipe_DAO {
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;

	// 조리법 랭킹 리스트 가져오기
	public List<U_recipe_meta_VO> getU_recipeRankListRecipe() {
		return sqlSessionTemplate.selectList("u_recipe.rankListRecipe");
	}

	public List<String> getSearch(String search_text) {
		return sqlSessionTemplate.selectList("u_recipe.recipeSearch", search_text);
	}

	public U_recipe_meta_VO getSearchData(String k) {
		return sqlSessionTemplate.selectOne("u_recipe.metaData", k);
	}
}
