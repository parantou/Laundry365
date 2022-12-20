package com.acorn.boram.guide.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import com.acorn.boram.guide.dao.LsgGuideDao;
import com.acorn.boram.guide.dto.LsgItemsDto;

@Service
public class LsgGuideServiceImpl implements LsgGuideService{

	@Autowired
	private LsgGuideDao dao;
	
	@Override
	public void getListItem(ModelAndView mView) {
		List<LsgItemsDto> list=dao.getList();
		mView.addObject("list", list);
	}

}
