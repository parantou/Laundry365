package com.acorn.boram.orderlist.dao;

import java.util.List;

import com.acorn.boram.orderlist.dto.LsgOrderItemsDto;
import com.acorn.boram.orderlist.dto.LsgOrderListDto;

public interface LsgOrderListDao {
	public List<LsgOrderListDto> getList(LsgOrderListDto dto);
	public int getCount(LsgOrderListDto dto);
	public LsgOrderListDto getData(LsgOrderListDto dto);
	public int update(String[] codes, String state);
	public int coruierUpdate(String[] codes, String courier);
	public int coruierUpdate2(String[] codes, String courier);
	public List<LsgOrderItemsDto> getListOrderItem(LsgOrderListDto dto);
}
