package com.acorn.boram.reserve.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.acorn.boram.reserve.dao.OrderItemDao;
import com.acorn.boram.reserve.dto.Order_ItemsDto;

@Service
public class OrderItemServiceImpl implements OrderItemService{

	@Autowired
	private OrderItemDao dao;
	
	@Override
	public void getData2(HttpServletRequest request) {
		
		
	}

	@Override
	public void productCountInsert(Order_ItemsDto dto) {
		dao.productCountInsert(dto);
	}

}
