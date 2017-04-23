<%@ page language="java" import="java.util.*" pageEncoding="utf-8" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
String httpIp = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort();
%>
<!DOCTYPE html>
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
<link class="include" rel="stylesheet" type="text/css" href="style/jquery.jqplot.min.css" />
<!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
<!--[if lt IE 9]>
      <script src="../../assets/js/html5shiv.js"></script>
      <script src="../../assets/js/respond.min.js"></script>
    <![endif]-->


<meta http-equiv="Content-Type" content="text/html; charset=utf-8" /></head>
<body>
<jsp:include page="headPage.jsp"/>
   <div class="page-content">
      
      <div class="row">
        <div class="col-lg-8">
          <div class="widget">
            <div class="widget-header"> <i class="icon-tasks"></i>
              <h3>近5年营业情况</h3>
            </div>
            <div class="widget-content">
              <div id="chart1" style="width:100%; height:350px"></div>
            </div>
          </div>
        </div>
        <div class="col-lg-4">
          <div class="widget">
            <div class="widget-header"> <i class="icon-tasks"></i>
              <h3>种类销售占比</h3>
            </div>
            <div class="widget-content">
              <div id="chart7" style="width:100%; height:350px;"></div>
            </div>
          </div>
        </div>
      </div>
     
      <div class="row">
        <div class="col-lg-12">
          <div class="widget">
            <div class="widget-header"> <i class="icon-tasks"></i>
              <h3>今年订单数统计</h3>
            </div>
            <div class="widget-content">
              <div id="chart5" style="height:350px; width:100%;"></div>
            </div>
          </div>
        </div>
      </div>
      </div>
      </div>
 <jsp:include page="footerPage.jsp"/>
<!-- jQuery (necessary for Bootstrap's JavaScript plugins) --> 
<script src="js/jquery.js"></script> 
<script src="js/bootstrap.min.js"></script> 
<script type="text/javascript" src="js/smooth-sliding-menu.js"></script> 
<script class="include" type="text/javascript" src="javascript/jquery191.min.js"></script> 
<script class="include" type="text/javascript" src="javascript/jquery.jqplot.min.js"></script> 
<!-- Additional plugins go here --> 

<script class="include" type="text/javascript" src="javascript/jqplot.barRenderer.min.js"></script> 
<script class="include" type="text/javascript" src="javascript/jqplot.highlighter.min.js"></script> 
<script class="include" type="text/javascript" src="javascript/jqplot.cursor.min.js"></script> 
<script class="include" type="text/javascript" src="javascript/jqplot.pointLabels.min.js"></script> 
<script class="include" type="text/javascript" src="javascript/jqplot.dateAxisRenderer.min.js"></script> 
<script class="include" type="text/javascript" src="javascript/jqplot.logAxisRenderer.min.js"></script> 
<script class="include" type="text/javascript" src="javascript/jqplot.canvasTextRenderer.min.js"></script> 
<script class="include" type="text/javascript" src="javascript/jqplot.canvasAxisTickRenderer.min.js"></script> 
<script class="include" type="text/javascript" src="javascript/jqplot.pieRenderer.min.js"></script> 
<script class="include" language="javascript" type="text/javascript" src="javascript/jqplot.donutRenderer.min.js"></script> 
<script class="include" language="javascript" type="text/javascript" src="javascript/jqplot.categoryAxisRenderer.min.js"></script> 
<!-- End additional plugins -->
<script class="include" type="text/javascript" src="js/bar-animated.js"></script> <!-- char1 -->
<script class="include" type="text/javascript" src="js/pie.js"></script> <!--char7 -->
<script class="include" type="text/javascript" src="js/line-charts.js"></script> <!-- char5 -->
</body>
</html>
