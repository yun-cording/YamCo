package com.yamco.user.model.service;

import java.util.List;

import com.yamco.user.model.vo.Member_meta_VO;
import com.yamco.user.model.vo.U_recipe_meta_VO;

public interface Main_Service {
	public List<U_recipe_meta_VO> getUsertrendList();
	
	public List<U_recipe_meta_VO> getbestList();
	
	public List<Member_meta_VO> getmainAwardList() ;
}
