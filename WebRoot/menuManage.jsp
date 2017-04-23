<%@ page language="java" import="java.util.*" pageEncoding="utf-8" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
String httpIp = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort();
String mid2=request.getParameter("mid");
String pid=request.getParameter("pid");
if(pid==null)
	pid="1";
if(mid2==null)
	mid2="100";
%>
<!DOCTYPE html>
<html>
<head>
<title>菜单管理</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<!-- Bootstrap -->
<link href="css/bootstrap.css" rel="stylesheet" media="screen" />
<link href="css/thin-admin.css" rel="stylesheet" media="screen" />
<link href="css/font-awesome.css" rel="stylesheet" media="screen" />
<link href="style/style.css" rel="stylesheet" />
<link href="style/dashboard.css" rel="stylesheet" />
<link href="css/baguetteBox.min.css" rel="stylesheet" />
<script type="text/javascript">
	var jsIp='<%=httpIp%>';	
	var pid='<%=pid%>';
	var mid2='<%=mid2%>';
</script>
<!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
<!--[if lt IE 9]>
      <script src="../../assets/js/html5shiv.js"></script>
      <script src="../../assets/js/respond.min.js"></script>
    <![endif]-->
<style>

.text-overflow{
  width:150px;    
        white-space:nowrap;    
        word-break:keep-all;    
        overflow:hidden;    
        text-overflow:ellipsis;
}
</style>

