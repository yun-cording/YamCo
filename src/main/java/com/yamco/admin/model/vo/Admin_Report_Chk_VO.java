package com.yamco.admin.model.vo;

public class Admin_Report_Chk_VO {
	private String r_idx, m_idx, c_idx, rcp_idx, r_type, r_time, r_replytime, r_reply, r_status , m_id
	, m_nick , u_rcp_title , u_rcp_status, c_contents, c_status , r_answer;
	
	private String recipe_attacknick , recipe_defencenick , comment_attacknick , comment_defencenick; // m_attacknick 신고자 , m_defencenick 피신고자
	
	
	
	// private String
	
	
	public String getR_answer() {
		return r_answer;
	}
	
	public void setR_answer(String r_answer) {
		this.r_answer = r_answer;
	}
	
	public String getRecipe_attacknick() {
		return recipe_attacknick;
	}

	public void setRecipe_attacknick(String recipe_attacknick) {
		this.recipe_attacknick = recipe_attacknick;
	}

	public String getRecipe_defencenick() {
		return recipe_defencenick;
	}

	public void setRecipe_defencenick(String recipe_defencenick) {
		this.recipe_defencenick = recipe_defencenick;
	}

	public String getComment_attacknick() {
		return comment_attacknick;
	}

	public void setComment_attacknick(String comment_attacknick) {
		this.comment_attacknick = comment_attacknick;
	}

	public String getComment_defencenick() {
		return comment_defencenick;
	}

	public void setComment_defencenick(String comment_defencenick) {
		this.comment_defencenick = comment_defencenick;
	}

	public String getU_rcp_status() {
		return u_rcp_status;
	}

	public void setU_rcp_status(String u_rcp_status) {
		this.u_rcp_status = u_rcp_status;
	}

	public String getU_rcp_title() {
		return u_rcp_title;
	}

	public void setU_rcp_title(String u_rcp_title) {
		this.u_rcp_title = u_rcp_title;
	}

	public String getM_nick() {
		return m_nick;
	}

	public void setM_nick(String m_nick) {
		this.m_nick = m_nick;
	}

	public String getM_id() {
		return m_id;
	}

	public void setM_id(String m_id) {
		this.m_id = m_id;
	}

	public String getR_idx() {
		return r_idx;
	}

	public void setR_idx(String r_idx) {
		this.r_idx = r_idx;
	}

	public String getM_idx() {
		return m_idx;
	}

	public void setM_idx(String m_idx) {
		this.m_idx = m_idx;
	}

	public String getC_idx() {
		return c_idx;
	}

	public void setC_idx(String c_idx) {
		this.c_idx = c_idx;
	}

	public String getRcp_idx() {
		return rcp_idx;
	}

	public void setRcp_idx(String rcp_idx) {
		this.rcp_idx = rcp_idx;
	}

	public String getR_type() {
		return r_type;
	}

	public void setR_type(String r_type) {
		this.r_type = r_type;
	}

	public String getR_time() {
		return r_time;
	}

	public void setR_time(String r_time) {
		this.r_time = r_time;
	}

	public String getR_replytime() {
		return r_replytime;
	}

	public void setR_replytime(String r_replytime) {
		this.r_replytime = r_replytime;
	}

	public String getR_reply() {
		return r_reply;
	}

	public void setR_reply(String r_reply) {
		this.r_reply = r_reply;
	}

	public String getR_status() {
		return r_status;
	}

	public void setR_status(String r_status) {
		this.r_status = r_status;
	}

	public String getC_contents() {
		return c_contents;
	}

	public void setC_contents(String c_contents) {
		this.c_contents = c_contents;
	}

	public String getC_status() {
		return c_status;
	}

	public void setC_status(String c_status) {
		this.c_status = c_status;
	}
}
