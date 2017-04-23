package com.demo.service;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.demo.dao.demoDaoImpl;
import com.demo.model.User;


public class testMain {

	public static void main(String[] args) throws Exception {
		// TODO Auto-generated method stub
		ApplicationContext ac = new ClassPathXmlApplicationContext(
				"applicationContext.xml");
		demoDaoImpl userDao = (demoDaoImpl) ac.getBean("userDaoImpl");
		User user = userDao.findUserById(2);
		System.out.println(user.getId()+"========="+user.getUsername());
	}

}
