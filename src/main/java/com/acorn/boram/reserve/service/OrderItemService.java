package com.acorn.boram.reserve.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import com.acorn.boram.reserve.dto.Order_ItemsDto;
import com.acorn.boram.reserve.dto.Service_OrderDto;

public interface OrderItemService {
	public void getData2(HttpServletRequest request);
	public void productCountInsert(Order_ItemsDto dto);
}
