package com.yamco.api.model.service;

import java.util.List;

import com.fasterxml.jackson.databind.JsonNode;
import com.yamco.api.model.vo.P_recipe_VO;

public interface P_recipe_Service {
	// TODO 상우
	// 공공레시피 목록 표시 (json 파일에서 가져옴)
	public List<JsonNode> go_public_list();
	
	// DB view 다녀오기
	public List<P_recipe_VO> article_summary();

	public String article_rating(String result);
	
	// TODO 상우 
}
