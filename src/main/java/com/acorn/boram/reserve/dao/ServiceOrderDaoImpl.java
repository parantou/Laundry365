package com.acorn.boram.reserve.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.acorn.boram.reserve.dto.Order_ItemsDto;
import com.acorn.boram.reserve.dto.Service_OrderDto;
import com.acorn.boram.users.dto.LsgUsersDto;

@Repository
public class ServiceOrderDaoImpl implements ServiceOrderDao{

	@Autowired
	private SqlSession session;
	
	@Override
	public Service_OrderDto getData(int num) {
		
		return session.selectOne("Reserve.getData4", num);
	}

	@Override
	public void productInsert(Service_OrderDto dto) {
		session.insert("Reserve.productInsert", dto);
	}

	@Override
	public LsgUsersDto productAddr(String id) {
		LsgUsersDto dto=session.selectOne("users.productAddr", id);
		return dto;
	}

	@Override
	public int insertOrder(Service_OrderDto dto) {
		return session.insert("Reserve.insertOrder",dto);
	}

	@Override
	public int getServiceOrderSeq() {
		return session.selectOne("Reserve.getSeq");
	}

	@Override
	public int insertOrderItems(int seq, String inum, String count) {
		int num=0;
		String[] array = inum.split("/");
	   	String[] array2 = count.split(", ");
	   	for(int i=0;i<array.length;i++) {
		   	Order_ItemsDto dto=new Order_ItemsDto();
		   	dto.setCode(seq);
		   	dto.setInum(Integer.parseInt(array[i]));
		   	dto.setCount(Integer.parseInt(array2[i]));
		   	session.insert("Reserve.insertOrderItems",dto);
		   	num++;
	   	}
		
		return num;
	}

}
