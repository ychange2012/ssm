package com.demo.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;

import com.demo.model.User;

public class MenuDaoImpl {
	private SqlSessionTemplate sqlSessionTemplate;
	private final String NPSTR="menu.";
	public void setSqlSessionTemplate(SqlSessionTemplate sqlSessionTemplate) {
		this.sqlSessionTemplate = sqlSessionTemplate;
	}
	
	public Object insert(HashMap parameter){
		return sqlSessionTemplate.insert(NPSTR+"insert",parameter);
	}
	
	public List<Map> query (HashMap parameter){
		return sqlSessionTemplate.selectList(NPSTR+"query",parameter);
	}
	
	public Object update (HashMap parameter){
		return sqlSessionTemplate.update(NPSTR+"update",parameter);
	}
	
	public List<Map> queryCount (HashMap parameter){
		return sqlSessionTemplate.selectList(NPSTR+"queryCount",parameter);
	}
	
	//菜单类型维护
	public Object insertType(HashMap parameter){
		return sqlSessionTemplate.insert("typeConf.insert",parameter);
	}
	
	public List<Map> queryType (HashMap parameter){
		return sqlSessionTemplate.selectList("typeConf.query",parameter);
	}
	
	public Object updateType (HashMap parameter){
		return sqlSessionTemplate.update("typeConf.update",parameter);
	} 
	
	public Object deleteType(HashMap parameter){
		return sqlSessionTemplate.update("typeConf.delete",parameter);
	} 
}
