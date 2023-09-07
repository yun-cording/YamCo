package com.yamco.user.model.service;

import com.yamco.user.model.vo.Comment_VO;

public interface User_Service {
	// 댓글 작성
	public int comment_write(Comment_VO cvo);
	// 댓글 좋아요
	public int comment_like(String c_idx);
}
