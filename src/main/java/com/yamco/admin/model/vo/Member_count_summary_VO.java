package com.yamco.admin.model.vo;

public class Member_count_summary_VO {
	private String total_member, member_type_self, member_type_social, drop_out_member, total_admin, supervisor,
			common_admin;

	public String getTotal_member() {
		return total_member;
	}

	public void setTotal_member(String total_member) {
		this.total_member = total_member;
	}

	public String getMember_type_self() {
		return member_type_self;
	}

	public void setMember_type_self(String member_type_self) {
		this.member_type_self = member_type_self;
	}

	public String getMember_type_social() {
		return member_type_social;
	}

	public void setMember_type_social(String member_type_social) {
		this.member_type_social = member_type_social;
	}

	public String getDrop_out_member() {
		return drop_out_member;
	}

	public void setDrop_out_member(String drop_out_member) {
		this.drop_out_member = drop_out_member;
	}

	public String getTotal_admin() {
		return total_admin;
	}

	public void setTotal_admin(String total_admin) {
		this.total_admin = total_admin;
	}

	public String getSupervisor() {
		return supervisor;
	}

	public void setSupervisor(String supervisor) {
		this.supervisor = supervisor;
	}

	public String getCommon_admin() {
		return common_admin;
	}

	public void setCommon_admin(String common_admin) {
		this.common_admin = common_admin;
	}
}
