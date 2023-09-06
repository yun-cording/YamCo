package com.yamco.user.model.service;

import java.util.List;

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
}
