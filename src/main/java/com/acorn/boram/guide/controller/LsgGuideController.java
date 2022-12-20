package com.acorn.boram.guide.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.acorn.boram.guide.service.LsgGuideService;

@Controller
public class LsgGuideController {
	@Autowired
	private LsgGuideService service;
	
	//가격안내 화면으로 이동
	@RequestMapping("/guide/price_guide")
	public ModelAndView priceGuide(ModelAndView mView,String category) {
		service.getListItem(mView);
		if(category!=null) {
			//category들어오면 ajax사용
			mView.setViewName("guide/ajax_price_guide");
		}else {
			mView.setViewName("guide/price_guide");
		}
		return mView;
	}
	
	//지역안내 화면으로 이동
	@RequestMapping("/guide/area_guide")
	public String areaGuide() {
		return "guide/area_guide";
	}
}
