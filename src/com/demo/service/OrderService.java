package com.demo.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.demo.dao.OrderDaoImpl;

public class OrderService {
	private OrderDaoImpl orderDao;

	public void setOrderDao(OrderDaoImpl orderDao) {
		this.orderDao = orderDao;
	}
	
	public Map addOrder(HashMap parameter){
		Map map = new HashMap();
		map.put("flag",orderDao.addOrder(parameter));
		map.put("result","ok");
		return map;
	}
	
	public Map addOrderDetail(HashMap parameter){
		Map map = new HashMap();
		map.put("flag",orderDao.addOrderDetail(parameter));
		map.put("result","ok");
		return map;
	}
	
	public Object updateOrder(HashMap parameter){
		Map map = new HashMap();
		map.put("flag",orderDao.updateOrder(parameter));
		map.put("result","ok");
		return map;
	}
	
	public Object updateOrderDetail(HashMap parameter){
		Map map = new HashMap();
		map.put("flag",orderDao.updateOrderDetail(parameter));
		map.put("result","ok");
		return map;
	}
	
	public Map queryHistoryOrder (HashMap parameter){
		Map map = new HashMap();
		map.put("data",orderDao.queryHistoryOrder(parameter));
		map.put("count",orderDao.queryHistoryCount(parameter).size());
		return map;
	}
	
	public Map queryDetail (HashMap parameter){
		Map map = new HashMap();
		map.put("data",orderDao.queryDetail(parameter));
		return map;
	}
	public Map queryOrderCount (HashMap parameter){
		Map map = new HashMap();
		map.put("data",orderDao.queryOrderCount(parameter));
		return map;
	}
	public Map queryTypePercent (HashMap parameter){
		Map map = new HashMap();
		map.put("data",orderDao.queryTypePercent(parameter));
		return map;
	}
	public HashMap queryTotalPrice (HashMap parameter){
		return orderDao.queryTotalPrice(parameter);
	}
	
	
}
