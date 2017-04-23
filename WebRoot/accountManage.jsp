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
            <div class="widget-header"> <i class="icon-list"></i>
              <h3>账号列表</h3>
               <input type="search" placeholder="搜索内容" id="search-input" class="input-sm text-left" style="margin-right: 10px;"/>
               <button type="button" class="btn btn-default btn-sm text-right" style="margin-right: 10px;" onclick="searchAccount();">搜索</button>
               <button type="button" class="btn btn-success btn-sm icon-plus-sign" style="margin-left: 100px;" onclick="addAccount();" > 添加用户</button>
            </div>
            <div class="widget-content">
              <div class="body">
                <table class="table table-colored table-condensed">
                  <thead>
                    <tr>
                      <th>序号</th>
                      <th>账号</th>
                      <th class="hidden-xs-portrait">用户名</th>
                      <th>手机号码</th>
                      <th class="hidden-xs-portrait">账号类型</th>
                      <th >操作</th>
                    </tr>
                  </thead>
                  <tbody id="tableList">
                   
                  </tbody>
                </table>
              </div>
            </div>
          </div>
        </div>
       </div>
  </div>
  </div>
  <!-- 引擎模版 -->
   <script id="table-template" type="text/x-handlebars-template">
 	{{#each data}}
    <tr>
 	  <td>{{addIndex 0}}</td>
      <td>{{account}}</td>
      <td class="hidden-xs-portrait">{{username}}</td>
      <td>{{tel}}</td>
      <td class="hidden-xs-portrait">{{{strChange flag}}}</td>
      <td><button class="btn btn-sm btn-primary" onclick="openDialog({{id}},1)"> 修改 </button>
      <button data-toggle="button" class="btn btn-sm btn-warning" onclick="openDialog({{id}},0)"> 删除 </button>
      </td>
	</tr>
	{{/each}}
     </script>
  <!-- end -->
  <!-- 模态框开始 -->
       <div style="display: none;" aria-hidden="true" aria-labelledby="myModalLabel" role="dialog" tabindex="-1" class="modal fade" id="addUser">
                  <div class="modal-dialog">
                    <div class="modal-content">
                      <div class="modal-header">
                        <button aria-hidden="true" data-dismiss="modal" class="close" type="button">x</button>
                        <h4 id="myModalLabel" class="modal-title">填写基本信息</h4>
                      </div>
                      <div class="modal-body">
                       <div>
                <fieldset>
                  <div class="control-group">
                    <label for="tooltip-enabled" class="control-label ">姓名</label>
                    <div class="controls form-group">
                      <input type="text" placeholder="UserName"  data-placement="top" class="form-control" id="userName" />
                    </div>
                  </div>
                  <div class="control-group">
                    <label for="disabled-input" class="control-label ">账号</label>
                    <div class="controls form-group">
                      <input type="text" placeholder="Account" data-placement="top" class="form-control" id="account" />
                    </div>
                  </div>
                   <div class="control-group">
                    <label for="disabled-input" class="control-label ">账号类型</label>
                    <div class="controls form-group">
                      <select id="type" class="form-control">
                      <option value ="0">管理员</option>
                      <option value ="1">经理</option>
                      <option value ="2">服务员</option>
                      <option value ="3">厨师</option>
                      </select>
                    </div>
                  </div>
                  <div class="control-group">
                    <label for="max-length" class="control-label ">手机号码</label>
                    <div class="controls form-group">
                      <input type="text" data-placement="top" placeholder="Tel" class="form-control"  id="tel" />
                    </div>
                  </div>
                   <div class="control-group">
                    <label for="password-field" class="control-label">密码</label>
                    <div class="controls form-group">
                      <div class="input-group"> <span class="input-group-addon"><i class="icon-lock"></i></span>
                        <input type="password" placeholder="Password" id="password1" class="form-control" />
                      </div>
                    </div>
                  </div>
                  <div class="control-group">
                    <label for="password-field" class="control-label">重复密码</label>
                    <div class="controls form-group">
                      <div class="input-group"> <span class="input-group-addon"><i class="icon-lock"></i></span>
                        <input type="password" placeholder="Password" id="password2" class="form-control" />
                      </div>
                    </div>
                  </div>
                </fieldset>
            </div>
                      </div>
                      <div class="modal-footer">
                        <button data-dismiss="modal" class="btn btn-default" type="button">关闭</button>
                        <button class="btn btn-primary" type="button" onclick="addPost();">提交</button>
                      </div>
                    </div>
                    <!-- /.modal-content --> 
                  </div>
                  <!-- /.modal-dialog --> 
                </div>
   <!-- 模态框结束 -->
   <!-- 模态框开始 -->
       <div style="display: none;" aria-hidden="true" aria-labelledby="myModalLabel" role="dialog" tabindex="-1" class="modal fade" id="editUser">
                  <div class="modal-dialog">
                    <div class="modal-content">
                      <div class="modal-header">
                        <button aria-hidden="true" data-dismiss="modal" class="close" type="button">x</button>
                        <h4 id="myModalLabel" class="modal-title">填写基本信息</h4>
                      </div>
                      <div class="modal-body">
                       <div>
                <fieldset>
                <input id="editId" type="hidden">
                  <div class="control-group">
                    <label for="tooltip-enabled" class="control-label ">姓名</label>
                    <div class="controls form-group">
                      <input type="text" placeholder="UserName"  data-placement="top" class="form-control" id="userNameE" />
                    </div>
                  </div>
                  <div class="control-group">
                    <label for="disabled-input" class="control-label ">账号</label>
                    <div class="controls form-group">
                      <input type="text" placeholder="Account" data-placement="top" class="form-control" id="accountE" />
                    </div>
                  </div>
                   <div class="control-group">
                    <label for="disabled-input" class="control-label ">账号类型</label>
                    <div class="controls form-group">
                      <select id="typeE" class="form-control">
                      <option value ="0">管理员</option>
                      <option value ="1">经理</option>
                      <option value ="2">服务员</option>
                      <option value ="3">厨师</option>
                      </select>
                    </div>
                  </div>
                  <div class="control-group">
                    <label for="max-length" class="control-label ">手机号码</label>
                    <div class="controls form-group">
                      <input type="text" data-placement="top" placeholder="Tel" class="form-control"  id="telE" />
                    </div>
                  </div>
                   <div class="control-group">
                    <label for="password-field" class="control-label">密码</label>
                    <div class="controls form-group">
                      <div class="input-group"> <span class="input-group-addon"><i class="icon-lock"></i></span>
                        <input type="password" placeholder="Password" id="password1E" class="form-control" />
                      </div>
                    </div>
                  </div>
                  <div class="control-group">
                    <label for="password-field" class="control-label">重复密码</label>
                    <div class="controls form-group">
                      <div class="input-group"> <span class="input-group-addon"><i class="icon-lock"></i></span>
                        <input type="password" placeholder="Password" id="password2E" class="form-control" />
                      </div>
                    </div>
                  </div>
                </fieldset>
            </div>
                      </div>
                      <div class="modal-footer">
                        <button data-dismiss="modal" class="btn btn-default" type="button">关闭</button>
                        <button class="btn btn-primary" type="button" onclick="editPost();">提交</button>
                      </div>
                    </div>
                    <!-- /.modal-content --> 
                  </div>
                  <!-- /.modal-dialog --> 
                </div>
   <!-- 模态框结束 -->
  <jsp:include page="footerPage.jsp"/>
   <script type="text/javascript" src="js/handlebars-v4.0.5.js"></script> 
<script type="text/javascript" src="js/accountManage.js"></script> 
</body>
</html>
