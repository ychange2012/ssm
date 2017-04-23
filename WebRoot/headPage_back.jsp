<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>

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
  
  <body>
   <div class="container">
  <div class="top-navbar header b-b"> <a data-original-title="Toggle navigation" class="toggle-side-nav pull-left" href="#"><i class="icon-reorder"></i> </a>
    <div class="brand pull-left"> <a href="index.html"><img src="images/logo.png" width="147" height="33" /></a></div>
    
    <ul class="nav navbar-nav navbar-right  hidden-xs">
     
     
     
      <li class="dropdown user  hidden-xs"> <a data-toggle="dropdown" class="dropdown-toggle" href="#"> <i class="icon-male"></i> <span class="username">John Doe</span> <i class="icon-caret-down small"></i> </a>
        <ul class="dropdown-menu">
          <li><a href="#"><i class="icon-user"></i> 个人资料</a></li>
             <li class="divider"></li>
          <li><a href="#"><i class="icon-key"></i> 退出</a></li>
        </ul>
      </li>
    </ul>
    
  </div>
</div>
<div class="wrapper">
  <div class="left-nav">
    <div id="side-nav">
      <ul id="nav">
        <li class="current"> <a href="index.html"> <i class="icon-dashboard"></i> Dashboard </a> </li>
        <li> <a href="#"> <i class="icon-desktop"></i> UI Features <span class="label label-info pull-right">7</span> <i class="arrow icon-angle-left"></i></a>
          <ul class="sub-menu">
            <li> <a href="buttons.html"> <i class="icon-angle-right"></i> Buttons </a> </li>
            <li> <a href="tabs.html"> <i class="icon-angle-right"></i> Tabs</a> </li>
            <li> <a href="accordions.html"> <i class="icon-angle-right"></i> Accordions </a> </li>
            <li> <a href="nestable.html"> <i class="icon-angle-right"></i> Nestable List </a> </li>
            <li> <a href="icons.html"> <i class="icon-angle-right"></i> Icons </a> </li>
            <li> <a href="grid.html"> <i class="icon-angle-right"></i> Grid </a> </li>
            <li> <a href="dialogs.html"> <i class="icon-angle-right"></i> Dialogs </a> </li>
          </ul>
        </li>
        <li> <a href="form.html"> <i class="icon-edit"></i> Form Elements</a></li>
        <li> <a href="table.html"> <i class="icon-table"></i> Tables</a> </li>
        <li> <a href="chart.html"> <i class="icon-bar-chart"></i> Charts &amp; Statistics </a> </li>
        <li> <a href="gallery.html"> <i class="icon-picture"></i> Gallery </a> </li>
        <li> <a href="#"> <i class="icon-folder-open-alt"></i> Pages <span class="label label-info pull-right">4</span> <i class="arrow icon-angle-left"></i></a>
          <ul class="sub-menu">
            <li> <a href="login.html"> <i class="icon-angle-right"></i> Login </a> </li>
            <li> <a href="user_profile.html"> <i class="icon-angle-right"></i> User Profile </a> </li>
            <li> <a href="fullCalendar.html"> <i class="icon-angle-right"></i> Calendar </a> </li>
            <li> <a href="404-page.html"> <i class="icon-angle-right"></i> 404-page </a> </li>
          </ul>
        </li>
      </ul>
    </div>
  </div>
   <div class="page-content">
   </div>

<!-- jQuery (necessary for Bootstrap's JavaScript plugins) --> 
<script src="js/jquery.js"></script> 
<script src="js/bootstrap.min.js"></script> 
<script type="text/javascript" src="js/smooth-sliding-menu.js"></script> 

</body>
  </body>
</html>
