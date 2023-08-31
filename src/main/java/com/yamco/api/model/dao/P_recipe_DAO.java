package com.yamco.api.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.yamco.api.model.vo.P_recipe_VO;

@Repository
public class P_recipe_DAO {
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	// view에서 게시물 평점, 댓글수, 조회수 받아오기
	public List<P_recipe_VO> article_summary() {
		return sqlSessionTemplate.selectList("p_recipe.article_summary");
	}
}
