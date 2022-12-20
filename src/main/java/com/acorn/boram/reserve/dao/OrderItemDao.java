package com.acorn.boram.reserve.dao;

import com.acorn.boram.reserve.dto.Order_ItemsDto;

public interface OrderItemDao {
	public Order_ItemsDto getData(int num);
	public void productCountInsert(Order_ItemsDto dto);
}
