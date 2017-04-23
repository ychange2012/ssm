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
        <div class="col-lg-4">
          <div class="widget">
            <div class="widget-header"> <i class="icon-columns"></i>
              <h3>菜单维护</h3>
               <button type="button" class="btn btn-success btn-sm icon-plus-sign"  onclick="addType();" > 添加新类型</button>
            </div>
            <div class="widget-content">
              <div class="body">
                <table class="table table-bordered">
                  <thead>
                    <tr>
                      <th>序号</th>
                      <th>名称</th>
                      <th>操作</th>
                    </tr>
                  </thead>
                  <tbody id="typeList">
                   <script id="menuType-template" type="text/x-handlebars-template">
 					{{#each data}}
                    <tr>
                      <td>{{addIndex 0}}</td>
                      <td>{{TYPE_NAME}}</td>
                       <td><button class="btn btn-sm btn-primary" onclick="editType({{ID}});"> 修改 </button>
     				 <button data-toggle="button" class="btn btn-sm btn-warning" onclick="delType({{ID}});"> 删除 </button>
                    </tr>
					{{/each}}
     				</script>
                  </tbody>
                </table>
              </div>
            </div>
          </div>
        </div>
     <div class="col-lg-8">
          <div class="widget">
            <div class="widget-header"> <i class="icon-hand-up"></i>
              <h3>座位维护</h3>
              <button type="button" class="btn btn-success btn-sm icon-plus-sign"  onclick="addTable();" > 添加新座位</button>
            </div>
            <div class="widget-content">
              <div class="body">
                <table class="table table-hover">
                  <thead>
                    <tr>
                      <th>序号</th>
                      <th>名称</th>
                      <th class="hidden-xs-portrait">类型</th>
                      <th>可容人数</th>
                      <th class="hidden-xs-portrait">描述</th>
                      <th>操作</th>
                    </tr>
                  </thead>
                  <tbody id="tableList">
                  <script id="table-template" type="text/x-handlebars-template">
 					{{#each data}}
                    <tr>
                      <td>{{addIndex2 0}}</td>
                      <td>{{TABLE_NAME}}</td>
                      <td class="hidden-xs-portrait">{{TYPE}}</td>
                      <td>{{COUNT}}</a></td>
                      <td class="hidden-xs-portrait">{{TABLE_DES}}</td>
					<td><button class="btn btn-sm btn-primary" onclick="editTable({{ID}});"> 修改 </button>
     				 <button data-toggle="button" class="btn btn-sm btn-warning" onclick="delTable({{ID}});"> 删除 </button>
                    </tr>
					{{/each}}
     				</script>
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
       <div style="display: none;" aria-hidden="true" aria-labelledby="myModalLabel" role="dialog" tabindex="-1" class="modal fade" id="addTypeModel">
                  <div class="modal-dialog">
                    <div class="modal-content">
                      <div class="modal-header">
                        <button aria-hidden="true" data-dismiss="modal" class="close" type="button">x</button>
                        <h4 id="myModalLabel" class="modal-title">新增菜单类型</h4>
                      </div>
                      <div class="modal-body">
                       <div>
                <fieldset>
                  <div class="control-group">
                    <label for="tooltip-enabled" class="control-label ">菜单类型名称</label>
                    <div class="controls form-group">
                      <input type="text"  data-placement="top" class="form-control" id="typeName" />
                    </div>
                  </div>
                </fieldset>
           			 </div>
                      </div>
                      <div class="modal-footer">
                        <button data-dismiss="modal" class="btn btn-default" type="button">关闭</button>
                        <button class="btn btn-primary" type="button" onclick="addTypePost();">提交</button>
                      </div>
                    </div>
                    <!-- /.modal-content --> 
                  </div>
                  <!-- /.modal-dialog --> 
                </div>
   <!-- 模态框结束 -->
   <!-- 模态框开始 -->
       <div style="display: none;" aria-hidden="true" aria-labelledby="myModalLabel" role="dialog" tabindex="-1" class="modal fade" id="editTypeModel">
                  <div class="modal-dialog">
                    <div class="modal-content">
                      <div class="modal-header">
                        <button aria-hidden="true" data-dismiss="modal" class="close" type="button">x</button>
                        <h4 id="myModalLabel" class="modal-title">修改菜单类型</h4>
                      </div>
                      <div class="modal-body">
                       <div>
                <fieldset>
                <input type="hidden" id="typeId"/>
                  <div class="control-group">
                    <label for="tooltip-enabled" class="control-label ">菜单类型名称</label>
                    <div class="controls form-group">
                      <input type="text"  data-placement="top" class="form-control" id="typeNameE" />
                    </div>
                  </div>
                </fieldset>
            </div>
                      </div>
                      <div class="modal-footer">
                        <button data-dismiss="modal" class="btn btn-default" type="button">关闭</button>
                        <button class="btn btn-primary" type="button" onclick="editTypePost();">提交</button>
                      </div>
                    </div>
                    <!-- /.modal-content --> 
                  </div>
                  <!-- /.modal-dialog --> 
                </div>
   <!-- 模态框结束 -->
   <!-- 模态框开始 -->
       <div style="display: none;" aria-hidden="true" aria-labelledby="myModalLabel" role="dialog" tabindex="-1" class="modal fade" id="addTableModel">
                  <div class="modal-dialog">
                    <div class="modal-content">
                      <div class="modal-header">
                        <button aria-hidden="true" data-dismiss="modal" class="close" type="button">x</button>
                        <h4 id="myModalLabel" class="modal-title">新增座位</h4>
                      </div>
                      <div class="modal-body">
                       <div>
                <fieldset>
                  <div class="control-group">
                    <label for="tooltip-enabled" class="control-label ">名称</label>
                    <div class="controls form-group">
                      <input type="text" placeholder=""  data-placement="top" class="form-control" id="tableName" />
                    </div>
                  </div>
                  <div class="control-group">
                    <label for="disabled-input" class="control-label ">描述</label>
                    <div class="controls form-group">
                      <input type="text" placeholder="" data-placement="top" class="form-control" id="tableDes" />
                    </div>
                  </div>
                   <div class="control-group">
                    <label for="disabled-input" class="control-label ">账号类型</label>
                    <div class="controls form-group">
                      <select id="tableType" class="form-control">
                      <option value ="大厅桌子">大厅桌子</option>
                      <option value ="包房">包房</option>
                      </select>
                    </div>
                  </div>
                  <div class="control-group">
                    <label for="max-length" class="control-label ">可容人数</label>
                    <div class="controls form-group">
                      <input type="text" data-placement="top" placeholder="" class="form-control"  id="tableCount" />
                    </div>
                  </div>
                </fieldset>
         		   </div>
                      </div>
                      <div class="modal-footer">
                        <button data-dismiss="modal" class="btn btn-default" type="button">关闭</button>
                        <button class="btn btn-primary" type="button" onclick="addTablePost();">提交</button>
                      </div>
                    </div>
                    <!-- /.modal-content --> 
                  </div>
                  <!-- /.modal-dialog --> 
                </div>
   <!-- 模态框结束 -->
   <!-- 模态框开始 -->
       <div style="display: none;" aria-hidden="true" aria-labelledby="myModalLabel" role="dialog" tabindex="-1" class="modal fade" id="editTableModel">
                  <div class="modal-dialog">
                    <div class="modal-content">
                      <div class="modal-header">
                        <button aria-hidden="true" data-dismiss="modal" class="close" type="button">x</button>
                        <h4 id="myModalLabel" class="modal-title">座位信息修改</h4>
                      </div>
                      <div class="modal-body">
                       <div>
                <fieldset>
                <input type="hidden" id="tableId"/>
                  <div class="control-group">
                    <label for="tooltip-enabled" class="control-label ">名称</label>
                    <div class="controls form-group">
                      <input type="text" placeholder="UserName"  data-placement="top" class="form-control" id="tableNameE" />
                    </div>
                  </div>
                  <div class="control-group">
                    <label for="disabled-input" class="control-label ">描述</label>
                    <div class="controls form-group">
                      <input type="text" placeholder="Account" data-placement="top" class="form-control" id="tableDesE" />
                    </div>
                  </div>
                   <div class="control-group">
                    <label for="disabled-input" class="control-label ">账号类型</label>
                    <div class="controls form-group">
                      <select id="tableTypeE" class="form-control">
                      <option value ="大厅桌子">大厅桌子</option>
                      <option value ="包房">包房</option>
                      </select>
                    </div>
                  </div>
                  <div class="control-group">
                    <label for="max-length" class="control-label ">可容人数</label>
                    <div class="controls form-group">
                      <input type="text" data-placement="top" placeholder="Tel" class="form-control"  id="tableCountE" />
                    </div>
                  </div>
                </fieldset>
         		   </div>
                      </div>
                      <div class="modal-footer">
                        <button data-dismiss="modal" class="btn btn-default" type="button">关闭</button>
                        <button class="btn btn-primary" type="button" onclick="editTablePost();">提交</button>
                      </div>
                    </div>
                    <!-- /.modal-content --> 
                  </div>
                  <!-- /.modal-dialog --> 
                </div>
   <!-- 模态框结束 -->
  <jsp:include page="footerPage.jsp"/>
   <script type="text/javascript" src="js/handlebars-v4.0.5.js"></script> 
    <script type="text/javascript" src="js/typeManage.js"></script> 
</body>
</html>
