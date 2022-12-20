package com.acorn.boram.reserve.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.acorn.boram.reserve.dto.CategorizeDto;

@Repository
public class CategorizeDaoImpl implements CategorizeDao{

	@Autowired
	private SqlSession session;
	
	@Override public CategorizeDto getData(int num) {
		
		return session.selectOne("Reserve.getData3", num);
	}
}