<meta http-equiv="Content-Type" content="text/html; charset=utf-8" /></head>
<body>
 <jsp:include page="headPage.jsp"/>
   <div class="page-content">
       <div class="row">
        <div class="col-lg-12">
          <div class="widget">
            <div class="widget-header"> <i class="icon-list-ol"></i>
              <h3>菜单列表</h3>
               <input type="search" placeholder="搜索内容" id="search-input" class="input-sm text-left" style="margin-right: 10px;"/>
               <button type="button" class="btn btn-default btn-sm text-right" style="margin-right: 10px;" onclick="searchByName();" >搜索</button>
               <button type="button" class="btn btn-success btn-sm icon-plus-sign" style="margin-left: 100px;" onclick="addMenu();" > 添加菜单</button>
            </div>
            <div class="widget-content">
              <div class="body baguetteBox gallery" >
                <table class="table table-striped table-images">
                  <thead>
                    <tr>
                      <th class="hidden-xs-portrait">序号</th>
                      <th>图片</th>
                      <th>名称</th>
                      <th class="hidden-xs-portrait">价格（元）</th>
                      <th class="hidden-xs">描述</th>
                      <th class="hidden-xs">类别</th>
                      <th class="hidden-xs">销量/评分</th>
                      <th>&nbsp;</th>
                    </tr>
                  </thead>
                  <tbody id="tableList">
                  <script id="table-template" type="text/x-handlebars-template">
					{{#each data}}
                    <tr>
                      <td class="hidden-xs-portrait">{{addIndex 0}}</td>
                      <td><a href="{{imgUrl PIC_URL}}"><img src="{{imgUrl PIC_URL_S}}"></a></td>
                      <td> {{MENU_NAME}} </td>
                      <td class="hidden-xs-portrait"><p> <small>成本:&nbsp; {{MENU_COST}} </small> </p>
                        <p> <small> 售价: &nbsp; {{MENU_PRICE}} </small> </p></td>
                      <td ><p class='text-overflow' title="{{MENU_DES}}">{{MENU_DES}}</p></td>
                      <td class="hidden-xs">{{TYPE_NAME}}</td>
                      <td class="hidden-xs"><p> <small> {{COUNT}} </small> </p>
                        <p> <small> {{AVG_SCORE}} </small> </p></td>
                      <td><button class="btn btn-sm btn-primary" onclick="openDialog({{ID}},1)"> 修改 </button>
                        <button data-toggle="button" class="btn btn-sm btn-warning" onclick="openDialog({{ID}},0)"> 删除 </button></td>
                    </tr>
					{{/each}}
				  </script>
                  </tbody>
                </table>
              </div>
               <div class="clearfix">
                  <ul class="pagination no-margin">
                    <li class="disabled" id="prevBtn"><a href="#" id="prevHref">Prev</a></li>
                    <li id="nextBtn"><a href="#" id="nextHref">Next</a></li>
                  </ul>
                </div>
            </div>
          </div>
        </div>
      </div>
  </div>
  </div>
  <!-- 模态框开始 -->
       <div style="display: none;" aria-hidden="true" aria-labelledby="myModalLabel" role="dialog" tabindex="-1" class="modal fade" id="addMenu">
                  <div class="modal-dialog">
                    <div class="modal-content">
                      <div class="modal-header">
                        <button aria-hidden="true" data-dismiss="modal" class="close" type="button">x</button>
                        <h4 id="myModalLabel" class="modal-title">新增菜单</h4>
                      </div>
                      <div class="modal-body">
                       <div class="control-group">
                    <label for="tooltip-enabled" class="control-label ">菜单名称</label>
                    <div class="controls form-group">
                      <input type="text" placeholder="菜单名称"  data-placement="top" class="form-control" id="menuName" />
                    </div>
                	 </div>
                	<div class="control-group">
                    <label for="combined-input" class="control-label">售价</label>
                    <div class="controls form-group">
                      <div class="input-group"> <span class="input-group-addon">￥</span>
                        <input type="text" size="16" class="form-control" id="price" />
                        <span class="input-group-addon">.00</span> </div>
                    </div>
                  	</div>
                  	<div class="control-group">
                    <label for="combined-input" class="control-label">成本</label>
                    <div class="controls form-group">
                      <div class="input-group"> <span class="input-group-addon">￥</span>
                        <input type="text" size="16" class="form-control" id="cost" />
                        <span class="input-group-addon">.00</span> </div>
                    </div>
                  	</div>
                  	 <div class="control-group">
                    <label for="disabled-input" class="control-label ">类别</label>
                    <div class="controls form-group">
                      <select id="menuType" class="form-control">
                      </select>
                    </div>
                     <div class="control-group">
                    <label class="control-label" for="description">描述</label>
                    <div class="controls form-group">
                      <textarea class="form-control" name="text" rows="3" id="des"></textarea>
                      </div>
                  </div>
                  <div class="control-group">
                    <label class="control-label" for="description">图片</label>
                    <div class="controls form-group">
                     <input type="file" id ="menuPic" name="menuPic" class="form-control"/>
                      </div>
                  </div>
                  </div>
                      </div>
                      <div class="modal-footer">
                        <button data-dismiss="modal" class="btn btn-default" type="button">关闭</button>
                        <button class="btn btn-primary" type="button" onclick="addPost();">保存</button>
                      </div>
                    </div>
                    <!-- /.modal-content --> 
                  </div>
                  <!-- /.modal-dialog --> 
                </div>
   <!-- 模态框结束 -->
   <!-- 模态框开始 -->
       <div style="display: none;" aria-hidden="true" aria-labelledby="myModalLabel" role="dialog" tabindex="-1" class="modal fade" id="editMenu">
                  <div class="modal-dialog">
                    <div class="modal-content">
                      <div class="modal-header">
                        <button aria-hidden="true" data-dismiss="modal" class="close" type="button">x</button>
                        <h4 id="myModalLabel" class="modal-title">修改菜单</h4>
                      </div>
                      <div class="modal-body">
                      <input type="hidden" id="editId"/>
                       <div class="control-group">
                    <label for="tooltip-enabled" class="control-label ">菜单名称</label>
                    <div class="controls form-group">
                      <input type="text" placeholder="菜单名称"  data-placement="top" class="form-control" id="menuNameE" />
                    </div>
                	 </div>
                	<div class="control-group">
                    <label for="combined-input" class="control-label">售价</label>
                    <div class="controls form-group">
                      <div class="input-group"> <span class="input-group-addon">￥</span>
                        <input type="text" size="16" class="form-control" id="priceE" />
                        <span class="input-group-addon">.00</span> </div>
                    </div>
                  	</div>
                  	<div class="control-group">
                    <label for="combined-input" class="control-label">成本</label>
                    <div class="controls form-group">
                      <div class="input-group"> <span class="input-group-addon">￥</span>
                        <input type="text" size="16" class="form-control" id="costE" />
                        <span class="input-group-addon">.00</span> </div>
                    </div>
                  	</div>
                  	 <div class="control-group">
                    <label for="disabled-input" class="control-label ">类别</label>
                    <div class="controls form-group">
                      <select id="menuTypeE" class="form-control">
                      </select>
                    </div>
                     <div class="control-group">
                    <label class="control-label" for="description">描述</label>
                    <div class="controls form-group">
                      <textarea class="form-control" name="text" rows="3" id="desE"></textarea>
                      </div>
                  </div>
                  <div class="control-group">
                    <label class="control-label" for="description">图片</label>
                    <div class="controls form-group">
                     <input type="file" id ="menuPicE" name="menuPic" class="form-control"/>
                      </div>
                  </div>
                  </div>
                      </div>
                      <div class="modal-footer">
                        <button data-dismiss="modal" class="btn btn-default" type="button">关闭</button>
                        <button class="btn btn-primary" type="button" onclick="editPost();">保存</button>
                      </div>
                    </div>
                    <!-- /.modal-content --> 
                  </div>
                  <!-- /.modal-dialog --> 
                </div>
   <!-- 模态框结束 -->
  <jsp:include page="footerPage.jsp"/>

<script type="text/javascript" src="js/baguetteBox.min.js"></script> 
<script type="text/javascript" src="js/handlebars-v4.0.5.js"></script> 
<script type="text/javascript" src="js/ajaxfileupload.js"></script>
<script type="text/javascript" src="js/menuManage.js"></script> 
</body>
</html>
