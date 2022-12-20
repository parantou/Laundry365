package com.acorn.boram.reserve.dto;

public class Order_ItemsDto {
	private int num;
	private int code;
	private int inum;
	private int count;
	
	public Order_ItemsDto() {}

	public Order_ItemsDto(int num, int code, int inum, int count) {
		super();
		this.num = num;
		this.code = code;
		this.inum = inum;
		this.count = count;
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
	};
	
}
