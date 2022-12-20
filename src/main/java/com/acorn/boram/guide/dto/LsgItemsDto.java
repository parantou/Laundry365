package com.acorn.boram.guide.dto;

public class LsgItemsDto {
	private int inum;
	private String item;
	private int price;
	private String category;
	
	public LsgItemsDto() {}

	public LsgItemsDto(int inum, String item, int price, String category) {
		super();
		this.inum = inum;
		this.item = item;
		this.price = price;
		this.category = category;
	}

	public int getInum() {
		return inum;
	}

	public void setInum(int inum) {
		this.inum = inum;
	}

	public String getItem() {
		return item;
	}

	public void setItem(String item) {
		this.item = item;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
	}
}
