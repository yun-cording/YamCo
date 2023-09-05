package com.yamco.user.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

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
	
	//댓글 조회
	public List<Comment_meta_VO> getSelectList(Comment_VO cvo) {
		return sqlSessionTemplate.selectList("comment.selectListByVO", cvo);
	}
}