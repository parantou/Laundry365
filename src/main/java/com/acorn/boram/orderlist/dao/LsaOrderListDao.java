package com.acorn.boram.orderlist.dao;

import java.util.List;

import com.acorn.boram.orderlist.dto.LsaOrderListDto;
import com.acorn.boram.orderlist.dto.LsgOrderListDto;

public interface LsaOrderListDao {
	public List<LsaOrderListDto> getOrderList(String userId);
	public List<LsaOrderListDto> getOrderDetailList(String code);
	public List<LsaOrderListDto> getListData(String id);
	public LsaOrderListDto getData(int code);
	
}
