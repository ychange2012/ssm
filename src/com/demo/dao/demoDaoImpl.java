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

public class demoDaoImpl {

	private SqlSessionTemplate sqlSessionTemplate;
	
	public void setSqlSessionTemplate(SqlSessionTemplate sqlSessionTemplate) {
		this.sqlSessionTemplate = sqlSessionTemplate;
	}

	
	public User findUserById(int id) throws Exception {
		//继承SqlSessionDaoSupport，通过this.getSqlSession()得到sqlSessoin
		//SqlSession sqlSession = this.getSqlSession();
		//User user = sqlSession.selectOne("test.findUserById", id);
		User user = sqlSessionTemplate.selectOne("test.findUserById", id);
		return user;

	}
	
	public void insert (HashMap parameter)throws Exception {
	
		int i = sqlSessionTemplate.insert("test.insert", parameter);
//		sqlSessionTemplate.commit();
//		sqlSessionTemplate.close();
//		sqlSession.commit();
//      sqlSession.close();
		System.out.println("===================="+i);
	}
	
	public Object insertTest(HashMap parameter)throws Exception {
		return sqlSessionTemplate.insert("test.insertTest",parameter);
	}
	
	public Object deleteTest(HashMap parameter)throws Exception {
		return sqlSessionTemplate.delete("test.deleteTest",parameter);
	}
	
	public Object updateTest(HashMap parameter)throws Exception {
		return sqlSessionTemplate.update("test.updateTest",parameter);
	}
	
	public List queryTest(HashMap parameter)throws Exception {
		return sqlSessionTemplate.selectList("test.queryTest", parameter);
	}
}
