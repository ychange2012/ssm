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
             return '<span class="rbd-btn badge-info">过期</span>';
           }else if(v1=="1"){
             return '<span class="rbd-btn badge-success">正常</span>';
           }else if(v1=="2"){
        	   return '<span class="rbd-btn badge-warning">已完成</span>';
           }
           
         },
         "addIndex":function(v1,options){
        	 index++;
        	 return index;
         },
         "delNull":function(v1,options){
        	 if(v1==null||v1=="")
        	 return "0";
        	 else
        		 return v1;
         }
        });

      
          
var myTemplate = Handlebars.compile($("#table-template").html());
var modelTemplate = Handlebars.compile($("#model-template").html());
function getData(page){
	$.ajax({
        type: "POST",
        url: "/ssm/command/orderAction",
        data: {
				ACTION:"queryHistoryOrder",
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

function openDialog(id){
	//alert(id);
	$("#orderDetail").modal('show');
	$.ajax({
        type: "POST",
        url: "/ssm/command/orderAction",
        data: {
				ACTION:"queryDetail",
				ORDER_ID:id
			   },
        dataType: "json",
        success: function(data){
				   $('#modalList').html(modelTemplate(data));
				  
                 },
         error: function(data) {
                  alert("网络异常");
                 }
    });
}

function searchByDate(){
	$.ajax({
        type: "POST",
        url: "/ssm/command/orderAction",
        data: {
				ACTION:"queryHistoryOrder",
				TIMESTRBEGIN:$("#search-input").val()+" 00:00:00",
				TIMESTREND:$("#search-input").val()+" 23:59:59",
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