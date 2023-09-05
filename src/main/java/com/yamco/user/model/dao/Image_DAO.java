package com.yamco.user.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.yamco.user.model.vo.Notice_VO;

@Repository
public class Image_DAO {
	
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;

	public List<Notice_VO> getNoticeList() {
		return sqlSessionTemplate.selectList("random.noticelist") ;
	}

	
}
