package com.yamco.user.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yamco.user.model.dao.Comment_DAO;
import com.yamco.user.model.vo.Comment_VO;

@Service
public class User_ServiceImpl implements User_Service {
	@Autowired
	private Comment_DAO commentDao;

	@Override
	public int comment_write(Comment_VO cvo) {
		return commentDao.comment_write(cvo);
	}

	@Override
	public int comment_like(String c_idx) {
		return commentDao.comment_like(c_idx);
	}
	
	
}
