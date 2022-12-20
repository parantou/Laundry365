package com.acorn.boram.orderlist.dto;

public class LsgOrderListDto {
	private int code;
	private String orderer;
	private String category;
	private String name;
	private String phone;
	private String addr;
	private int order_price;
	private String order_addr;
	private String regdate;
	private String reservation_date;
	private String request;
	private String state;
	private String get_invoice_num;
	private String send_invoice_num;
	private String get_courier;
	private String send_courier;
	private int startRowNum;
	private int endRowNum;
	
	public LsgOrderListDto() {}

	public LsgOrderListDto(int code, String orderer, String category, String name, String phone, String addr,
			int order_price, String order_addr, String regdate, String reservation_date, String request, String state,
			String get_invoice_num, String send_invoice_num, String get_courier, String send_courier, int startRowNum,
			int endRowNum) {
		super();
		this.code = code;
		this.orderer = orderer;
		this.category = category;
		this.name = name;
		this.phone = phone;
		this.addr = addr;
		this.order_price = order_price;
		this.order_addr = order_addr;
		this.regdate = regdate;
		this.reservation_date = reservation_date;
		this.request = request;
		this.state = state;
		this.get_invoice_num = get_invoice_num;
		this.send_invoice_num = send_invoice_num;
		this.get_courier = get_courier;
		this.send_courier = send_courier;
		this.startRowNum = startRowNum;
		this.endRowNum = endRowNum;
	}

	public int getCode() {
		return code;
	}

	public void setCode(int code) {
		this.code = code;
	}

	public String getOrderer() {
		return orderer;
	}

	public void setOrderer(String orderer) {
		this.orderer = orderer;
	}

	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getAddr() {
		return addr;
	}

	public void setAddr(String addr) {
		this.addr = addr;
	}

	public int getOrder_price() {
		return order_price;
	}

	public void setOrder_price(int order_price) {
		this.order_price = order_price;
	}

	public String getOrder_addr() {
		return order_addr;
	}

	public void setOrder_addr(String order_addr) {
		this.order_addr = order_addr;
	}

	public String getRegdate() {
		return regdate;
	}

	public void setRegdate(String regdate) {
		this.regdate = regdate;
	}

	public String getReservation_date() {
		return reservation_date;
	}

	public void setReservation_date(String reservation_date) {
		this.reservation_date = reservation_date;
	}

	public String getRequest() {
		return request;
	}

	public void setRequest(String request) {
		this.request = request;
	}

	public String getState() {
		return state;
	}

	public void setState(String state) {
		this.state = state;
	}

	public String getGet_invoice_num() {
		return get_invoice_num;
	}

	public void setGet_invoice_num(String get_invoice_num) {
		this.get_invoice_num = get_invoice_num;
	}

	public String getSend_invoice_num() {
		return send_invoice_num;
	}

	public void setSend_invoice_num(String send_invoice_num) {
		this.send_invoice_num = send_invoice_num;
	}

	public String getGet_courier() {
		return get_courier;
	}

	public void setGet_courier(String get_courier) {
		this.get_courier = get_courier;
	}

	public String getSend_courier() {
		return send_courier;
	}

	public void setSend_courier(String send_courier) {
		this.send_courier = send_courier;
	}

	public int getStartRowNum() {
		return startRowNum;
	}

	public void setStartRowNum(int startRowNum) {
		this.startRowNum = startRowNum;
	}

	public int getEndRowNum() {
		return endRowNum;
	}

	public void setEndRowNum(int endRowNum) {
		this.endRowNum = endRowNum;
	}
}
