package com.acorn.boram.guide.dao;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.acorn.boram.guide.dto.LsgItemsDto;

@Repository
public class LsgGuideDaoImpl implements LsgGuideDao {

	@Autowired
	private SqlSession session;
	
	@Override
	public List<LsgItemsDto> getList() {
		return session.selectList("items.getList");
	}

}
