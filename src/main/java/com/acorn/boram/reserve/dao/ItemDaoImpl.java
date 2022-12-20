package com.acorn.boram.reserve.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.acorn.boram.reserve.dto.ItemsDto;

@Repository
public class ItemDaoImpl implements ItemDao{

	@Autowired
	private SqlSession session;
	
	@Override
	public List<ItemsDto> getList(ItemsDto dto) {
		
		return session.selectList("Reserve.getList", dto);
	}

	@Override
	public List<ItemsDto> getList2(ItemsDto dto) {

		return session.selectList("Reserve.getList2", dto);
	}

	@Override
	public List<ItemsDto> getList3(ItemsDto dto) {

		return session.selectList("Reserve.getList3", dto);
	}

	@Override
	public List<ItemsDto> getList4(ItemsDto dto) {

		return session.selectList("Reserve.getList4", dto);
	}
}
