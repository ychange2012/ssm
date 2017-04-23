package com.demo.command;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.demo.model.User;
import com.demo.service.BaseService;
import com.demo.util.MapUtil;

@Controller
public class LoginCommand {
		@Autowired
		private BaseService baseService;
		
		@RequestMapping(value="/loginCommand")  
		@ResponseBody
		public HashMap  loginAction(HttpServletRequest request) throws Exception{
			request.setCharacterEncoding("utf-8");
			HashMap parameter = MapUtil.requestToMap(request);
			HashMap result = new HashMap();
			String action = (String)parameter.get("ACTION");
			if("login".equals(action)){
				//登录
				System.out.println(" login ");
				result = (HashMap) baseService.login(parameter);
				if("ok".equals(result.get("result"))){
					//使用request对象的getSession()获取session，如果session不存在则创建一个
					HttpSession session = request.getSession();
					List<User> temp = (List<User>)result.get("data");
					//将数据存储到session中(将账号信息存储)
					session.setAttribute("ACCOUNT",temp.get(0));
					//session.removeAttribute("ACCOUNT");
					//获取session的Id
					String sessionId = session.getId();
				}
			}
			else
				result.put("result", "error");
			return result;
		}
		/**
		 * 退出登录
		 * @param request
		 * @return
		 * @throws Exception
		 */
		@RequestMapping("/logout")
		public String  logoutAction(HttpServletRequest request) throws Exception{
			System.out.println(" logout ");
			HttpSession session = request.getSession();
			session.removeAttribute("ACCOUNT");
			//退出登录后，返回首页
			return "index";
		}
	}

