package com.yamco.user.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.yamco.user.model.vo.Random_VO;
import com.yamco.user.model.vo.Random_save_VO;

@Repository
public class Random_DAO {

	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;

	public List<Random_VO> getRandomList() {
		return sqlSessionTemplate.selectList("random.list") ;
	}

	public int getRandomSave(Random_save_VO saveVO) {
		return sqlSessionTemplate.update("random.save", saveVO) ;
	}

	public Random_save_VO getRandomFile() {
		return sqlSessionTemplate.selectOne("random.savelist") ;
		
	}
	
	
}
