//var mendId = 104;
if(mendId==0){
	mendId=100;
}
$.ajaxSetup({
    global: false,
    type: "POST",
    complete: function (XMLHttpRequest, textStatus) {
    var sessionStatus = XMLHttpRequest.getResponseHeader("sessionstatus");
    if (sessionStatus == 'timeout') {
    	window.top.location =XMLHttpRequest.getResponseHeader("outsideOfficeHoursPage");
        }
    }
});
getMenu();

function getUserName(){
	$.ajax({
        type: "POST",
        async: false,
        url: "/ssm/command/userAction",
        data: {
				ACTION:"getSession"
			   },
        dataType: "json",
        success: function(data){
				   $("#nameTitle").append(data.data.username);
                 },
         error: function(data) {
                  //alert("网络异常");
                 }
    });
}
function getMenu(){
	$.ajax({
        type: "POST",
        async: false,
        url: "/ssm/command/userAction",
        data: {
				ACTION:"queryMenConf"
			   },
        dataType: "json",
        success: function(data){
                   initMenu(data);
                   
                 },
         error: function(data) {
                  //alert("网络异常");
                 }
    });

}

function initMenu(data){
   var nav = $("#nav");
    var str="";
    for(i=0;i<data.data.length;i++){
    	//alert(i);
    	str="";
        if(data.data[i].PID==0){
        	var k=0;
            if(data.data[i].ID==mendId){
            if(data.data[i].COUNT==0)
            str=str+'<li class="current"> <a href="'+data.data[i].URL+"?mid="+data.data[i].ID+'"> <i class="'+data.data[i].ICON+'"></i>'+data.data[i].NAME+'</a> </li>';
            else{
            str=str+'<li class="current"> <a href="'+data.data[i].URL+"?mid="+data.data[i].ID+'"> <i class="'+data.data[i].ICON+'"></i>'+data.data[i].NAME+'<i class="arrow icon-angle-left"></i></a>  <ul class="sub-menu">';
            for(x=0;x<data.data.length;x++){
            	if(data.data[x].PID==data.data[i].ID){
                    if(data.data[x].ID==mendId)
                    	str=str+'<ul class="sub-menu opened">';
                    else
                    	str=str+'<ul class="sub-menu">';
            }
            }
            for(j=0;j<data.data.length;j++){
                if(data.data[j].PID==data.data[i].ID){
                    if(data.data[j].ID==mendId)
                        str=str+'<li class="current"> <a href="'+data.data[i].URL+"?mid="+data.data[i].ID+'"><i class="'+data.data[i].ICON+'"></i>'+data.data[i].NAME+'/a> </li>';
                    else
                        str=str+'<li> <a href="'+data.data[i].URL+"?mid="+data.data[i].ID+'"> <i class="'+data.data[i].ICON+'"></i>'+data.data[i].NAME+'/a> </li>';
                    k++;
                }
            }
            if(k!=0)
                str=str+'</li></ul>'; 
            }
            }else{
            	var k =0;
            if(data.data[i].COUNT==0)
            str=str+'<li> <a href="'+data.data[i].URL+"?mid="+data.data[i].ID+'"> <i class="'+data.data[i].ICON+'"></i>'+data.data[i].NAME+'</a> </li>';
            else{
            str=str+'<li> <a href="'+data.data[i].URL+"?mid="+data.data[i].ID+'"> <i class="'+data.data[i].ICON+'"></i>'+data.data[i].NAME+'<i class="arrow icon-angle-left"></i></a> ';
            for(x=0;x<data.data.length;x++){
            	if(data.data[x].PID==data.data[i].ID){
                    if(data.data[x].ID==mendId)
                    	str=str+'<ul class="sub-menu opened">';
                    else
                    	str=str+'<ul class="sub-menu">';
            }
            }
            for(j=0;j<data.data.length;j++){
                if(data.data[j].PID==data.data[i].ID){
                    if(data.data[j].ID==mendId)
                        str=str+'<li class="current"> <a href="'+data.data[j].URL+"?mid="+data.data[i].ID+'"><i class="'+data.data[j].ICON+'"></i>'+data.data[j].NAME+'</a> </li>';
                    else
                        str=str+'<li> <a href="'+data.data[j].URL+"?mid="+data.data[i].ID+'"> <i class="'+data.data[j].ICON+'"></i>'+data.data[j].NAME+'</a> </li>';
                   k++;
                }
                
            }
            if(k!=0)
                str=str+'</li></ul>'; 
            }
            }
        }
        nav.append(str);
        //alert("00");
    }
//append
    //alert(str);
    getUserName();
}
//jQuery.noConflict();
