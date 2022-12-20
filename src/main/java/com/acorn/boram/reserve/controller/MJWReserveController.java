package com.acorn.boram.reserve.controller;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.acorn.boram.reserve.dto.Service_OrderDto;
import com.acorn.boram.reserve.service.ItemService;
import com.acorn.boram.reserve.service.OrderItemService;
import com.acorn.boram.reserve.service.ServiceOrderService;
import com.acorn.boram.users.service.LshUsersService;

@Controller
public class MJWReserveController {

	@Autowired
	private ItemService service;
	@Autowired
	private ServiceOrderService productService;
	@Autowired
	private LshUsersService usersservice;
	@Autowired
	private OrderItemService orderitemservice;

   @RequestMapping("/reserve/reserve_select")
   public String reserve_select(HttpServletRequest request) {
      return "reserve/reserve_select";
   }
   
   @RequestMapping("/reserve/select")
   public ModelAndView authreserve_select(ModelAndView mView,String category, HttpServletRequest request) {
      
      //카테고리 값 확인
      System.out.println("category : "+category);
      //category키 값으로 value에 category값 담기
      mView.addObject("category", category);
      if(category.equals("clothes")) {
    	  service.getList(mView);
    	  mView.setViewName("reserve/reserve_wash");
      }else if(category.equals("bedding")){
    	  service.getList2(mView);
    	  mView.setViewName("reserve/reserve_bed");
      }else if(category.equals("shoes")){
    	  service.getList3(mView);
    	  mView.setViewName("reserve/reserve_shoes");
      }else if(category.equals("living")){
    	  service.getList4(mView);
    	  mView.setViewName("reserve/reserve_living");
      }
      	return mView;
   }

   
   @RequestMapping("/reserve/reserve_credit")
   public ModelAndView reserve_credit(HttpSession session, Service_OrderDto dto, ModelAndView mView) {
	   
	   mView.setViewName("reserve/reserve_credit");
	   usersservice.getInfo(session, mView);
	   
      return mView;
   }
   
   
   @RequestMapping("/reserve/insert")
   public ModelAndView reserve_insert(ModelAndView mView, Service_OrderDto dto, 
		   String inum, String count) {
	   	//service_order 테이블에 주문 정보 insert
	   System.out.println(dto.getCategory());
	   System.out.println(dto.getOrder_addr());
	   System.out.println(dto.getOrder_price());
	   System.out.println(dto.getOrderer());
	   System.out.println(dto.getRequest());
	   System.out.println(dto.getReservation_date());
	   	productService.insertOrder(mView,dto,inum,count);

	   mView.setViewName("reserve/insert");
	   return mView;
   }
}