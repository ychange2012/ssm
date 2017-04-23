package com.demo.command;

import java.lang.annotation.Annotation;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.AbstractController;

import com.demo.model.User;
import com.demo.service.demoService;


@Controller
public class test   {

	
	private demoService userService;

	@RequestMapping("/command/hello")
	public String  hello(HttpServletRequest request) throws Exception{
		//System.out.println("--------------"+request.getAttribute("id"));
//		Map map = request.getParameterMap();
//		map.put("aaa", "sada");
//		System.out.println("==============="+map.get("id"));
//		System.out.println("--------------------"+map);
//		User user = userService.get();
//		System.out.println(user.getId()+"========="+user.getUsername());
		request.setCharacterEncoding("utf-8");
		Map map = new HashMap();
	     Enumeration paramNames = request.getParameterNames();
	    while (paramNames.hasMoreElements()) {
	      String paramName = (String) paramNames.nextElement();

	      String[] paramValues = request.getParameterValues(paramName);
	      if (paramValues.length == 1) {
	        String paramValue = paramValues[0];
	        if (paramValue.length() != 0) {
	          System.out.println("参数：" + paramName + "=" + paramValue);
	          map.put(paramName, paramValue);
	        }
	      }
	    }
	    map.put("aaa", "adda");
	    System.out.println("================="+map);
		//UserService userService = new UserService();
		return  "login";
	}
	@RequestMapping("/api/hello")
	public String  hello2(HttpServletRequest request) throws Exception{
		request.setCharacterEncoding("utf-8");
		Map map = new HashMap();
	     Enumeration paramNames = request.getParameterNames();
	    while (paramNames.hasMoreElements()) {
	      String paramName = (String) paramNames.nextElement();

	      String[] paramValues = request.getParameterValues(paramName);
	      if (paramValues.length == 1) {
	        String paramValue = paramValues[0];
	        if (paramValue.length() != 0) {
	          System.out.println("参数：" + paramName + "=" + paramValue);
	          map.put(paramName, paramValue);
	        }
	      }
	    }
	    map.put("aaa", "adda");
	    System.out.println("================="+map);
		//UserService userService = new UserService();
		return  "login";
	}
	
	@RequestMapping("/api/test0")
	public String testAction(HttpServletRequest request) throws Exception{
		request.setCharacterEncoding("utf-8");
		////////////////////////////////////////////增加
		System.out.println(request.getParameter("name"));
		HashMap parameter = new HashMap();
		parameter.put("NAME",request.getParameter("name") );
		userService.insertTest(parameter);
		System.out.println("id="+parameter.get("id"));
		////////////////////////////////////////////删除
		parameter.put("ID",request.getParameter("id"));
		System.out.println("delete返回"+userService.deleteTest(parameter));
		////////////////////////////////////////////更新
		parameter.put("ID","1");
		parameter.put("NAME","名字测试");
		parameter.put("DATE","2010-11-21");
		System.out.println("update返回"+userService.updateTest(parameter));
		////////////////////////////////////////////查询
		parameter.clear();
		List<Map> tempList=userService.queryTest(parameter);
		System.out.println("数据长度"+tempList.size());
		System.out.println("ID："+tempList.get(0).get("ID"));
		System.out.println("名字："+tempList.get(0).get("NAME"));
		System.out.println("日期："+tempList.get(0).get("DATE"));
		
		return  "success";
	}
	
	//返回json数据
	 @RequestMapping(value="/testJson")  
	  @ResponseBody
	  public Map hello3(HttpServletRequest request) throws Exception{
		 request.setCharacterEncoding("utf-8");
		 HashMap parameter = new HashMap();
		 List<Map> tempList=userService.queryTest(parameter);
			System.out.println("数据长度"+tempList.size());
			System.out.println("ID："+tempList.get(0).get("ID"));
			System.out.println("名字："+tempList.get(0).get("NAME"));
			System.out.println("日期："+tempList.get(0).get("DATE"));
			parameter.put("data", tempList);
		 return parameter;
	 }
	 
	 
	 
	
//	@Override
//	protected ModelAndView handleRequestInternal(HttpServletRequest arg0,
//			HttpServletResponse arg1) throws Exception {
//		User user = userService.get();
//		System.out.println(user.getId()+"========="+user.getUsername());
//		//return "hello";
//		HashMap map = new HashMap();
//		map.put("username", "用户名2");
//		userService.insert(map);
//		 ModelAndView mav=new ModelAndView("hello");
//		 return mav;
//
//	}
	
}
