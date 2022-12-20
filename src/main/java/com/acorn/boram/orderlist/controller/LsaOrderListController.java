package com.acorn.boram.orderlist.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.acorn.boram.orderlist.dto.LsaOrderListDto;
import com.acorn.boram.orderlist.dto.LsgOrderListDto;
import com.acorn.boram.orderlist.service.LsaOrderListService;

@Controller
public class LsaOrderListController {
	
	@Autowired
	private LsaOrderListService ordersService;
	
	@RequestMapping("/mypage/orderList/list_customer")
	public String orderlist(int code,HttpServletRequest request) {
		System.out.println("code:"+code);
		LsaOrderListDto dto=ordersService.getData(code);
		request.setAttribute("order", dto);
		System.out.println(dto.getOrder_price());
		return "mypage/orderList/list_customer";
	}
	
	@RequestMapping("/mypage/orderList/list_detail")
	public String orderDetail(int code,HttpServletRequest request) {
		System.out.println("code:"+code);
		LsaOrderListDto dto=ordersService.getData(code);
		request.setAttribute("order", dto);
		System.out.println(dto.getOrder_price());
		return "mypage/orderList/list_detail";
		
	}
	
}