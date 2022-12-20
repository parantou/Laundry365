package com.acorn.boram.notice.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.acorn.boram.notice.dto.NoticeDto;


@Repository
public class NoticeDaoImpl implements NoticeDao{
	@Autowired
	private SqlSession session;
	
	@Override
	public List<NoticeDto> getList(NoticeDto dto) {
		
		return session.selectList("notice.getList", dto);
	}

	@Override
	public int getCount(NoticeDto dto) {
		
		return session.selectOne("notice.getCount", dto);
	}

	@Override
	public void insert(NoticeDto dto) {
		session.insert("notice.insert", dto);
	}
	
	// 검색 기능이 없었을 때 사용하던 메소드 (지금은 사용하지 않음)
	@Override
	public NoticeDto getData(int num) {
		
		return session.selectOne("notice.getData", num);
	}

	// 검색 기능이 있을 때 사용하는 메소드 (지금 사용하고 있음)
	@Override
	public NoticeDto getData(NoticeDto dto) {
		
		return session.selectOne("notice.getData2", dto);
	}

	@Override
	public void addViewCount(int num) {
		session.update("notice.addViewCount", num);
	}

	@Override
	public void delete(int num) {
		session.delete("notice.delete", num);
	}

	@Override
	public void update(NoticeDto dto) {
		session.update("notice.update", dto);
	}

}
