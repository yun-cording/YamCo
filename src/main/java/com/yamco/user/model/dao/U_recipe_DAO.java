package com.yamco.user.model.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.datasource.DataSourceTransactionManager;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.TransactionDefinition;
import org.springframework.transaction.TransactionStatus;
import org.springframework.transaction.support.DefaultTransactionDefinition;

import com.yamco.user.model.vo.U_recipe_VO;
import com.yamco.user.model.vo.U_recipe_meta_VO;
import com.yamco.user.model.vo.User_log_VO;

@Repository
public class U_recipe_DAO {
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;

	@Autowired
	private DataSourceTransactionManager transactionManager;

	// 일주일 조회수 기준 상위 30개 가져오기
	public List<U_recipe_meta_VO> getU_recipeRankListRecipe7Days() {
		return sqlSessionTemplate.selectList("u_recipe.rankListRecipe7Days");
	}

	// 한달 조회수 기준 상위 30개 가져오기
	public List<U_recipe_meta_VO> getU_recipeRankListRecipe1Month() {
		return sqlSessionTemplate.selectList("u_recipe.rankListRecipe1Month");
	}

	public List<U_recipe_meta_VO> getSearch(Map<String, String> map, String m_idx) {
		User_log_VO ulvo = new User_log_VO();
		ulvo.setS_name(map.get("search"));

		if (m_idx != null && !m_idx.isBlank()) {
			ulvo.setM_idx(m_idx);
		}
		ulvo.setUl_status("2"); // 2 : 검색

		sqlSessionTemplate.insert("user_log.insert", ulvo);

		return sqlSessionTemplate.selectList("u_recipe.recipeSearch", map);
	}

	public U_recipe_meta_VO getSearchData(String rcp_idx) {
		return sqlSessionTemplate.selectOne("u_recipe.metaData", rcp_idx);
	}

	// rcp_idx를 포함한 U_recipe_VO로 U_recipe_meta_VO 검색
	public U_recipe_meta_VO getSelectOne(U_recipe_VO urvo) {
		return sqlSessionTemplate.selectOne("u_recipe.selectOneByVO", urvo);
	}

	// rcp_idx로 U_recipe_meta_VO 검색
	public U_recipe_meta_VO getSelectOne(String rcp_idx) {
		return sqlSessionTemplate.selectOne("u_recipe.metaData", rcp_idx);
	}

	// 조회수 상승
	public int getHitUp(String rcp_idx, String m_idx) {
		// 트랜잭션 처리
		int result = 0;
		TransactionDefinition def = new DefaultTransactionDefinition();
		TransactionStatus status = transactionManager.getTransaction(def);

		try {
			result += sqlSessionTemplate.update("u_recipe.hitUp", rcp_idx);
			User_log_VO ulvo = new User_log_VO();
			ulvo.setRcp_idx(rcp_idx);
			if (m_idx != null && !m_idx.isBlank()) {
				ulvo.setM_idx(m_idx);
			}
			ulvo.setUl_status("3"); // 3 : 조회
			result += sqlSessionTemplate.insert("user_log.insert", ulvo);
			transactionManager.commit(status);
		} catch (Exception e) {
			e.printStackTrace();
			transactionManager.rollback(status);
		}

		return result;
	}

}
