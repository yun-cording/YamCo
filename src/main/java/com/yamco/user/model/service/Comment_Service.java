package com.yamco.user.model.service;

import java.util.List;
import java.util.Map;

import com.yamco.user.model.vo.Comment_VO;
import com.yamco.user.model.vo.Comment_meta_VO;

public interface Comment_Service {
	//댓글 조회
	public List<Comment_meta_VO> getSelectList(Comment_VO cvo);
	// 댓글 하나 받아오기
	public Comment_meta_VO getOneComment(String c_idx);
	// 댓글 수정
	public int comment_revision(String newText, String c_idx);
	// 댓글 삭제
	public int comment_delete(String c_idx);
	// 댓글 좋아요했는가
	public int comment_likedornot(String c_idx, String m_idx);
	// 확인 후 insert 혹은 delete
	public int insertOrUpdateCommentLike(String c_idx, String m_idx, String liked_ornot);
}
