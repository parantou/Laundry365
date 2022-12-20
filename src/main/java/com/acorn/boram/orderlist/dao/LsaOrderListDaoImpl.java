package com.acorn.boram.orderlist.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.acorn.boram.orderlist.dto.LsaOrderListDto;
import com.acorn.boram.orderlist.dto.LsgOrderListDto;

@Repository
public class LsaOrderListDaoImpl implements LsaOrderListDao{
	@Autowired
	private SqlSession session;
	
	public List<LsaOrderListDto> getOrderList(String userId){
		return session.selectList("orders.getOrderList", userId);
	}

	@Override
	public List<LsaOrderListDto> getOrderDetailList(String code) {
		return session.selectList("orders.getOrderDetailList",  code);
	}

	@Override
	public List<LsaOrderListDto> getListData(String id) {
		List<LsaOrderListDto> list= session.selectList("orders.getListData",id);
		return list; 
	}

	@Override
	public LsaOrderListDto getData(int code) {
		LsaOrderListDto dto=session.selectOne("orders.getdata", code);
		return dto;
	}
	
}
