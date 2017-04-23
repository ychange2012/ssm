package com.demo.Interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.demo.model.User;

public class LoginInterceptor extends HandlerInterceptorAdapter {

	private String outsideOfficeHoursPage = "http://127.0.0.1:8080/ssm/index.jsp"; 
	  
    public boolean preHandle(HttpServletRequest request,  
            HttpServletResponse response, Object handler) throws Exception {  
    	System.out.println("--------------------拦截器测试测试！！");  
    	HttpSession session = request.getSession();
    	User user =(User) session.getAttribute("ACCOUNT");
    	System.out.println("session========="+user);
    	String type = request.getHeader("X-Requested-With");  
    	if(user==null){
    		System.out.println("000000000000");
    	}
//        //判断有没有登录session
    	if(user!=null){
    	//if (2==3) { 
            return true;  
        } else {   
        	if (request.getHeader("x-requested-with")!=null&&"XMLHttpRequest".equalsIgnoreCase(type))  //ajax类型
        	{  System.out.println("ajax请求");
        			response.setHeader("sessionstatus","timeout");//在响应头设置session状态   
        			response.setHeader("outsideOfficeHoursPage","index.jsp");
        	}else
        			 response.sendRedirect("index.jsp");
        	
        			return false;
        }  
    	
    	
    }  
  
    public void postHandle(HttpServletRequest request,  
            HttpServletResponse response, Object o, ModelAndView mav)  
            throws Exception {  
        System.out.println("postHandle");  
    }  
  
    public void afterCompletion(HttpServletRequest request,  
            HttpServletResponse response, Object o, Exception excptn)  
            throws Exception {  
        System.out.println("afterCompletion");  
    }  
}
