$(document).ready(function(){
$(function(){
	getData(page);
	initType();
	if(parseInt(pid)>1)
	$("#prevBtn").attr("class","");
	$("#prevHref").attr("href","menuManage.jsp?mid"+mid2+"&pid="+parseInt(parseInt(pid)-1));
	$("#nextHref").attr("href","menuManage.jsp?mid"+mid2+"&pid="+parseInt(parseInt(pid)+1));
});
	})
var page = pid;
var size = 15;
var index = 0;

/*
$(window).scroll(function () {
    var height = $(document).height(); //页面的高度
    var keheight = $(window).height(); //浏览器可视的高度
    var sheight = $(document).scrollTop(); //滚动的高度
    if (height <= keheight + sheight) {
       //alert("到底");
    	page++;
    	getData(page);
    	getData(1);
    }
 
});
  */      


		//注册一个账号类型转换的Helper
         Handlebars.registerHelper({
         "imgUrl":function(v1,options){
        	 v1=v1+"";
        	 return jsIp+"/"+v1.substr(3);
         },
         "addIndex":function(v1,options){
        	 index++;
        	 return index;
         }
        });

      
          


function getData(page){
	$.ajax({
        type: "POST",
        url: "/ssm/command/menuAction",
        async: false,
        data: {
				ACTION:"queryList",
				START:(page-1)*size,
				LIMIT:size,
			   },
        dataType: "json",
        success: function(data){
				   var myTemplate = Handlebars.compile($("#table-template").html());
				   if(parseInt(data.count)>=(page-1)*size){
					   $('#tableList').append(myTemplate(data));
				  // else
					   $("#nextBtn").attr('class',"disabled");
				   }
				   baguetteBox.run('.baguetteBox');
                 },
         error: function(data) {
                  alert("网络异常");
                 }
    });
}

function openDialog(id,flag){
	//alert(id);
	if(flag==0){
		delMenu(id);
	}else if(flag==1){
		$('#editMenu').modal('show');
		editEdit(id);
	}
}

function editEdit(id){
	$("#editId").val(id);
	$.ajax({
        type: "POST",
        url: "/ssm/command/menuAction",
        data: {
				ACTION:"queryMenu",
				ID:id,
			   },
        dataType: "json",
        success: function(data){
				   $("#menuNameE").val(data.data[0].MENU_NAME);
				   $("#priceE").val(data.data[0].MENU_PRICE);
		    	   $("#desE").val(data.data[0].MENU_DES);
		    	   $("#costE").val(data.data[0].MENU_COST);
				    for(var i=0;i<$("#menuTypeE option").length;i++){
					     if($("#menuTypeE").find("option:eq("+i+")").val()==data.data[0].TYPE){
					      $("#menuTypeE").find("option:eq("+i+")").attr("selected", true);
					     }
					    }
                 },
         error: function(data) {
                  alert("网络异常");
                 }
    });
}

//删除
function delMenu(id){
	$.ajax({
        type: "POST",
        url: "/ssm/command/menuAction",
        data: {
				ACTION:"updateMenu",
				ID:id,
				IS_DELETE:'1',
			   },
        dataType: "json",
        success: function(data){
				   if(data.result=='ok'){
					   alert("删除成功");
					   location.reload();
				   }else{
					   alert("删除失败");
				   }
                 },
         error: function(data) {
                  alert("网络异常");
                 }
    });
}

//添加
function addMenu(){
	$('#addMenu').modal('show');
}

//添加提交
function addPost(){
	var price = $("#price").val();
	var cost = $("#cost").val();
	if($("#menuName").val().replace(/(^\s*)|(\s*$)/g,"")==""){
		alert("名称不能为空！");
		return false;
	}
	if(parseInt(price)<=parseInt(cost)){
		alert("售价不能低于成本");
		return false;
	}
	if($("#menuPic").val()!="")
	 $.ajaxFileUpload({
		    url:"/ssm/upload.jsp?isSmall=1",
		            secureuri:false,// 安全提交，默认为false
		             fileElementId:"menuPic",// 文件input标签的id
		             dataType:"json",// 返回值类型
		             success:function(data){// 服务器响应成功
		             //alert(JSON.stringify(data));
		 $.ajax({
		      url :"/ssm/command/menuAction",
		      type:"POST",
		      dataType:"JSON",
		      data:{
		    	   ACTION:"addMenu",
		    	   MENU_NAME:$("#menuName").val(),
		    	   MENU_PRICE:$("#price").val(),
		    	   MENU_DES:$("#des").val(),
		    	   MENU_COST:$("#cost").val(),
		    	   PIC_URL:data.FileNamePath,
		    	   PIC_URL_S:data.FileNamePath_s,
		    	   TYPE:$("#menuType").val(),
		      },
		      success:function (data2) {
		       //alert("上传成功");
		    	  $('#addMenu').modal('hide');
		    	  location.reload();
		      },
		      error:function(data2){
		       alert("数据保存错误");
		      }
		     });    
				     
		       },
		       error:function(data, status, e){// 服务器响应失败
		        alert("数据格式错误"+e);
		       }
		   });
	else{
		 $.ajax({
		      url :"/ssm/command/menuAction",
		      type:"POST",
		      dataType:"JSON",
		      data:{
		    	   ACTION:"addMenu",
		    	   MENU_NAME:$("#menuName").val(),
		    	   MENU_PRICE:$("#price").val(),
		    	   MENU_DES:$("#des").val(),
		    	   MENU_COST:$("#cost").val(),
		    	   TYPE:$("#menuType").val()
		      },
		      success:function (data2) {
		       //alert("上传成功");
		    	  $('#addMenu').modal('hide');
		    	  location.reload();
		      },
		      error:function(data2){
		       alert("数据保存错误");
		      }
		     });    
	}
}

