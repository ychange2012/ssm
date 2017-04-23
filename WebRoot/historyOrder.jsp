<%@ page language="java" import="java.util.*" pageEncoding="utf-8" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html>
<head>
<title>账号管理</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<!-- Bootstrap -->
<link href="css/bootstrap.css" rel="stylesheet" media="screen" />
<link href="css/thin-admin.css" rel="stylesheet" media="screen" />
<link href="css/font-awesome.css" rel="stylesheet" media="screen" />
<link href="style/style.css" rel="stylesheet" />
<link href="style/dashboard.css" rel="stylesheet" />

<!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
<!--[if lt IE 9]>
      <script src="../../assets/js/html5shiv.js"></script>
      <script src="../../assets/js/respond.min.js"></script>
    <![endif]-->


<meta http-equiv="Content-Type" content="text/html; charset=utf-8" /></head>
<body>
 <jsp:include page="headPage.jsp"/>
   <div class="page-content" style="height: 100%">
 <div class="row">
        <div class="col-lg-12">
          <div class="widget">
            <div class="widget-header"> <i class="icon-list-alt"></i>
              <h3>历史菜单列表</h3>
              <input type="date" placeholder="时间搜索" id="search-input" class="input-sm text-left" style="margin-right: 10px;"/>
               <button type="button" class="btn btn-default btn-sm text-right" style="margin-right: 10px;" onclick="searchByDate();" >搜索</button>
            </div>
            <div class="widget-content">
              <div class="body">
                <table class="table table-striped">
                  <thead>
                    <tr>
                      <th>序号</th>
                      <th>座位名称</th>
                      <th>下单时间</th>
                      <th>预定时间</th>
                      <th>手机号码</th>
                      <th>总金额</th>
                      <th>订单状态</th>
                      <th></th>
                    </tr>
                  </thead>
                  <tbody id="tableList">
                   <!-- 引擎模版 -->
				   <script id="table-template" type="text/x-handlebars-template">
 					{{#each data}}
                    <tr>
                      <td>{{addIndex 0}}</td>
                      <td>{{TABLE_NAME}}</td>
                      <td>{{CREATE_TIME}}</td>
                      <td>{{ORDER_TIME}}</td>
                      <td>{{CLIENT_TEL}}</td>
  					  <td>{{TOTAL}}</td>
  					  <td>{{{strChange STATUS}}}</td>
  					  <td> <button data-toggle="button" class="btn btn-sm btn-warning" onclick="openDialog({{ID}})"> 详情 </button></td>
                    </tr>
					{{/each}}
     				</script>
  					<!-- end -->
                  </tbody>
                </table>
              </div>
            </div>
          </div>
        </div>
        </div>
  </div>
  </div>
    <!-- 模态框开始 -->
       <div style="display: none;" aria-hidden="true" aria-labelledby="myModalLabel" role="dialog" tabindex="-1" class="modal fade" id="orderDetail">
                  <div class="modal-dialog">
                    <div class="modal-content">
                      <div class="modal-header">
                        <button aria-hidden="true" data-dismiss="modal" class="close" type="button">x</button>
                        <h4 id="myModalLabel" class="modal-title">订单详情</h4>
                      </div>
                      <div class="modal-body">
                       <div class="body" style="color:black;">
            			 <table class="table table-bordered">
		                  <thead style="color:black;">
		                    <tr>
		                      <th style="color:black;">菜名</th>
		                      <th style="color:black;">单价</th>
		                      <th  style="color:black;">数目</th>
		                    </tr>
		                  </thead>
		                  <tbody id="modalList">
		                  <!-- 引擎模版 -->
   						<script id="model-template" type="text/x-handlebars-template">
 							{{#each data}}
		                    <tr>
		                      <td>{{MENU_NAME}}</td>
		                      <td>{{PRICE}}</td>
		                      <td>{{COUNT}}</td>
		                    </tr>
							{{/each}}
    					 </script>
						  <!-- end -->
		                  </tbody>
               			 </table>
          			  </div>
                      </div>
                      <div class="modal-footer">
                        <button data-dismiss="modal" class="btn btn-default" type="button">关闭</button>
                      </div>
                    </div>
                    <!-- /.modal-content --> 
                  </div>
                  <!-- /.modal-dialog --> 
                </div>
   <!-- 模态框结束 -->
  <jsp:include page="footerPage.jsp"/>
   <script type="text/javascript" src="js/handlebars-v4.0.5.js"></script> 
<script type="text/javascript" src="js/historyOrder.js"></script> 
</body>
</html>
