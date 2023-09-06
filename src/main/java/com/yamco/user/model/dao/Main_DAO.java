package com.yamco.user.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.yamco.user.model.vo.Member_meta_VO;
import com.yamco.user.model.vo.U_recipe_meta_VO;

@Repository
public class Main_DAO {
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;

	public List<U_recipe_meta_VO> getUsertrendList() {
		return sqlSessionTemplate.selectList("u_recipe.maintrendlist") ;
	}

	public List<U_recipe_meta_VO> getbestList() {
		return sqlSessionTemplate.selectList("u_recipe.bestList7Days") ;
	}
	
	// 명예의 전당 3명 가져오기
		public List<Member_meta_VO> getmainAwardList() {
			return sqlSessionTemplate.selectList("member.mainAwardList");
	}
	
}
