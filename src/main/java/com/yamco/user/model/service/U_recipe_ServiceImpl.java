package com.yamco.user.model.service;

import java.util.Iterator;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.fasterxml.jackson.databind.JsonNode;
import com.yamco.api.model.service.P_recipe_Service;
import com.yamco.user.model.dao.U_recipe_DAO;
import com.yamco.user.model.vo.Ref_VO;
import com.yamco.user.model.vo.U_recipe_Search_VO;
import com.yamco.user.model.vo.U_recipe_VO;
import com.yamco.user.model.vo.U_recipe_meta_VO;

@Service
public class U_recipe_ServiceImpl implements U_recipe_Service {
	@Autowired
	private U_recipe_DAO u_recipe_DAO;

	@Autowired
	private P_recipe_Service p_recipe_Service;

	// 일주일 조회수 기준 상위 30개 가져오기
	@Override
	public List<U_recipe_meta_VO> getU_recipeRankListRecipe7Days() {
		List<U_recipe_meta_VO> result = u_recipe_DAO.getU_recipeRankListRecipe7Days();

		// 공공데이터에서 레시피 제목, 레시피 이미지 가져오기
		for (Iterator<U_recipe_meta_VO> iterator = result.iterator(); iterator.hasNext();) {
			U_recipe_meta_VO urmvo = (U_recipe_meta_VO) iterator.next();
			String rcp_seq = urmvo.getRcp_idx();
			// 게시글이 공공데이터일 경우 parsing
			if (Integer.parseInt(rcp_seq) < 10000) {
				urmvo.setM_nick("공공레시피 제공");

				// TODO 공공데이터 시작
				List<JsonNode> rowList = p_recipe_Service.go_public_list();
				for (int i = 0; i < rowList.size(); i++) {
					JsonNode node = rowList.get(i);
					String node_rcpSeq = node.get("RCP_SEQ").asText();
					if (rcp_seq.equals(node_rcpSeq)) {
						String node_rcpNm = node.get("RCP_NM").asText();
						String attFileNoMain = node.get("ATT_FILE_NO_MAIN").asText();
						urmvo.setU_rcp_title(node_rcpNm);
						urmvo.setU_rcp_img(attFileNoMain);
					}
				}
				// TODO 공공데이터 끝
			}
		}

		return result;
	}

	// 한달 조회수 기준 상위 30개 가져오기
	@Override
	public List<U_recipe_meta_VO> getU_recipeRankListRecipe1Month() {
		List<U_recipe_meta_VO> result = u_recipe_DAO.getU_recipeRankListRecipe1Month();

		// 공공데이터에서 레시피 제목, 레시피 이미지 가져오기
		for (Iterator<U_recipe_meta_VO> iterator = result.iterator(); iterator.hasNext();) {
			U_recipe_meta_VO urmvo = (U_recipe_meta_VO) iterator.next();
			String rcp_seq = urmvo.getRcp_idx();
			// 게시글이 공공데이터일 경우 parsing
			if (Integer.parseInt(rcp_seq) < 10000) {
				urmvo.setM_nick("공공레시피 제공");

				// TODO 공공데이터 시작
				List<JsonNode> rowList = p_recipe_Service.go_public_list();
				for (int i = 0; i < rowList.size(); i++) {
					JsonNode node = rowList.get(i);
					String node_rcpSeq = node.get("RCP_SEQ").asText();
					if (rcp_seq.equals(node_rcpSeq)) {
						String node_rcpNm = node.get("RCP_NM").asText();
						String attFileNoMain = node.get("ATT_FILE_NO_MAIN").asText();
						urmvo.setU_rcp_title(node_rcpNm);
						urmvo.setU_rcp_img(attFileNoMain);
					}
				}
				// TODO 공공데이터 끝
			}
		}

		return result;
	}

	@Override
	public List<U_recipe_meta_VO> getSearch(Map<String, String> map, String m_idx) {
		return u_recipe_DAO.getSearch(map, m_idx);
	}

	// rcp_idx를 포함한 U_recipe_VO로 U_recipe_meta_VO 검색
	@Override
	public U_recipe_meta_VO getSelectOne(U_recipe_VO urvo) {
		return u_recipe_DAO.getSelectOne(urvo);
	}

	// U_recipe_VO로 U_recipe_meta_VO 검색
	@Override
	public List<U_recipe_meta_VO> getSelectList(U_recipe_VO urvo) {
		return u_recipe_DAO.getSelectList(urvo);
	}

	// U_recipe_Search_VO로 U_recipe_meta_VO 검색
	@Override
	public List<U_recipe_meta_VO> getSelectList(U_recipe_Search_VO ursvo) {
		return u_recipe_DAO.getSelectList(ursvo);
	}

	// rcp_idx로 U_recipe_meta_VO 검색
	@Override
	public U_recipe_meta_VO getSelectOne(String rcp_idx) {
		return u_recipe_DAO.getSelectOne(rcp_idx);
	}

	// 조회수 상승
	@Override
	public int getHitUp(String rcp_idx, String m_idx) {
		return u_recipe_DAO.getHitUp(rcp_idx, m_idx);
	}
	
	// 레시피 글쓰기
	@Override
	public int getWrite(U_recipe_VO uvo) {
		return u_recipe_DAO.getWrite(uvo);
	}
	
	// 임시저장된 레시피 수 조회
	@Override
	public U_recipe_VO getLimit_recipe(String m_idx) {
		return u_recipe_DAO.getLimit_recipe(m_idx);
	}
	
	// 성훈 임시저장된 레시피 삭제
	@Override
	public int deleteRecipe(String m_idx) {
		return u_recipe_DAO.deleteRecipe(m_idx);
	}
	
	// 재훈 냉장고 검색
	@Override
	public List<U_recipe_meta_VO> getRefSearch(Ref_VO rfvo) {
		return u_recipe_DAO.getRefSearch(rfvo);
	}

}
