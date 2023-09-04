package com.yamco.api.model.service;

import java.util.List;

import com.fasterxml.jackson.databind.JsonNode;
import com.yamco.api.model.vo.P_recipe_VO;
import com.yamco.user.model.vo.Comment_VO;

public interface P_recipe_Service {
	// TODO 상우
	// 공공레시피 목록 표시 (json 파일에서 가져옴)
	public List<JsonNode> go_public_list();
	
	// DB view 다녀오기
	public List<P_recipe_VO> article_summary();

	public String article_rating(String result);
	
	// DB에서 좋아요한 목록 받아오기
	public String liked_ornot(String m_idx, String rcp_idx);
	
	// DB에서 댓글 전체 받아오기
	public List<Comment_VO> load_comments(String m_nick, String rcp_idx);
	
	// 게시물에 쓴 댓글 전부 불러오기
	public List<Comment_VO> load_all_comments(String rcp_idx);
	
	// TODO 상우 
}
