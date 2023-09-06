package com.yamco.user.model.service;

import java.util.List;

import com.yamco.user.model.vo.Comment_VO;
import com.yamco.user.model.vo.Comment_meta_VO;

public interface Comment_Service {
	//댓글 조회
	public List<Comment_meta_VO> getSelectList(Comment_VO cvo);
}
