package com.acorn.boram.orderlist.service;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.ModelAndView;

import com.acorn.boram.orderlist.dto.LsaOrderListDto;
import com.acorn.boram.orderlist.dto.LsgOrderListDto;

public interface LsaOrderListService {
	public List<LsaOrderListDto> getOrderList(String userId);
	public List<LsaOrderListDto> getOrderDetailList(String code);
	public void getOrderListData(ModelAndView mView,HttpSession session);
	public LsaOrderListDto getData(int code);
}