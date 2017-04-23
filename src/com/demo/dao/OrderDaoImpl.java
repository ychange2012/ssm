package com.demo.dao;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;

public class OrderDaoImpl {
	private SqlSessionTemplate sqlSessionTemplate;
	private final String NPSTR="order.";
	public void setSqlSessionTemplate(SqlSessionTemplate sqlSessionTemplate) {
		this.sqlSessionTemplate = sqlSessionTemplate;
	}
	
	public Object addOrder(HashMap parameter){
		return sqlSessionTemplate.insert(NPSTR+"insertOrder",parameter);
	}
	
	public Object addOrderDetail(HashMap parameter){
		return sqlSessionTemplate.insert(NPSTR+"insertDetail",parameter);
	}
	
	public Object updateOrder (HashMap parameter){
		return sqlSessionTemplate.update(NPSTR+"updateOrder",parameter);
	}
	
	public Object updateOrderDetail (HashMap parameter){
		return sqlSessionTemplate.update(NPSTR+"updateDetail",parameter);
	}
	
	public Object scanfOrder(HashMap parameter){
		 return sqlSessionTemplate.update(NPSTR+"scanfOrder",parameter);
	}
	
	public List<HashMap> queryHistoryOrder(HashMap parameter){
		return sqlSessionTemplate.selectList(NPSTR+"queryHistoryOrder",parameter);
	}
	public List<HashMap> queryHistoryCount(HashMap parameter){
		return sqlSessionTemplate.selectList(NPSTR+"queryHistoryCount",parameter);
	}
	
	public List<HashMap> queryDetail(HashMap parameter){
		return sqlSessionTemplate.selectList(NPSTR+"queryDetail",parameter);
	}
	public List<HashMap> queryOrderCount(HashMap parameter){
		return sqlSessionTemplate.selectList(NPSTR+"queryOrderCount",parameter);
	}
	public List<HashMap> queryTypePercent(HashMap parameter){
		return sqlSessionTemplate.selectList(NPSTR+"queryTypePercent",parameter);
	}
	public HashMap queryTotalPrice(HashMap parameter){
		HashMap map = new HashMap();
		map.put("price", sqlSessionTemplate.selectList(NPSTR+"queryTotalPrice",parameter));
		map.put("profit", sqlSessionTemplate.selectList(NPSTR+"queryTotalProfit",parameter));
		return map;
	}
 }
