package com.yamco.user.model.vo;

import org.springframework.web.multipart.MultipartFile;

public class U_recipe_VO {
	private String rcp_idx, m_idx, u_rcp_title, u_rcp_comment, u_rcp_category, u_rcp_ing, u_rcp_main, u_rcp_level,
	u_rcp_keyword, u_rcp_blind, m_nick, u_rcp_status, u_rcp_hit, u_rcp_ctype, u_rcp_time, u_rcp_img;
	
	//성훈 필요 추가
	private String u_rcp_category1 , u_rcp_category2 , u_rcp_keyword1 , u_rcp_keyword2 , u_rcp_tip;
	private MultipartFile s_file; // 서머노트 용
	
	public MultipartFile getS_file() {
		return s_file;
	}

	public void setS_file(MultipartFile s_file) {
		this.s_file = s_file;
	}// 서머노트 용도
	
	public String getU_rcp_tip() {
		return u_rcp_tip;
	}

	public void setU_rcp_tip(String u_rcp_tip) {
		this.u_rcp_tip = u_rcp_tip;
	}

	public String getRcp_idx() {
		return rcp_idx;
	}

	public void setRcp_idx(String rcp_idx) {
		this.rcp_idx = rcp_idx;
	}

	public String getM_idx() {
		return m_idx;
	}

	public void setM_idx(String m_idx) {
		this.m_idx = m_idx;
	}

	public String getU_rcp_title() {
		return u_rcp_title;
	}

	public void setU_rcp_title(String u_rcp_title) {
		this.u_rcp_title = u_rcp_title;
	}

	public String getU_rcp_comment() {
		return u_rcp_comment;
	}

	public void setU_rcp_comment(String u_rcp_comment) {
		this.u_rcp_comment = u_rcp_comment;
	}

	public String getU_rcp_category() {
		return u_rcp_category;
	}

	public void setU_rcp_category(String u_rcp_category) {
		this.u_rcp_category = u_rcp_category;
	}

	public String getU_rcp_ing() {
		return u_rcp_ing;
	}

	public void setU_rcp_ing(String u_rcp_ing) {
		this.u_rcp_ing = u_rcp_ing;
	}

	public String getU_rcp_main() {
		return u_rcp_main;
	}

	public void setU_rcp_main(String u_rcp_main) {
		this.u_rcp_main = u_rcp_main;
	}

	public String getU_rcp_level() {
		return u_rcp_level;
	}

	public void setU_rcp_level(String u_rcp_level) {
		this.u_rcp_level = u_rcp_level;
	}

	public String getU_rcp_keyword() {
		return u_rcp_keyword;
	}

	public void setU_rcp_keyword(String u_rcp_keyword) {
		this.u_rcp_keyword = u_rcp_keyword;
	}

	public String getU_rcp_blind() {
		return u_rcp_blind;
	}

	public void setU_rcp_blind(String u_rcp_blind) {
		this.u_rcp_blind = u_rcp_blind;
	}

	public String getM_nick() {
		return m_nick;
	}

	public void setM_nick(String m_nick) {
		this.m_nick = m_nick;
	}

	public String getU_rcp_status() {
		return u_rcp_status;
	}

	public void setU_rcp_status(String u_rcp_status) {
		this.u_rcp_status = u_rcp_status;
	}

	public String getU_rcp_hit() {
		return u_rcp_hit;
	}

	public void setU_rcp_hit(String u_rcp_hit) {
		this.u_rcp_hit = u_rcp_hit;
	}

	public String getU_rcp_ctype() {
		return u_rcp_ctype;
	}

	public void setU_rcp_ctype(String u_rcp_ctype) {
		this.u_rcp_ctype = u_rcp_ctype;
	}

	public String getU_rcp_time() {
		return u_rcp_time;
	}

	public void setU_rcp_time(String u_rcp_time) {
		this.u_rcp_time = u_rcp_time;
	}

	public String getU_rcp_img() {
		return u_rcp_img;
	}

	public void setU_rcp_img(String u_rcp_img) {
		this.u_rcp_img = u_rcp_img;
	}

	public String getU_rcp_category1() {
		return u_rcp_category1;
	}

	public void setU_rcp_category1(String u_rcp_category1) {
		this.u_rcp_category1 = u_rcp_category1;
	}

	public String getU_rcp_category2() {
		return u_rcp_category2;
	}

	public void setU_rcp_category2(String u_rcp_category2) {
		this.u_rcp_category2 = u_rcp_category2;
	}

	public String getU_rcp_keyword1() {
		return u_rcp_keyword1;
	}

	public void setU_rcp_keyword1(String u_rcp_keyword1) {
		this.u_rcp_keyword1 = u_rcp_keyword1;
	}

	public String getU_rcp_keyword2() {
		return u_rcp_keyword2;
	}

	public void setU_rcp_keyword2(String u_rcp_keyword2) {
		this.u_rcp_keyword2 = u_rcp_keyword2;
	}
		
	
}
