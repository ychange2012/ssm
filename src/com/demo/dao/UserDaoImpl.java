package com.demo.dao;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;

import com.demo.model.User;

public class UserDaoImpl {
	private SqlSessionTemplate sqlSessionTemplate;
	private final String NPSTR="user.";
	public void setSqlSessionTemplate(SqlSessionTemplate sqlSessionTemplate) {
		this.sqlSessionTemplate = sqlSessionTemplate;
	}
	
	public Object register(HashMap parameter){
		return sqlSessionTemplate.insert(NPSTR+"insert",parameter);
	}
	
	public List<User> login (HashMap parameter){
		return sqlSessionTemplate.selectList(NPSTR+"query",parameter);
	}
	
	public List<User> checkAccount (HashMap parameter){
		HashMap temp = new HashMap();
		temp.put("ACCOUNT", parameter.get("ACCOUNT"));
		return sqlSessionTemplate.selectList(NPSTR+"query",temp);
	}
	
	public Object update (HashMap parameter){
		return sqlSessionTemplate.update(NPSTR+"update",parameter);
	}
	public List<User> queryAll (HashMap parameter){
		return sqlSessionTemplate.selectList(NPSTR+"query",parameter);
	}
	
	public List queryCount (HashMap parameter){
		return sqlSessionTemplate.selectList(NPSTR+"queryCount",parameter);
	}
}
