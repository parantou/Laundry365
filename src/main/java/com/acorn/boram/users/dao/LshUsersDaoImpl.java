package com.acorn.boram.users.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.acorn.boram.users.dto.LsgUsersDto;

@Repository
public class LshUsersDaoImpl implements LshUsersDao{
	
	@Autowired
	private SqlSession session;

	@Override
	public LsgUsersDto getData(String id) {
		System.out.println("test");
		System.out.println("dao: " + id);
		LsgUsersDto dto=session.selectOne("users.getData", id);
		System.out.println("name: "+dto.getName());
		return dto;
	}

	@Override
	public boolean isExist(String inputId) {
		//인자로 전달 받은 아이디가 존재 하는지 select 해 본다.
		String id=session.selectOne("users.isExist", inputId);
		if(id==null) {
			return false;
		}else {
			return true;
		}
	}

	@Override
	public void insert(LsgUsersDto dto) {
		session.insert("users.insert", dto);
	}

	@Override
	public void updatePwd(LsgUsersDto dto) {
		session.update("users.pwdUpdate", dto);
	}

	@Override
	public void update(LsgUsersDto dto) {
		session.update("users.update", dto);
	}

	@Override
	public void delete(String id) {
		session.delete("users.delete", id);
	}

	
}
