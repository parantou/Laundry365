package com.acorn.boram.reserve.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.acorn.boram.reserve.dto.Order_ItemsDto;

@Repository
public class OrderItemDaoImpl implements OrderItemDao{

	@Autowired
	private SqlSession session;
	
	@Override
	public Order_ItemsDto getData(int num) {
		
		return session.selectOne("Reserve.getData2", num);
	}

	@Override
	public void productCountInsert(Order_ItemsDto dto) {
		session.insert("Reserve.productCountInsert", dto);
	}

}
