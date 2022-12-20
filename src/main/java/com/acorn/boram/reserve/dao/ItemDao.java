package com.acorn.boram.reserve.dao;

import java.util.List;

import com.acorn.boram.reserve.dto.ItemsDto;

public interface ItemDao {
	public List<ItemsDto> getList(ItemsDto dto);
	public List<ItemsDto> getList2(ItemsDto dto);
	public List<ItemsDto> getList3(ItemsDto dto);
	public List<ItemsDto> getList4(ItemsDto dto);
}
