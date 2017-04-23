package com.demo.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;

import com.demo.model.User;

public class SysConfDaoImpl {
	private SqlSessionTemplate sqlSessionTemplate;
	private final String NPSTR="sysConf.";
	public void setSqlSessionTemplate(SqlSessionTemplate sqlSessionTemplate) {
		this.sqlSessionTemplate = sqlSessionTemplate;
	}
	
	public List<Map> queryAll (HashMap parameter){
		return sqlSessionTemplate.selectList(NPSTR+"queryAll",parameter);
	}
}
