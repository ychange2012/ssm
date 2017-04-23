package com.demo.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.demo.dao.demoDaoImpl;
import com.demo.model.User;


public class demoService {
	private demoDaoImpl userDao;
	
	public void setUserDao(demoDaoImpl userDao) {
		this.userDao = userDao;
	}

	public User get() throws Exception{
		return userDao.findUserById(2);
	}
	public void insert(HashMap parameter)throws Exception{
		userDao.insert(parameter);
	}
	
	
	////////////////////////////////
	public Object insertTest(HashMap parameter) throws Exception{
		return userDao.insertTest(parameter);
	}
	
	public Object deleteTest(HashMap parameter) throws Exception{
		return userDao.deleteTest(parameter);
	}
	
	public Object updateTest(HashMap parameter) throws Exception{
		return userDao.updateTest(parameter);
	}
	
	public List queryTest(HashMap parameter) throws Exception{
		return userDao.queryTest(parameter);
	}
}
