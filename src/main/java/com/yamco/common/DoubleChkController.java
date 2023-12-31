package com.yamco.common;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.yamco.user.model.service.Member_Service;
import com.yamco.user.model.service.U_recipe_Service;
import com.yamco.user.model.vo.Member_VO;
import com.yamco.user.model.vo.U_recipe_VO;

@RestController
public class DoubleChkController{
	@Autowired
	private U_recipe_Service u_recipe_Service;
	
	@Autowired
	private Member_Service member_Service;
	
	public DoubleChkController(Member_Service member_Service) {
		this.member_Service = member_Service;
	}
	@RequestMapping(value = "/go_memberIdChk.do" , produces = "text/plain; charset=utf-8")
	@ResponseBody
	public String getMemberIdChk(@RequestParam("m_id")String m_id, Member_VO mvo) {
		int result = 1;
		mvo.setM_id(m_id);
		Member_VO m_vo = member_Service.getMemberLogin(mvo);
		if(m_id != null && m_id.length() > 0) {
			if(m_vo != null) {
				if(m_vo.getM_out_date() != null) {
				result = -1;
				}else {
					result = member_Service.getMemberIdChk(m_id);
					}
			}else {
				result = -2;
			}
		}
		return String.valueOf(result);
	}
	
	// 성훈 레시피 임시저장 레시피 확인
		@RequestMapping("/limit_recipe_chk.do")
		public String limit_recipe_writeChk(HttpSession session) {
			String m_idx = (String) session.getAttribute("m_idx");
				U_recipe_VO urvo = u_recipe_Service.getLimit_recipe(m_idx); // 임시저장 게시글의 수 조회
				String result = "";
				if(urvo != null) { //임시 저장 게시글이 있을경우
					result = "yes";
					return result;
				}else { // 임시 저장 게시글이 없는 경우
					result = "pass";
					return result;
				}
		}	
	
}