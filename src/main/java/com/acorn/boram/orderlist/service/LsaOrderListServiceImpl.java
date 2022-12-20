package com.acorn.boram.orderlist.service;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import com.acorn.boram.orderlist.dao.LsaOrderListDao;
import com.acorn.boram.orderlist.dto.LsaOrderListDto;
import com.acorn.boram.orderlist.dto.LsgOrderListDto;

@Service
public class LsaOrderListServiceImpl implements LsaOrderListService{
	@Autowired
	private LsaOrderListDao ordersDAO;

	@Override
	public List<LsaOrderListDto> getOrderList(String userId) {
		return ordersDAO.getOrderList(userId);
	}

	@Override
	public List<LsaOrderListDto> getOrderDetailList(String code) {
		return ordersDAO.getOrderDetailList(code);
	}

	@Override
	public void getOrderListData(ModelAndView mView,HttpSession session) {
		String id=session.getAttribute("id").toString();
		System.out.println("getOrderListData id : "+id);
		mView.addObject("list", ordersDAO.getListData(id));
	}

	@Override
	public LsaOrderListDto getData(int code) {
		System.out.println("service code: "+code);
		LsaOrderListDto dto=ordersDAO.getData(code);
		return dto;
	}
	

}