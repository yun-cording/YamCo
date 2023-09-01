package com.yamco.api.model.service;

import java.io.File;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletContext;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.yamco.api.model.dao.P_recipe_DAO;
import com.yamco.api.model.vo.P_recipe_VO;
import com.yamco.user.model.vo.Comment_VO;

@Service
public class P_recipe_ServiceImpl implements P_recipe_Service {
	@Autowired
	private P_recipe_DAO p_recipe_DAO;
	
	// Autowired 안해도 되는 부분 체크! (servletContext)
	@Autowired
    private ServletContext servletContext;
		
	public List<P_recipe_VO> article_summary() {
		return (List<P_recipe_VO>) p_recipe_DAO.article_summary();
	}
	
	// json 파일 읽어서 목록 띄우기
	public List<JsonNode> go_public_list(){
	//	최근본레시피 용
	//	jsp에서 rcp_idx, u_idx(idx), 썸네일용 main 어쩌구 이미지(src), 
	//	카테고리(cate), 작성자(writer) => 공공데이터는 writer를 "냠냠레시피"
	//	세션추가만??? 
		
	//    // JsonNode는 JSON 데이터의 노드를 나타내는 클래스로, 직접적으로 데이터 클래스의 역할을 대신할 수 없습니다.
		 try {
	            ObjectMapper objectMapper = new ObjectMapper();
	            File jsonFile = new File(servletContext.getRealPath("/resources/data/api_data.json"));
	
	            // File jsonFile = new File("src\\main\\webapp\\resources\\data\\api_data.json"); // JSON 파일 경로
	            // src/main/webapp 안의 리소스 폴더는 웹 애플리케이션 컨텍스트 경로의 일부이기 때문에 상대경로로 
	            // 직접 참조할 수 없습니다. 대신 ServletContext를 사용하여 리소스에 접근해야 합니다.
	
	            JsonNode rootNode = objectMapper.readTree(jsonFile);
	            
	            // JSON 파일의 rootNode(최상위 노드)가 존재하고, 객체인지 확인
	            if (rootNode != null && rootNode.isObject()) {
	            	// row 안의 자료들 전체를 담음
	    	    	JsonNode recipeDataNode = rootNode.path("COOKRCP01").path("row");
	    	    	System.out.println(recipeDataNode.isNull());
	    	    	// 전체 자료 출력
	    	    	// System.out.println(recipeDataNode);
	    	    	// 자료형은 ArrayNode임
//	    	    	System.out.println("자료형은 : " + recipeDataNode.getClass().getName());
	    	    	List<JsonNode> rowList = new ArrayList<>();
	    	    	
	    	    	// 키와 값은 따로 담기지 않고, JSON 데이터의 구조를 유지한 채로 처리하는 부분
	    	    	if (recipeDataNode != null) {
	    	    	    Iterator<JsonNode> iterator = recipeDataNode.elements();
	    	    	    while (iterator.hasNext()) {
	    	    	        JsonNode recipeNode = iterator.next();
	    	    	        rowList.add(recipeNode);
	    	    	    }
	    	    	}
	    	    	return rowList;
	    	    	
	            }
		 }catch (Exception e) {
			System.out.println(e);
			return null;
		}
		 return null;
	}
	
	// DB 가서 평점 받기
	public String article_rating(String rcpSeq) {
		return p_recipe_DAO.article_rating(rcpSeq);
	}
	
	// 세션에서 m_idx 받아오기
	// 1. 해당 m_idx가 이 게시물을 좋아요했는지 확인
	// DB에서 좋아요한 목록 받아오기
	public String liked_ornot(String m_idx, String rcp_idx) {	
		return p_recipe_DAO.liked_ornot(m_idx, rcp_idx);
	}
	
	public List<Comment_VO> load_comments(String m_nick, String rcp_idx){
		return p_recipe_DAO.load_comments(m_nick, rcp_idx);
	}
	
	// 게시물에 쓴 댓글 전부 불러오기
	public List<Comment_VO> load_all_comments(String rcp_idx){
		return p_recipe_DAO.load_all_comments(rcp_idx);
	}
}
