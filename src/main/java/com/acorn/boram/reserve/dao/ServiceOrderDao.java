package com.acorn.boram.reserve.dao;

import com.acorn.boram.reserve.dto.Service_OrderDto;
import com.acorn.boram.users.dto.LsgUsersDto;

public interface ServiceOrderDao {
	public Service_OrderDto getData(int num);
	public void productInsert(Service_OrderDto dto);
	public LsgUsersDto productAddr(String id);
	public int insertOrder(Service_OrderDto dto);
	public int getServiceOrderSeq();
	public int insertOrderItems(int seq,String inum, String count);
}
