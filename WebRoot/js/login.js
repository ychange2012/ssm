$("#account")[0].focus();
function loginPost(){
	$.ajax({
        type: "POST",
        url: "/ssm/loginCommand",
        data: {ACCOUNT:$("#account").val(),
				PASSWORD:$("#password").val(),
				ACTION:"login"
			   },
        dataType: "json",
        success: function(data){
                   if(data.result=='ok')
                   {
                	   //alert("登录成功");
                	   //alert(data.data[0].username);
                	   window.location.href="chart.jsp"; 
                   }
                   else
                   {
                	   alert("账号或密码错误，请重新填写！");
                   }
                 },
         error: function(data) {
                  alert("网络异常");
                 }
    });

}

document.onkeydown = function(event_e){  
    if(window.event) {  
        event_e = window.event;  
    }  

    var int_keycode = event_e.charCode||event_e.keyCode;  
    if( int_keycode == '13' ) {  
        //your handler function,please.  
    	loginPost();  
        return false;  
    }  
}