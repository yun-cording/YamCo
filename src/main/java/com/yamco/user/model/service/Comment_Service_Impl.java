package com.yamco.user.model.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yamco.user.model.dao.Comment_DAO;
import com.yamco.user.model.vo.Comment_VO;
import com.yamco.user.model.vo.Comment_meta_VO;

@Service
public class Comment_Service_Impl implements Comment_Service {
	@Autowired
	private Comment_DAO comment_DAO;
	
	//댓글 조회
	public List<Comment_meta_VO> getSelectList(Comment_VO cvo) {
		return comment_DAO.getSelectList(cvo);
	}
	// 댓글 하나 받아오기
	public Comment_meta_VO getOneComment(String c_idx) {
		return comment_DAO.getOneComment(c_idx);
	}
	// 상우 댓글 수정
	public int comment_revision(String newText, String c_idx) {
		return comment_DAO.comment_revision(newText, c_idx);
	}
	// 상우 댓글 삭제
	public int comment_delete(String c_idx) {
		return comment_DAO.comment_delete(c_idx);
	}
	// 상우 댓글 좋아요했는가
	public int comment_likedornot(String c_idx, String m_idx) {
		return comment_DAO.comment_likedornot(c_idx, m_idx);
	}
	// 확인 후 insert 혹은 delete
	public int insertOrUpdateCommentLike(String c_idx, String m_idx, String liked_ornot) {
		return comment_DAO.insertOrUpdateCommentLike(c_idx, m_idx, liked_ornot);
	}
}
