package com.yamco.user.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.datasource.DataSourceTransactionManager;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.TransactionDefinition;
import org.springframework.transaction.TransactionStatus;
import org.springframework.transaction.support.DefaultTransactionDefinition;

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

	public List<String> getSearch(String search_text) {
		return sqlSessionTemplate.selectList("u_recipe.recipeSearch", search_text);
	}

	public U_recipe_meta_VO getSearchData(String rcp_idx) {
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
			System.out.println("조회수 상승 성공");
			User_log_VO ulvo = new User_log_VO();
			ulvo.setRcp_idx(rcp_idx);
			if (m_idx != null && !m_idx.isBlank()) {
				ulvo.setM_idx(m_idx);
			}
			ulvo.setUl_status("3"); // 3 : 조회
			result += sqlSessionTemplate.insert("user_log.insert", ulvo);
			System.out.println("로그 기록 성공");
			transactionManager.commit(status);
		} catch (Exception e) {
			e.printStackTrace();
			transactionManager.rollback(status);
			System.out.println("오류발생, 조회수, 로그 취소");
		}

		return result;
	}
}
