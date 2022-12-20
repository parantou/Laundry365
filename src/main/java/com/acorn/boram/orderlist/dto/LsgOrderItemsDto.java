package com.acorn.boram.orderlist.dto;

public class LsgOrderItemsDto {
	private int num;
	private int code;
	private int inum;
	private int count;
	private String item;
	private int price;
	private String category;
	
	public LsgOrderItemsDto() {}

	public LsgOrderItemsDto(int num, int code, int inum, int count, String item, int price, String category) {
		super();
		this.num = num;
		this.code = code;
		this.inum = inum;
		this.count = count;
		this.item = item;
		this.price = price;
		this.category = category;
	}

	public int getNum() {
		return num;
	}

	public void setNum(int num) {
		this.num = num;
	}

	public int getCode() {
		return code;
	}

	public void setCode(int code) {
		this.code = code;
	}

	public int getInum() {
		return inum;
	}

	public void setInum(int inum) {
		this.inum = inum;
	}

	public int getCount() {
		return count;
	}

	public void setCount(int count) {
		this.count = count;
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
