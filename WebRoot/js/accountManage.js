var page = 1;
var size = 15;
var index = 0;
getData(page);

$(window).scroll(function () {
    var height = $(document).height(); //页面的高度
    var keheight = $(window).height(); //浏览器可视的高度
    var sheight = $(document).scrollTop(); //滚动的高度
    if (height <= keheight + sheight) {
       //alert("到底");
    	page++
    	getData(page);
    }
 
});
        


		//注册一个账号类型转换的Helper
         Handlebars.registerHelper({
         "strChange":function(v1,options){
           if(v1=="0"){
             return '<span class="rbd-btn badge-important">管理员</span>';
           }else if(v1=="1"){
             return '<span class="rbd-btn badge-success">员工-经理</span>';
           }else if(v1=="2"){
        	 return '<span class="rbd-btn badge-info">员工-服务员</span>';
           }else if(v1=="3"){
        	 return '<span class="rbd-btn badge-warning">员工-厨师</span>';
           }else if(v1=="4"){
        	 return '<span class="rbd-btn badge-inverse">用户</span>';
           }
           
         },
         "addIndex":function(v1,options){
        	 index++;
        	 return index;
         }
        });

      
          
var myTemplate = Handlebars.compile($("#table-template").html());

function getData(page){
	$.ajax({
        type: "POST",
        url: "/ssm/command/userAction",
        data: {
				ACTION:"queryList",
				START:(page-1)*size,
				LIMIT:size,
			   },
        dataType: "json",
        success: function(data){
				   if(parseInt(data.count)>=(page-1)*size)
				   $('#tableList').append(myTemplate(data));
				  
                 },
         error: function(data) {
                  alert("网络异常");
                 }
    });
}
function searchAccount(){
	index = 0;
	$.ajax({
        type: "POST",
        url: "/ssm/command/userAction",
        data: {
				ACTION:"queryList",
				USERNAME:$("#search-input").val(),
			   },
        dataType: "json",
        success: function(data){
				   $('#tableList').html(myTemplate(data));
				  
                 },
         error: function(data) {
                  alert("网络异常");
                 }
    });
}
function openDialog(id,flag){
	//alert(id);
	if(flag==0){
		delUser(id);
	}else if(flag==1){
		$('#editUser').modal('show');
		editUser(id);
	}
}

function editUser(id){
	$("#editId").val(id);
	$.ajax({
        type: "POST",
        url: "/ssm/command/userAction",
        data: {
				ACTION:"queryList",
				ID:id,
			   },
        dataType: "json",
        success: function(data){
				   //$("#password1").val();
					//$("#password2").val();
					$("#userNameE").val(data.data[0].username);
					$("#accountE").val(data.data[0].account);
					$("#telE").val(data.data[0].tel);
				    for(var i=0;i<$("#typeE option").length;i++){
					     if($("#typeE").find("option:eq("+i+")").val()==data.data[0].flag){
					      $("#typeE").find("option:eq("+i+")").attr("selected", true);
					     }
					    }
                 },
         error: function(data) {
                  alert("网络异常");
                 }
    });
}

//删除
function delUser(id){
	$.ajax({
        type: "POST",
        url: "/ssm/command/userAction",
        data: {
				ACTION:"update",
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
function addAccount(){
	$('#addUser').modal('show');
}

//添加提交
function addPost(id){
	var action = 'register';
	var pw1=$("#password1").val();
	var pw2=$("#password2").val();
	if($("#account").val().replace(/(^\s*)|(\s*$)/g,"")==""){
		alert("账号不能为空！");
		return false;
	}
	if(pw1!=pw2){
		alert("两次密码不一样！");
		return false;
	}
	$.ajax({
        type: "POST",
        url: "/ssm/command/userAction",
        data: {
				ACTION:action,
				PASSWORD:pw1,
				USERNAME:$("#userName").val(),
				ACCOUNT:$("#account").val(),
				TEL:$("#tel").val(),
				FLAG:$("#type").val(),
			   },
        dataType: "json",
        success: function(data){
				   if(data.result=='ok'){
				   alert("添加成功");
				   location.reload();
				   }else if(data.result=='error'){
				   alert(data.msg);
				   }
				  
                 },
         error: function(data) {
                  alert("网络异常");
                 }
    });
}

//修改提交
function editPost(){
	var action = 'update';
	var pw1=$("#password1E").val();
	var pw2=$("#password2E").val();
	if($("#accountE").val().replace(/(^\s*)|(\s*$)/g,"")==""){
		alert("账号不能为空！");
		return false;
	}
	if(pw1!=pw2){
		alert("两次密码不一样！");
		return false;
	}
	$.ajax({
        type: "POST",
        url: "/ssm/command/userAction",
        data: {
				ACTION:action,
				PASSWORD:pw1,
				USERNAME:$("#userNameE").val(),
				ACCOUNT:$("#accountE").val(),
				TEL:$("#telE").val(),
				FLAG:$("#typeE").val(),
				ID:$("#editId").val()
			   },
        dataType: "json",
        success: function(data){
				   if(data.result=='ok'){
				   alert("修改成功");
				   location.reload();
				   }
				  
                 },
         error: function(data) {
                  alert("网络异常");
                 }
    });
}