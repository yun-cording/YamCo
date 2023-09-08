package com.yamco.api.model.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.yamco.api.model.vo.P_recipe_VO;
import com.yamco.user.model.vo.Comment_VO;

@Repository
public class P_recipe_DAO {
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;

	// view에서 게시물 평점, 댓글수, 조회수 받아오기
	public List<P_recipe_VO> article_summary() {
		return sqlSessionTemplate.selectList("p_recipe.article_summary");
	}

	// view에서 상세게시물 평점 받아오기
	public String article_rating(String rcp_idx) {
		return sqlSessionTemplate.selectOne("p_recipe.article_rating", rcp_idx);
	}
	// DB에서 좋아요한 목록 받아오기
//	public List<String> liked_ornot(String m_idx) {
//		return sqlSessionTemplate.selectOne("p_recipe.liked_ornot", m_idx);
//	}

	public String liked_ornot(String m_idx, String rcp_idx) {
		String result = "0";
		
		if (m_idx != null && m_idx.isEmpty()) {
			Map<String, String> map = new HashMap<String, String>();
			map.put("m_idx", m_idx);
			map.put("rcp_idx", rcp_idx);

			result = sqlSessionTemplate.selectOne("p_recipe.liked_ornot", map);
			if (result != null && !result.isBlank()) {
				sqlSessionTemplate.delete("p_recipe.liked_uncheck", map);
			} else {
				sqlSessionTemplate.insert("p_recipe.liked_check", map);
				result = "1";
			}
		}

		return result;
	}

	public List<Comment_VO> load_comments(String m_nick, String rcp_idx) {
		Map<String, String> map = new HashMap<String, String>();
		map.put("m_nick", m_nick);
		map.put("rcp_idx", rcp_idx);

		return sqlSessionTemplate.selectList("p_recipe.load_comments", map);
	}

	// 게시물에 쓴 댓글 전부 불러오기
	public List<Comment_VO> load_all_comments(String rcp_idx) {
		return sqlSessionTemplate.selectList("p_recipe.load_all_comments", rcp_idx);
	}
}
