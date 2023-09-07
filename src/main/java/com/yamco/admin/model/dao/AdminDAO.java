package com.yamco.admin.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.yamco.admin.model.vo.Admin_Dash_VO;
import com.yamco.admin.model.vo.Member_count_summary_VO;
@Repository
public class AdminDAO {
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;

	public Admin_Dash_VO getDashTop() {
		Admin_Dash_VO dash_VO = new Admin_Dash_VO();
		String total_hit = sqlSessionTemplate.selectOne("admin.totalHit");
		String total_visit="아직 못했음";
		String client_new = sqlSessionTemplate.selectOne("admin.clientNew");
		String recipe_new = sqlSessionTemplate.selectOne("admin.recipeNew");
		dash_VO.setRecipe_new(recipe_new);
		dash_VO.setTotal_hit(total_hit);
		dash_VO.setClient_new(client_new);
		dash_VO.setTotal_visit(total_visit);
		
		return dash_VO;
	}

	public Member_count_summary_VO getMemberCountSummary() {
		return sqlSessionTemplate.selectOne("admin.memberCountSummary");
	}
}
