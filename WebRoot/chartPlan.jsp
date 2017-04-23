<%@ page language="java" import="java.util.*" pageEncoding="utf-8" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
String httpIp = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort();
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
        <div class="col-md-12">
          <h2 class="page-title">Charts and Statistics</h2>
        </div>
      </div>
      <div class="row">
        <div class="col-lg-8">
          <div class="widget">
            <div class="widget-header"> <i class="icon-tasks"></i>
              <h3>Bar Line Animated</h3>
            </div>
            <div class="widget-content">
              <div id="chart1" style="width:100%; height:350px"></div>
            </div>
          </div>
        </div>
        <div class="col-lg-4">
          <div class="widget">
            <div class="widget-header"> <i class="icon-tasks"></i>
              <h3>Pie Test</h3>
            </div>
            <div class="widget-content">
              <div id="chart7" style="width:100%; height:350px;"></div>
            </div>
          </div>
        </div>
      </div>
      
        <div class="row">
        <div class="col-lg-8">
          <div class="widget">
            <div class="widget-header"> <i class="icon-tasks"></i>
              <h3>Axis Renderer</h3>
            </div>
            <div class="widget-content">
              <div id="chart4" style="width:100%; height:350px;"></div>
            </div>
          </div>
        </div>
        <div class="col-lg-4">
          <div class="widget">
            <div class="widget-header"> <i class="icon-tasks"></i>
              <h3>Line Charts</h3>
            </div>
            <div class="widget-content">
              <div id="chart5" style="height:350px; width:100%;"></div>
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
<script class="include" type="text/javascript" src="javascript/bar-animated.js"></script> <!-- 左上柱状 char1 -->
<script class="include" type="text/javascript" src="javascript/widget.js"></script> 
<script class="include" type="text/javascript" src="javascript/jqplot.dateAxisRenderer.min.js"></script> 
<script class="include" type="text/javascript" src="javascript/jqplot.logAxisRenderer.min.js"></script> 
<script class="include" type="text/javascript" src="javascript/jqplot.canvasTextRenderer.min.js"></script> 
<script class="include" type="text/javascript" src="javascript/jqplot.canvasAxisTickRenderer.min.js"></script> 
<script class="include" type="text/javascript" src="javascript/jqplot.pieRenderer.min.js"></script> 
<script class="include" type="text/javascript" src="javascript/pie-test.js"></script> <!-- 右上 char7 -->
<script class="include" language="javascript" type="text/javascript" src="javascript/jqplot.donutRenderer.min.js"></script> 
<script class="include" type="text/javascript" src="javascript/donut-render.js"></script> 
<script class="include" language="javascript" type="text/javascript" src="javascript/jqplot.categoryAxisRenderer.min.js"></script> 
<script class="include" type="text/javascript" src="javascript/bar-charts.js"></script> <!-- 左下柱状 char4 -->
<script class="include" type="text/javascript" src="javascript/line-charts.js"></script> <!-- 右下折线 char5 -->
<!-- End additional plugins -->
</body>
</html>
