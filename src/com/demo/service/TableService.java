package com.demo.service;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.demo.dao.MenuDaoImpl;
import com.demo.dao.TableDaoImpl;

public class TableService {
	private TableDaoImpl tableDao;

	
	public void setTableDao(TableDaoImpl tableDao) {
		this.tableDao = tableDao;
	}

	public Map addTable(HashMap parameter){
		Map map = new HashMap();
		HashMap temp = new HashMap();
		temp.put("TABLE_NAME", parameter.get("TABLE_NAME"));
		List list = tableDao.query(temp);
		if(list.size()>1){
			map.put("result","error");
			map.put("msg","添加失败，座位名重复！");
		}
		else{
			map.put("flag",tableDao.insert(parameter));
			map.put("result","ok");
		}
		return map;
	}
	
	public Map updateTable(HashMap parameter){
		Map map = new HashMap();
		HashMap temp = new HashMap();
		temp.put("TABLE_NAME", parameter.get("TABLE_NAME"));
		List list = tableDao.query(temp);
		if(list.size()>1){
			map.put("result","error");
			map.put("msg","修改失败，座位名重复！");
		}
		else{
			map.put("flag",tableDao.update(parameter));
			map.put("result","ok");
		}
		return map;
	}
	
	public Map queryTable(HashMap parameter){
		Map map = new HashMap();
		map.put("data",tableDao.query(parameter));
		map.put("count",tableDao.queryCount(parameter).size());
		return map ;
	}
	
	public Map deleteTable(HashMap parameter){
		Map map = new HashMap();
		map.put("flag",tableDao.delete(parameter));
		return map;
	}
	
	public Map queryBankTable(HashMap parameter){
		Map map = new HashMap();
		map.put("data",tableDao.queryBankTable(parameter));
		return map;
	}
	
	public Map queryBankTableNow(HashMap parameter){
		SimpleDateFormat dateFormater = new SimpleDateFormat("yyyy-MM-dd H:m:s");
		Date date=new Date();
		parameter.put("TIMESTR", dateFormater.format(date));
		Map map = new HashMap();
		map.put("data",tableDao.queryBankTable(parameter));
		return map;
	}
}
