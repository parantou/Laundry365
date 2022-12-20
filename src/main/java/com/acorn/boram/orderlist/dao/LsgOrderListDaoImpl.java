package com.acorn.boram.orderlist.dao;

import java.util.List;
import java.util.Random;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.acorn.boram.orderlist.dto.LsgOrderItemsDto;
import com.acorn.boram.orderlist.dto.LsgOrderListDto;

@Repository
public class LsgOrderListDaoImpl implements LsgOrderListDao{

	@Autowired
	private SqlSession session;
	
	@Override
	public List<LsgOrderListDto> getList(LsgOrderListDto dto) {
		return session.selectList("orderList.getList",dto);
	}

	@Override
	public int getCount(LsgOrderListDto dto) {
		return session.selectOne("orderList.getCount",dto);
	}

	@Override
	public LsgOrderListDto getData(LsgOrderListDto dto) {
		return session.selectOne("orderList.getData",dto);
	}

	@Override
	public int update(String[] codes, String state) {
		int count=0;
		for(int i=0;i<codes.length;i++) {
			LsgOrderListDto dto=new LsgOrderListDto();
			dto.setCode(Integer.parseInt(codes[i]));
			dto.setState(state);
			session.update("orderList.orderUpdate", dto);
			count++;
		}
		return count;
	}

	@Override
	public int coruierUpdate(String[] codes, String courier) {
		int count=0;
		for(int i=0;i<codes.length;i++) {
			LsgOrderListDto dto=new LsgOrderListDto();
			
			Random ranum  = new Random();
			String rum="";
			for(int l=0;l<11;l++) {
				rum += Integer.toString(ranum.nextInt(10));
			}
			
			dto.setCode(Integer.parseInt(codes[i]));
			dto.setGet_courier(courier);
			dto.setGet_invoice_num(rum);
			session.update("orderList.coruierUpdate", dto);
			count++;
		}
		return count;
	}
	
	@Override
	public int coruierUpdate2(String[] codes, String courier) {
		int count=0;
		for(int i=0;i<codes.length;i++) {
			LsgOrderListDto dto=new LsgOrderListDto();
			
			Random ranum  = new Random();
			String num="";
			for(int l=0;l<11;l++) {
				num += Integer.toString(ranum.nextInt(10));
			}
			
			dto.setCode(Integer.parseInt(codes[i]));
			dto.setSend_courier(courier);
			dto.setSend_invoice_num(num);
			session.update("orderList.coruierUpdate2", dto);
			count++;
		}
		return count;
	}

	@Override
	public List<LsgOrderItemsDto> getListOrderItem(LsgOrderListDto dto) {
		return session.selectList("orderList.getOrderItems",dto);
	}

}
