package com.yamco.common;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.yamco.user.model.service.Member_Service;
import com.yamco.user.model.service.U_recipe_Service;
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
	public String getMemberIdChk(@RequestParam("m_id")String m_id) {
		int result = 1;
		if(m_id != null && m_id.length() > 0) {
			result = member_Service.getMemberIdChk(m_id);
		}
		return String.valueOf(result);
	}
	
	// 성훈 레시피 임시저장 레시피 확인
		@RequestMapping("/limit_recipe_chk.do")
		public String limit_recipe_writeChk(HttpSession session) {
			String m_idx = (String) session.getAttribute("m_idx");
			System.out.println("m_idx : " + m_idx);
				U_recipe_VO urvo = u_recipe_Service.getLimit_recipe(m_idx); // 임시저장 게시글의 수 조회
				String result = "";
				if(urvo != null) { //임시 저장 게시글이 있을경우
					System.out.println("임시 저장 게시글 제목: "+ urvo.getU_rcp_title());
					result = "yes";
					System.out.println("컨트롤러1에서 result : " + result);
					return result;
				}else { // 임시 저장 게시글이 없는 경우
					result = "pass";
					System.out.println("컨트롤러1에서 result : " + result);
					return result;
				}
		}	
	
}