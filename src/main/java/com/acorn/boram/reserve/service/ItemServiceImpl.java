package com.acorn.boram.reserve.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import com.acorn.boram.reserve.dao.CategorizeDao;
import com.acorn.boram.reserve.dao.ItemDao;
import com.acorn.boram.reserve.dto.ItemsDto;

@Service
public class ItemServiceImpl implements ItemService{

	@Autowired 
	private ItemDao ItemDao;
	
	@Override
	public void getList(ModelAndView mView) {
		ItemsDto dto= new ItemsDto();
		List<ItemsDto> list=ItemDao.getList(dto);
		mView.addObject("list", list);
	}

	@Override
	public void getList2(ModelAndView mView) {
		ItemsDto dto = new ItemsDto();
		List<ItemsDto> list2=ItemDao.getList2(dto);
		mView.addObject("list2", list2);
	}

	@Override
	public void getList3(ModelAndView mView) {
		ItemsDto dto = new ItemsDto();
		List<ItemsDto> list3=ItemDao.getList3(dto);
		mView.addObject("list3", list3);
		
	}

	@Override
	public void getList4(ModelAndView mView) {
		ItemsDto dto = new ItemsDto();
		List<ItemsDto> list4=ItemDao.getList4(dto);
		mView.addObject("list4", list4);
	}
}