package com.acorn.boram.reserve.dto;

public class CategorizeDto {
	private String category;
	
	public CategorizeDto() {};

	public CategorizeDto(String category) {
		super();
		this.category = category;
	}

	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
	}
	
	
}
