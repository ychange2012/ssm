package com.demo.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.demo.dao.SysConfDaoImpl;
import com.demo.dao.UserDaoImpl;
import com.demo.util.MD5Util;

public class BaseService {
	private UserDaoImpl userDao;
	private SysConfDaoImpl sysConfDao;
	public void setUserDao(UserDaoImpl userDao) {
		this.userDao = userDao;
	}
	
	
	public void setSysConfDao(SysConfDaoImpl sysConfDao) {
		this.sysConfDao = sysConfDao;
	}


	public Map register(HashMap parameter){
		parameter.put("PASSWORD", MD5Util.MD5((String)parameter.get("PASSWORD")));
		//检查用户名是否唯一
		List list = userDao.checkAccount(parameter);
		HashMap result = new HashMap();
		if(list.size()==0){
			userDao.register(parameter);
			result.put("result", "ok");
		}
		else{
			result.put("result", "error");
			result.put("msg", "账号已存在");
		}
		return result;
	}
	
	public Map login(HashMap parameter){
		parameter.put("PASSWORD", MD5Util.MD5((String)parameter.get("PASSWORD")));
		parameter.put("IS_DELETE", "0");
		List temp = userDao.login(parameter);
		HashMap result = new HashMap();
		if(temp.size()==1){
			result.put("result", "ok");
			result.put("data", temp);
		}else{
			result.put("result", "error");
		}
		return result;
	}
	
	public Map updatePassword(HashMap parameter){
		HashMap result = new HashMap();
		parameter.put("PASSWORD", MD5Util.MD5((String)parameter.get("OLDPASSWORD")));
		List temp = userDao.login(parameter);
		if(temp.size()!=1){
			result.put("result", "error");
			result.put("msg", "原密码错误");
			return result;
		}
		parameter.put("PASSWORD", MD5Util.MD5((String)parameter.get("NEWPASSWORD")));
		String str = userDao.update(parameter).toString();
		if("1".equals(str))
			result.put("result", "ok");
		else
			result.put("result", "error");
		return result;
	}
	
	public Map update(HashMap parameter){
		parameter.put("PASSWORD", MD5Util.MD5((String)parameter.get("PASSWORD")));
		HashMap result = new HashMap();
		String str = userDao.update(parameter).toString();
		if("1".equals(str))
			result.put("result", "ok");
		else
			result.put("result", "error");
		return result;
	}
	
	public Map queryList(HashMap parameter){
		HashMap result = new HashMap();
		parameter.put("IS_DELETE", "0");
		result.put("data",userDao.queryAll(parameter));
		result.put("count", userDao.queryCount(parameter).size());
		return result;
	}
	
	
	public Map queryMenConf(HashMap parameter){
		HashMap result = new HashMap();
		result.put("data",sysConfDao.queryAll(parameter));
		return result;
	}
}
