package com.yamco.admin.model.vo;

import org.springframework.stereotype.Repository;

@Repository
public class Admin_Report_VO {
	private String c_idx, count, rcp_idx, u_rcp_title, c_contents, m_nick;

	public final String getC_idx() {
		return c_idx;
	}

	public final void setC_idx(String c_idx) {
		this.c_idx = c_idx;
	}

	public final String getCount() {
		return count;
	}

	public final void setCount(String count) {
		this.count = count;
	}

	public final String getRcp_idx() {
		return rcp_idx;
	}

	public final void setRcp_idx(String rcp_idx) {
		this.rcp_idx = rcp_idx;
	}

	public final String getU_rcp_title() {
		return u_rcp_title;
	}

	public final void setU_rcp_title(String u_rcp_title) {
		this.u_rcp_title = u_rcp_title;
	}

	public final String getC_contents() {
		return c_contents;
	}

	public final void setC_contents(String c_contents) {
		this.c_contents = c_contents;
	}

	public final String getM_nick() {
		return m_nick;
	}

	public final void setM_nick(String m_nick) {
		this.m_nick = m_nick;
	}

}
