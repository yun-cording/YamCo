package com.yamco.user.controller;

import java.util.Map;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;

@JsonIgnoreProperties(ignoreUnknown = true)
public class RecipeData {
    private Map<String, RecipeRow> COOKRCP01;

	public Map<String, RecipeRow> getCOOKRCP01() {
		return COOKRCP01;
	}

	public void setCOOKRCP01(Map<String, RecipeRow> cOOKRCP01) {
		COOKRCP01 = cOOKRCP01;
	}
}