package com.demo.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.demo.dao.MessageDaoImpl;
import com.demo.dao.demoDaoImpl;
import com.demo.model.User;


public class MessageService {
	private MessageDaoImpl messageDao;
	
	public void setMessageDao(MessageDaoImpl messageDao) {
		this.messageDao = messageDao;
	}

	
	public Object insert(HashMap parameter) throws Exception{
		return messageDao.insert(parameter);
	}
	
	public Map update(HashMap parameter) throws Exception{
		Map map = new HashMap();
		map.put("flag", messageDao.update(parameter));
		map.put("result","ok");
		return map;
	}
	
	public List query(HashMap parameter) throws Exception{
		return messageDao.query(parameter);
	}
}
