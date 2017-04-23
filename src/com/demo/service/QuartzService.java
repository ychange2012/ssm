package com.demo.service;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.demo.dao.OrderDaoImpl;
import com.demo.dao.demoDaoImpl;
import com.demo.model.User;


public class QuartzService {
	@Autowired
	private OrderDaoImpl orderDao;
	
	
	public void checkBookingn()throws Exception{
		System.out.println("定时任务（扫描过期订单）"+new Date());
		HashMap parameter = new HashMap();
		System.out.println("过期订单订单数"+orderDao.scanfOrder(parameter));
	}
}
