package com.demo.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.mybatis.spring.SqlSessionTemplate;
import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.stereotype.Repository;

import com.demo.model.User;

public class MessageDaoImpl {

	private SqlSessionTemplate sqlSessionTemplate;
	private final String NPSTR="message.";
	public void setSqlSessionTemplate(SqlSessionTemplate sqlSessionTemplate) {
		this.sqlSessionTemplate = sqlSessionTemplate;
	}
	
	public Object insert(HashMap parameter)throws Exception {
		return sqlSessionTemplate.insert(NPSTR+"insert",parameter);
	}
	
	public Object update(HashMap parameter)throws Exception {
		return sqlSessionTemplate.update(NPSTR+"update",parameter);
	}
	
	public List query(HashMap parameter)throws Exception {
		return sqlSessionTemplate.selectList(NPSTR+"query", parameter);
	}
}
