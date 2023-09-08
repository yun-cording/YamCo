package com.yamco.admin.model.vo;

import java.util.List;

import org.springframework.stereotype.Repository;
@Repository
public class Admin_Dash_VO {
	private String hit_total, hit_user, hit_public, visit_total, visit_am, visit_pm, recipe_new, recipe_user,
			recipe_total, client_new, male_count, female_count;
	private List<String> week_hit_count, week_visit_count, daysOfWeek;
	private List<Admin_Report_VO> final_report_list, recent_report_list;
	public final String getHit_total() {
		return hit_total;
	}

	public final void setHit_total(String hit_total) {
		this.hit_total = hit_total;
	}

	public final String getHit_user() {
		return hit_user;
	}

	public final void setHit_user(String hit_user) {
		this.hit_user = hit_user;
	}

	public final String getHit_public() {
		return hit_public;
	}

	public final void setHit_public(String hit_public) {
		this.hit_public = hit_public;
	}

	public final String getVisit_total() {
		return visit_total;
	}

	public final void setVisit_total(String visit_total) {
		this.visit_total = visit_total;
	}

	public final String getVisit_am() {
		return visit_am;
	}

	public final void setVisit_am(String visit_am) {
		this.visit_am = visit_am;
	}

	public final String getVisit_pm() {
		return visit_pm;
	}

	public final void setVisit_pm(String visit_pm) {
		this.visit_pm = visit_pm;
	}

	public final String getRecipe_new() {
		return recipe_new;
	}

	public final void setRecipe_new(String recipe_new) {
		this.recipe_new = recipe_new;
	}

	public final String getRecipe_user() {
		return recipe_user;
	}

	public final void setRecipe_user(String recipe_user) {
		this.recipe_user = recipe_user;
	}

	public final String getRecipe_total() {
		return recipe_total;
	}

	public final void setRecipe_total(String recipe_total) {
		this.recipe_total = recipe_total;
	}

	public final String getClient_new() {
		return client_new;
	}

	public final void setClient_new(String client_new) {
		this.client_new = client_new;
	}

	public final String getMale_count() {
		return male_count;
	}

	public final void setMale_count(String male_count) {
		this.male_count = male_count;
	}

	public final String getFemale_count() {
		return female_count;
	}

	public final void setFemale_count(String female_count) {
		this.female_count = female_count;
	}

	public final List<String> getWeek_hit_count() {
		return week_hit_count;
	}

	public final void setWeek_hit_count(List<String> week_hit_count) {
		this.week_hit_count = week_hit_count;
	}

	public final List<String> getWeek_visit_count() {
		return week_visit_count;
	}

	public final void setWeek_visit_count(List<String> week_visit_count) {
		this.week_visit_count = week_visit_count;
	}

	public final List<String> getDaysOfWeek() {
		return daysOfWeek;
	}

	public final void setDaysOfWeek(List<String> daysOfWeek) {
		this.daysOfWeek = daysOfWeek;
	}

	public final List<Admin_Report_VO> getFinal_report_list() {
		return final_report_list;
	}

	public final void setFinal_report_list(List<Admin_Report_VO> final_report_list) {
		this.final_report_list = final_report_list;
	}

	public final List<Admin_Report_VO> getRecent_report_list() {
		return recent_report_list;
	}

	public final void setRecent_report_list(List<Admin_Report_VO> recent_report_list) {
		this.recent_report_list = recent_report_list;
	}

}
