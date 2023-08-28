package com.yamco.user.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.yamco.user.model.vo.Member_VO;

@Repository
public class Member_DAO {
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	// 자체 회원가입
	public int getMemberJoin(Member_VO mvo) {
		return sqlSessionTemplate.insert("member.join", mvo);
	}
	
	// 멤버 전체보기
	public List<Member_VO> getMemberList(){
		return sqlSessionTemplate.selectList("member.list");
	}
}
