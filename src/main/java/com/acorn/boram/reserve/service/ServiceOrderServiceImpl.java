package com.acorn.boram.reserve.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import com.acorn.boram.reserve.dao.ServiceOrderDao;
import com.acorn.boram.reserve.dto.Order_ItemsDto;
import com.acorn.boram.reserve.dto.Service_OrderDto;
import com.acorn.boram.users.dto.LsgUsersDto;

@Service
public class ServiceOrderServiceImpl implements ServiceOrderService{
	
	@Autowired
	private ServiceOrderDao dao;


	@Override
	public void getData4(HttpServletRequest request) {
		
	}

	@Override
	public void productInsert(Service_OrderDto dto) {
		dao.productInsert(dto);
	}

	@Override
	public void productAddr(String id, ModelAndView mView) {
		LsgUsersDto dto=dao.productAddr(id);
		mView.addObject("dto",dto);
	}

	@Override
	public void insertOrder(ModelAndView mView, Service_OrderDto dto, 
			String inum, String count) {
		int flag=dao.insertOrder(dto);
		if(flag>0) {
			int seq=dao.getServiceOrderSeq();
			int num=dao.insertOrderItems(seq,inum,count);
			if(num >0) {
				mView.addObject("isSuccess", true);
			}else {
				mView.addObject("isSuccess", false);
			}
		}else {
			mView.addObject("isSuccess", false);
		}
	}
}