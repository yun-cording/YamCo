package com.yamco.user.model.vo;

public class Member_meta_VO {
	private String m_idx, m_id, m_pw, m_phone, m_gender, m_birthday, m_nick, m_regdate, m_status, m_out_date,
			m_login_type, m_token, m_t_time, m_image;
	private String tot_hit_1mon, max_hit_1mon_rcp_idx;

	private int m_fail_count;

	public String getM_regdate() {
		return m_regdate;
	}

	public void setM_regdate(String m_regdate) {
		this.m_regdate = m_regdate;
	}

	public String getM_idx() {
		return m_idx;
	}

	public void setM_idx(String m_idx) {
		this.m_idx = m_idx;
	}

	public String getM_id() {
		return m_id;
	}

	public void setM_id(String m_id) {
		this.m_id = m_id;
	}

	public String getM_pw() {
		return m_pw;
	}

	public void setM_pw(String m_pw) {
		this.m_pw = m_pw;
	}

	public String getM_phone() {
		return m_phone;
	}

	public void setM_phone(String m_phone) {
		this.m_phone = m_phone;
	}

	public String getM_gender() {
		return m_gender;
	}

	public void setM_gender(String m_gender) {
		this.m_gender = m_gender;
	}

	public String getM_birthday() {
		return m_birthday;
	}

	public void setM_birthday(String m_birthday) {
		this.m_birthday = m_birthday;
	}

	public String getM_nick() {
		return m_nick;
	}

	public void setM_nick(String m_nick) {
		this.m_nick = m_nick;
	}

	public String getM_status() {
		return m_status;
	}

	public void setM_status(String m_status) {
		this.m_status = m_status;
	}

	public int getM_fail_count() {
		return m_fail_count;
	}

	public void setM_fail_count(int m_fail_count) {
		this.m_fail_count = m_fail_count;
	}

	public String getM_out_date() {
		return m_out_date;
	}

	public void setM_out_date(String m_out_date) {
		this.m_out_date = m_out_date;
	}

	public String getM_login_type() {
		return m_login_type;
	}

	public void setM_login_type(String m_login_type) {
		this.m_login_type = m_login_type;
	}

	public String getM_token() {
		return m_token;
	}

	public void setM_token(String m_token) {
		this.m_token = m_token;
	}

	public String getM_t_time() {
		return m_t_time;
	}

	public void setM_t_time(String m_t_time) {
		this.m_t_time = m_t_time;
	}

	public String getM_image() {
		return m_image;
	}

	public void setM_image(String m_image) {
		this.m_image = m_image;
	}

	public String getTot_hit_1mon() {
		return tot_hit_1mon;
	}

	public void setTot_hit_1mon(String tot_hit_1mon) {
		this.tot_hit_1mon = tot_hit_1mon;
	}

	public String getMax_hit_1mon_rcp_idx() {
		return max_hit_1mon_rcp_idx;
	}

	public void setMax_hit_1mon_rcp_idx(String max_hit_1mon_rcp_idx) {
		this.max_hit_1mon_rcp_idx = max_hit_1mon_rcp_idx;
	}
}