//修改提交
function editPost(){
	var price = $("#priceE").val();
	var cost = $("#costE").val();
	if($("#menuNameE").val().replace(/(^\s*)|(\s*$)/g,"")==""){
		alert("名称不能为空！");
		return false;
	}
	if(parseInt(price)<=parseInt(cost)){
		alert("售价不能低于成本");
		return false;
	}
	if($("#menuPicE").val()!="")
	 $.ajaxFileUpload({
		    url:"/ssm/upload.jsp?isSmall=1",
		            secureuri:false,// 安全提交，默认为false
		             fileElementId:"menuPicE",// 文件input标签的id
		             dataType:"json",// 返回值类型
		             success:function(data){// 服务器响应成功
		             //alert(JSON.stringify(data));
		 $.ajax({
		      url :"/ssm/command/menuAction",
		      type:"POST",
		      dataType:"JSON",
		      data:{
		    	   ACTION:"updateMenu",
		    	   MENU_NAME:$("#menuNameE").val(),
		    	   MENU_PRICE:$("#priceE").val(),
		    	   MENU_DES:$("#desE").val(),
		    	   MENU_COST:$("#costE").val(),
		    	   PIC_URL:data.FileNamePath,
		    	   PIC_URL_S:data.FileNamePath_s,
		    	   TYPE:$("#menuTypeE").val(),
		    	   ID:$("#editId").val()
		      },
		      success:function (data2) {
		       //alert("上传成功");
		    	  $('#editMenu').modal('hide');
		    	  location.reload();
		      },
		      error:function(data2){
		       alert("数据保存错误");
		      }
		     });    
				     
		       },
		       error:function(data, status, e){// 服务器响应失败
		        alert("数据格式错误"+e);
		       }
		   });
	else{
		 $.ajax({
		      url :"/ssm/command/menuAction",
		      type:"POST",
		      dataType:"JSON",
		      data:{
		    	   ACTION:"updateMenu",
		    	   MENU_NAME:$("#menuNameE").val(),
		    	   MENU_PRICE:$("#priceE").val(),
		    	   MENU_DES:$("#desE").val(),
		    	   MENU_COST:$("#costE").val(),
		    	   TYPE:$("#menuTypeE").val(),
		    	   ID:$("#editId").val()
		      },
		      success:function (data2) {
		       //alert("上传成功");
		    	  $('#editMenu').modal('hide');
		    	  location.reload();
		      },
		      error:function(data2){
		       alert("数据保存错误");
		      }
		     });    
	}
}

//初始化菜单的下拉
function initType(){
	$("#menuType option").remove();
	$("#menuTypeE option").remove();
	$.ajax({
        type: "POST",
        url: "/ssm/command/menuAction",
        data: {
				ACTION:"queryTypeList",
			   },
        dataType: "json",
        success: function(data){
				 for(i=0;i<data.data.length;i++){
					 $("#menuType").append("<option value='"+data.data[i].ID+"'>"+data.data[i].TYPE_NAME+"</option>");
					 $("#menuTypeE").append("<option value='"+data.data[i].ID+"'>"+data.data[i].TYPE_NAME+"</option>");
				 }
                 },
         error: function(data) {
                  alert("网络异常");
                 }
    });
}

function searchByName(){
	$.ajax({
        type: "POST",
        url: "/ssm/command/menuAction",
        data: {
				ACTION:"queryList",
				MENU_NAME:$("#search-input").val(),
			   },
        dataType: "json",
        success: function(data){
				   index = 0;
				   var myTemplate = Handlebars.compile($("#table-template").html());
				   $('#tableList').html(myTemplate(data));
				   baguetteBox.run('.baguetteBox');
				   $("#nextBtn").attr('class',"disabled");
				   $("#prevBtn").attr('class',"disabled");
                 },
         error: function(data) {
                  alert("网络异常");
                 }
    });
}