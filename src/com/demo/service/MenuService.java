package com.demo.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.demo.dao.MenuDaoImpl;

public class MenuService {
	private MenuDaoImpl menuDao;

	public void setMenuDao(MenuDaoImpl menuDao) {
		this.menuDao = menuDao;
	}
	public Map addMenu(HashMap parameter){
		Map map = new HashMap();
		map.put("flag",menuDao.insert(parameter));
		map.put("result","ok");
		return map;
	}
	
	public Map updateMenu(HashMap parameter){
		Map map = new HashMap();
		map.put("flag",menuDao.update(parameter));
		map.put("result","ok");
		return map;
	}
	
	public List queryMenu(HashMap parameter){
		parameter.put("IS_DELETE", "0");
		return menuDao.query(parameter);
	}
	
	public Map queryList(HashMap parameter){
		Map map = new HashMap();
		parameter.put("IS_DELETE", "0");
		map.put("data", menuDao.query(parameter));
		map.put("count", menuDao.queryCount(parameter).size());
		return map;
	}
	
	public Map addType(HashMap parameter){
		Map map = new HashMap();
		map.put("flag",menuDao.insertType(parameter));
		map.put("result","ok");
		return map;
	}
	
	public Map updateType(HashMap parameter){
		Map map = new HashMap();
		map.put("flag",menuDao.updateType(parameter));
		map.put("result","ok");
		return map;
	}
	
	public Map queryType(HashMap parameter){
		Map map = new HashMap();
		map.put("data",menuDao.queryType(parameter));
		return map;
	}
	
	public Map deleteType(HashMap parameter){
		Map map = new HashMap();
		map.put("flag",menuDao.deleteType(parameter));
		map.put("result","ok");
		return map;
	}
	
}
