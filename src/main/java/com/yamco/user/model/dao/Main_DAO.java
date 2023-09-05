package com.yamco.user.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.yamco.user.model.vo.U_recipe_meta_VO;

@Repository
public class Main_DAO {
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;

	public List<U_recipe_meta_VO> getUsertrendList() {
		return sqlSessionTemplate.selectList("u_recipe.maintrendlist") ;
	}
	
}
