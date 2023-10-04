package com.yamco.user.model.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.yamco.user.model.vo.Comment_VO;
import com.yamco.user.model.vo.Comment_meta_VO;

@Repository
public class Comment_DAO {
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;

	// 댓글 작성
	public int comment_write(Comment_VO cvo) {
		return sqlSessionTemplate.insert("comment.comment_write", cvo);
	}

	// 댓글 좋아요
	public int comment_like(String c_idx) {
		return sqlSessionTemplate.insert("comment.comment_like", c_idx);
	}
	
	//댓글 조회
	public List<Comment_meta_VO> getSelectList(Comment_VO cvo) {
		return sqlSessionTemplate.selectList("comment.selectListByVO", cvo);
	}
	
	// 댓글 하나 선택
	public Comment_meta_VO getOneComment(String c_idx) {
		return sqlSessionTemplate.selectOne("comment.getOneComment", c_idx);
	}
	
	// 상우 댓글 수정
	@Transactional
	public int comment_revision(String newText, String c_idx) {
		Map<String, String> comment_Map = new HashMap<String, String>();
		comment_Map.put("newText", newText);
	    comment_Map.put("c_idx", c_idx);
		int result = 0;
		result = sqlSessionTemplate.update("comment.comment_revision", comment_Map);
		return result;
	}
	
	// 상우 댓글 삭제
	// commit 있는 경우 아래 Component 추가
	@Transactional
	public int comment_delete(String c_idx) {
		int result = 0;
		result = sqlSessionTemplate.delete("comment.comment_delete", c_idx);
		return result;
	}
	
	// 댓글 좋아요했는지 여부 첵
	public int comment_likedornot(String c_idx, String m_idx) {
		Map<String, String> comment_likeornot_map = new HashMap<String, String>();
		comment_likeornot_map.put("c_idx", c_idx);
		comment_likeornot_map.put("m_idx", m_idx);
		int result = 0;
		// delete 쓰면 틀린다!
		result = sqlSessionTemplate.selectOne("comment.comment_likedornot", comment_likeornot_map);
		return result;
	}
	
	public int insertOrUpdateCommentLike(String c_idx, String m_idx, String liked_ornot) {
		Map<String, String> comment_likeornot_map = new HashMap<String, String>();
		comment_likeornot_map.put("c_idx", c_idx);
		comment_likeornot_map.put("m_idx", m_idx);
		comment_likeornot_map.put("liked_ornot", liked_ornot);
		int result = 0;
		// delete 쓰면 틀린다!
		if (liked_ornot.equals("0")) {
			result = sqlSessionTemplate.update("comment.insertCommentLike", comment_likeornot_map);
			sqlSessionTemplate.insert("comment.comment_like", c_idx);

		}else if (liked_ornot.equals("1")) {
			result = sqlSessionTemplate.update("comment.deleteCommentLike", comment_likeornot_map);
			// c_like를 하나 내리자 걍
			sqlSessionTemplate.update("comment.comment_like_down", c_idx);

		}
		return result;
	}
}
