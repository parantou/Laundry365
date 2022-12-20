package com.acorn.boram.faq.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.acorn.boram.faq.dto.HyrFaqDto;

@Repository
public class HyrFaqDaoImpl implements HyrFaqDao {
	@Autowired
	private SqlSession session;

	@Override
	public List<HyrFaqDto> getList(HyrFaqDto dto) {
		/*
		 * mapper's namespace: faq
		 * sql's id : getList
		 * parameterType : FaqDto
		 * resultType : FaqDto
		 */
		List<HyrFaqDto> list=session.selectList("faq.getList", dto);
		return list;
	}

	@Override
	public void insert(HyrFaqDto dto) {
		
		session.insert("faq.insert", dto);
	}

	@Override
	public void delete(int num) {
		
		session.delete("faq.delete",num);
	}

	@Override
	public void update(HyrFaqDto dto) {
		
		session.update("faq.update",dto);
	}

	@Override
	public int getCount(HyrFaqDto dto) {
		
		return session.selectOne("faq.getCount",dto);
	}

	@Override
	public HyrFaqDto getData(HyrFaqDto dto) {
		
		return session.selectOne("faq.getData2", dto);
	}

	@Override
	public HyrFaqDto getData(int num) {
		// TODO Auto-generated method stub
		return session.selectOne("faq.getData", num);
	}
	
}
