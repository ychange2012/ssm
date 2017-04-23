package com.demo.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;

import com.demo.model.User;

public class TableDaoImpl {
	private SqlSessionTemplate sqlSessionTemplate;
	private final String NPSTR="table.";
	public void setSqlSessionTemplate(SqlSessionTemplate sqlSessionTemplate) {
		this.sqlSessionTemplate = sqlSessionTemplate;
	}
	
	public Object insert(HashMap parameter){
		return sqlSessionTemplate.insert(NPSTR+"insert",parameter);
	}
	
	public List<Map> query (HashMap parameter){
		return sqlSessionTemplate.selectList(NPSTR+"query",parameter);
	}
	
	public List<Map> queryCount (HashMap parameter){
		return sqlSessionTemplate.selectList(NPSTR+"queryCount",parameter);
	}
	
	public Object update (HashMap parameter){
		return sqlSessionTemplate.update(NPSTR+"update",parameter);
	}
	
	public Object delete (HashMap parameter){
		return sqlSessionTemplate.delete(NPSTR+"delete",parameter);
	}
	
	public List<Map> queryBankTable (HashMap parameter){
		return sqlSessionTemplate.selectList(NPSTR+"queryBankTable",parameter);
	}
	
}
