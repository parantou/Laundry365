package com.acorn.boram.review.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.acorn.boram.review.dto.KjReviewDto;

@Repository
public class KjReviewDaoImpl implements KjReviewDao{
	@Autowired
	private SqlSession session;
	
	@Override
	public List<KjReviewDto> getList(KjReviewDto dto) {
		
		return session.selectList("review.getList", dto);	
	}
	@Override
	public int getCount(KjReviewDto dto) {
		return session.selectOne("review.getCount", dto);
	}

	@Override
	public void insert(KjReviewDto dto) {
		session.insert("review.insert", dto);
	}

	@Override
	public KjReviewDto getData(int num) {
		return session.selectOne("review.getData", num);
	}

	@Override
	public KjReviewDto getData(KjReviewDto dto) {
		return session.selectOne("review.getData2", dto);
	}

	@Override
	public void addViewCount(int num) {
		session.update("review.addViewCount", num);
	}

	@Override
	public void delete(int num) {
		session.delete("review.delete", num);
	}

	@Override
	public void update(KjReviewDto dto) {
		session.update("review.update", dto);
	}

}
