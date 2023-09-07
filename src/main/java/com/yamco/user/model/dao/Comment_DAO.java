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
<<<<<<< HEAD
	}
	// 상우 댓글 수정
	@Transactional
	public int comment_revision(String newText, String c_idx) {
		System.out.println("댓글 수정 DAO");
		Map<String, String> comment_Map = new HashMap<String, String>();
		System.out.println("DAO에서 수정 값 : " + newText + c_idx);
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
		System.out.println("댓글 삭제 DAO");
		int result = 0;
		result = sqlSessionTemplate.delete("comment.comment_delete", c_idx);
		return result;
	}
	
	public int comment_likeornot(String c_idx, String m_idx) {
		System.out.println("댓글 좋아요 했는가 DAO");
		System.out.println(c_idx + "c_idx다");
		System.out.println(m_idx + "m_idx다");
		Map<String, String> comment_likeornot_map = new HashMap<String, String>();
		comment_likeornot_map.put("c_idx", c_idx);
		comment_likeornot_map.put("m_idx", m_idx);
		int result = 0;
		// delete 쓰면 틀린다!
		result = sqlSessionTemplate.selectOne("comment.comment_likeornot", comment_likeornot_map);
		System.out.println("좋아요 검사 DAO에서는 " + result);
		return result;
	}
	
	public int insertOrUpdateCommentLike(String c_idx, String m_idx, String liked_ornot) {
		System.out.println("댓글 좋아요 확인후 insert나 delete DAO");
		System.out.println(c_idx + "c_idx다");
		System.out.println(m_idx + "m_idx다");
		System.out.println(liked_ornot + "DAO liked_ornot다");
		Map<String, String> comment_likeornot_map = new HashMap<String, String>();
		comment_likeornot_map.put("c_idx", c_idx);
		comment_likeornot_map.put("m_idx", m_idx);
		comment_likeornot_map.put("liked_ornot", liked_ornot);
		int result = 0;
		// delete 쓰면 틀린다!
		result = sqlSessionTemplate.update("comment.insertOrUpdateCommentLike", comment_likeornot_map);
		return result;
=======
>>>>>>> refs/heads/master
	}
}
