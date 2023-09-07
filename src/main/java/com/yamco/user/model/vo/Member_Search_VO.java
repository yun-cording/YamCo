package com.yamco.user.model.vo;

import java.util.ArrayList;

public class Member_Search_VO {
	private String m_idx, m_id, m_pw, m_phone, m_gender, m_birthday, m_nick, m_regdate, m_status, m_fail_count,
			m_out_date, m_login_type, m_token, m_t_time, m_image;
	private String like_id, like_phone, like_birthday, like_nick;
	private String regdate_start, regdate_end, out_date_start, out_date_end;
	private String keyword_category, keyword_type, keyword, period_category, start_date, end_date, member_type,
			member_lock, member_state;
	private ArrayList<String> stateArr;

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

	public String getM_regdate() {
		return m_regdate;
	}

	public void setM_regdate(String m_regdate) {
		this.m_regdate = m_regdate;
	}

	public String getM_status() {
		return m_status;
	}

	public void setM_status(String m_status) {
		this.m_status = m_status;
	}

	public String getM_fail_count() {
		return m_fail_count;
	}

	public void setM_fail_count(String m_fail_count) {
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

	public String getLike_id() {
		return like_id;
	}

	public void setLike_id(String like_id) {
		this.like_id = like_id;
	}

	public String getLike_phone() {
		return like_phone;
	}

	public void setLike_phone(String like_phone) {
		this.like_phone = like_phone;
	}

	public String getLike_birthday() {
		return like_birthday;
	}

	public void setLike_birthday(String like_birthday) {
		this.like_birthday = like_birthday;
	}

	public String getLike_nick() {
		return like_nick;
	}

	public void setLike_nick(String like_nick) {
		this.like_nick = like_nick;
	}

	public String getRegdate_start() {
		return regdate_start;
	}

	public void setRegdate_start(String regdate_start) {
		this.regdate_start = regdate_start;
	}

	public String getRegdate_end() {
		return regdate_end;
	}

	public void setRegdate_end(String regdate_end) {
		this.regdate_end = regdate_end;
	}

	public String getOut_date_start() {
		return out_date_start;
	}

	public void setOut_date_start(String out_date_start) {
		this.out_date_start = out_date_start;
	}

	public String getOut_date_end() {
		return out_date_end;
	}

	public void setOut_date_end(String out_date_end) {
		this.out_date_end = out_date_end;
	}

	public String getKeyword_category() {
		return keyword_category;
	}

	public void setKeyword_category(String keyword_category) {
		this.keyword_category = keyword_category;
	}

	public String getKeyword_type() {
		return keyword_type;
	}

	public void setKeyword_type(String keyword_type) {
		this.keyword_type = keyword_type;
	}

	public String getKeyword() {
		return keyword;
	}

	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}

	public String getPeriod_category() {
		return period_category;
	}

	public void setPeriod_category(String period_category) {
		this.period_category = period_category;
	}

	public String getStart_date() {
		return start_date;
	}

	public void setStart_date(String start_date) {
		this.start_date = start_date;
	}

	public String getEnd_date() {
		return end_date;
	}

	public void setEnd_date(String end_date) {
		this.end_date = end_date;
	}

	public String getMember_type() {
		return member_type;
	}

	public void setMember_type(String member_type) {
		this.member_type = member_type;
	}

	public String getMember_lock() {
		return member_lock;
	}

	public void setMember_lock(String member_lock) {
		this.member_lock = member_lock;
	}

	public String getMember_state() {
		return member_state;
	}

	public void setMember_state(String member_state) {
		this.member_state = member_state;
	}

	public ArrayList<String> getStateArr() {
		return stateArr;
	}

	public void setStateArr(ArrayList<String> stateArr) {
		this.stateArr = stateArr;
	}
}