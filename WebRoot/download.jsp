<%@ page language="java" import="java.util.*,com.jspsmart.upload.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML>
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>download.jsp</title>
    
	
  </head>
  
  <body>
  </body>
</html>
<%
	request.setCharacterEncoding("UTF-8");
	String filePath = request.getParameter("savePath");
	System.out.println(filePath);
    //path = Util.getStr2(path);
    //path = URLDecoder.decode(path,"UTF-8");
    String fileName = request.getParameter("fileName");
    System.out.println(fileName);
	// 新建一个SmartUpload对象
	SmartUpload su = new SmartUpload();
	// 初始化
	su.initialize(pageContext);
	// 设定contentDisposition为null以禁止浏览器自动打开文件，
	//保证点击链接后是下载文件。若不设定，则下载的文件扩展名为doc时，浏览器将自动用word打开它。
	//扩展名为pdf时，浏览器将用acrobat打开。
	su.setContentDisposition(null);
	// 下载文件，保证Web应用下的upload目录下有测试文档.doc文件。
	su.downloadFile(filePath,"UTF-8","图片1.jpg");
	out.clear();
 	out = pageContext.pushBody();
%>