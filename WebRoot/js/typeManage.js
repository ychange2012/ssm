var page = 1;
var size = 15;
var index = 0;
var index2 = 0;
$(window).scroll(function () {
    var height = $(document).height(); //页面的高度
    var keheight = $(window).height(); //浏览器可视的高度
    var sheight = $(document).scrollTop(); //滚动的高度
    if (height <= keheight + sheight) {
       //alert("到底");
    	page++
    	getData(page);//座位列表异步加载
    }
 
});
getData(page);//座位列表
getAllData();//菜单类型

//注册一个账号类型转换的Helper
Handlebars.registerHelper({
"addIndex":function(v1,options){
	 index++;
	 return index;
},
"addIndex2":function(v1,options){
	 index2++;
	 return index2;
},
});

var menuTypeTemp = Handlebars.compile($("#menuType-template").html());
var tableTemp = Handlebars.compile($("#table-template").html());

//获取菜单类型字典
function getAllData(){
	$.ajax({
        type: "POST",
        url: "/ssm/command/menuAction",
        data: {
				ACTION:"queryTypeList",
			   },
        dataType: "json",
        success: function(data){
				  $('#typeList').append(menuTypeTemp(data));
                 },
         error: function(data) {
                  alert("网络异常");
                 }
    });
}


function getData(page){
	$.ajax({
        type: "POST",
        url: "/ssm/command/tableAction",
        data: {
				ACTION:"queryTable",
				START:(page-1)*size,
				LIMIT:size,
			   },
        dataType: "json",
        success: function(data){
				   if(parseInt(data.count)>=(page-1)*size)
				   $('#tableList').append(tableTemp(data));
				  
                 },
         error: function(data) {
                  alert("网络异常");
                 }
    });
}

//提交新的类型
function addTypePost(){
	$.ajax({
        type: "POST",
        url: "/ssm/command/menuAction",
        data: {
				ACTION:"addType",
				TYPE_NAME:$("#typeName").val(),
			   },
        dataType: "json",
        success: function(data){
				  if(data.result=='ok'){
					  //alert("添加成功");
					  location.reload();
				  }
				  else
					  alert(data.msg);
                 },
         error: function(data) {
                  alert("网络异常");
                 }
    });
}

//提交修改菜单类型
function editTypePost(){
	$.ajax({
        type: "POST",
        url: "/ssm/command/menuAction",
        data: {
				ACTION:"updateType",
				TYPE_NAME:$("#typeNameE").val(),
				ID:$("#typeId").val()
			   },
        dataType: "json",
        success: function(data){
				  if(data.result=='ok'){
					  //alert("修改成功");
					  location.reload();
				  }
				  else
					  alert(data.msg);
                 },
         error: function(data) {
                  alert("网络异常");
                 }
    });
}

//打开添加框
function addType(){
	$('#addTypeModel').modal('show');
}

function addTable(){
	$('#addTableModel').modal('show');
}
//打开修改编辑框
function editType(id){
	$("#typeId").val(id);
	$.ajax({
        type: "POST",
        url: "/ssm/command/menuAction",
        data: {
				ACTION:"queryTypeList",
				ID:id
			   },
        dataType: "json",
        success: function(data){
				   $("#typeNameE").val(data.data[0].TYPE_NAME);
				   $('#editTypeModel').modal('show');
                 },
         error: function(data) {
                  alert("网络异常");
                 }
    });
	
}

//删除
function delType(id){
	$.ajax({
        type: "POST",
        url: "/ssm/command/menuAction",
        data: {
				ACTION:"deleteType",
				ID:id
			   },
        dataType: "json",
        success: function(data){
				location.reload();
                 },
         error: function(data) {
                  alert("网络异常");
                 }
    });
}


//打开修改编辑框(table)
function editTable(id){
	$("#tableId").val(id);
	$.ajax({
        type: "POST",
        url: "/ssm/command/tableAction",
        data: {
				ACTION:"queryTable",
				ID:id
			   },
        dataType: "json",
        success: function(data){
				   $("#tableNameE").val(data.data[0].TABLE_NAME);
				   $("#tableDesE").val(data.data[0].TABLE_DES);
				   $("#tableCountE").val(data.data[0].COUNT);
				   for(var i=0;i<$("#tableTypeE option").length;i++){
					     if($("#tableTypeE").find("option:eq("+i+")").val()==data.data[0].TYPE){
					      $("#tableTypeE").find("option:eq("+i+")").attr("selected", true);
					     }
					    }
				   $('#editTableModel').modal('show');
                 },
         error: function(data) {
                  alert("网络异常");
                 }
    });
	
}

//删除(table)
function delTable(id){
	$.ajax({
        type: "POST",
        url: "/ssm/command/tableAction",
        data: {
				ACTION:"deleteTable",
				ID:id
			   },
        dataType: "json",
        success: function(data){
				location.reload();
                 },
         error: function(data) {
                  alert("网络异常");
                 }
    });
}

//座位新建的提交
function addTablePost(){
	$.ajax({
        type: "POST",
        url: "/ssm/command/tableAction",
        data: {
				ACTION:"addTable",
				TABLE_DES:$("#tableDes").val(),
				COUNT:$("#tableCount").val(),
				TABLE_NAME:$("#tableName").val(),
				TYPE:$("#tableType").val(),
			   },
        dataType: "json",
        success: function(data){
				   if(data.result=='ok'){
					   alert("添加成功");
					   location.reload();
				   }
				   else
					   alert("添加失败");
                 },
         error: function(data) {
                  alert("网络异常");
                 }
    });
}

//座位修改过的提交
function editTablePost(){
	$.ajax({
        type: "POST",
        url: "/ssm/command/tableAction",
        data: {
				ACTION:"updateTable",
				ID:$("#tableId").val(),
				TABLE_DES:$("#tableDesE").val(),
				COUNT:$("#tableCountE").val(),
				TABLE_NAME:$("#tableNameE").val(),
				TYPE:$("#tableTypeE").val(),
			   },
        dataType: "json",
        success: function(data){
				   if(data.result=='ok'){
					   alert("修改成功");
					   location.reload();
				   }
				   else
					   alert("添加失败");
                 },
         error: function(data) {
                  alert("网络异常");
                 }
    });
	
}