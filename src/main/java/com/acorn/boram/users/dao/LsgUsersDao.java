package com.acorn.boram.users.dao;

import java.util.List;

import com.acorn.boram.users.dto.LsgUsersDto;

public interface LsgUsersDao {
	public boolean checkId(String id);
	public void insertUser(LsgUsersDto dto);
	public LsgUsersDto getData(String id);
	public LsgUsersDto isExistUser(LsgUsersDto dto);
	public boolean UpdateUser(LsgUsersDto dto);
	public List<LsgUsersDto> getList(LsgUsersDto dto);
	public int getCount(LsgUsersDto dto);
	public int delete(String[] users);
	public int update(LsgUsersDto dto);
}
