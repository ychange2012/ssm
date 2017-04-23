<%@ page language="java" import="java.util.*,com.demo.model.*" pageEncoding="utf-8"%>

<!DOCTYPE HTML>
<html>
  <head>
    <title>Thin Admin</title>
	<meta name="viewport" content="width=device-width, initial-scale=1.0" />
	<!-- Bootstrap -->
	<link href="css/bootstrap.css" rel="stylesheet" media="screen" />
	<link href="css/thin-admin.css" rel="stylesheet" media="screen" />
	<link href="css/font-awesome.css" rel="stylesheet" media="screen" />
	<link href="style/style.css" rel="stylesheet" />
	<link href="style/dashboard.css" rel="stylesheet" />
  </head>
  <%
   String mid=request.getParameter("mid")==null ? "0":request.getParameter("mid");
   %>
   <script src="js/jquery.js"></script> 
   <script type="text/javascript">
  
	var mendId='<%=mid%>';	
</script>
  <body>
   <div class="container">
  <div class="top-navbar header b-b"> <a data-original-title="Toggle navigation" class="toggle-side-nav pull-left" href="#"><i class="icon-reorder"></i> </a>
    <div class="brand pull-left"> <a href="index.html"><img src="images/logo.png" width="147" height="33" /></a></div>
    
    <ul class="nav navbar-nav navbar-right  hidden-xs">
     
     
     
      <li class="dropdown user  hidden-xs"> <a data-toggle="dropdown" class="dropdown-toggle" href="#"> <i class="icon-male"></i> <span class="username" id="nameTitle"></span>  </a>
        
      </li>
    </ul>
    
  </div>
</div>
<div class="wrapper">
  <div class="left-nav">
    <div id="side-nav">
      <ul id="nav">
        
      </ul>
    </div>
 
   </div>
<!-- jQuery (necessary for Bootstrap's JavaScript plugins) --> 
<script src="js/jquery.js"></script> 

<script src="js/bootstrap.min.js"></script> 
<script type="text/javascript" src="js/sysConf.js"></script> 
<script type="text/javascript" src="js/smooth-sliding-menu.js"></script> 


</body>
  </body>
</html>
